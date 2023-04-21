from typing import List, Optional, Tuple

from dna import BinaryStreamReader as DNAReader
from dna import DataLayer_All, FileStream, Status

from ..common import DNAViewerError
from ..model import UV, BlendShape, Joint, Layout, Point3
from .behavior import Behavior
from .geometry import Geometry
from .layer import Layer


class DNA(Behavior, Geometry):
    """
    A class used for accessing data in DNA file.

    @type dna_path: str
    @param dna_path: The path of the DNA file

    @type layers: Optional[List[Layer]]
    @param layers: List of parts of DNA to be loaded. If noting is passed, whole DNA is going to be loaded. Same as
        passing Layer.all.
    """

    def __init__(self, dna_path: str, layers: Optional[List[Layer]] = None) -> None:
        self.path = dna_path
        self.reader = self.create_reader(dna_path)
        layers = layers or [Layer.all]
        Behavior.__init__(self, self.reader, layers)
        Geometry.__init__(self, self.reader, layers)
        self.read()

    def create_reader(self, dna_path: str) -> DNAReader:
        """
        Creates a stream reader needed for reading values from the DNA file.

        @type dna_path: str
        @param dna_path: The path of the DNA file

        @rtype: DNA
        @returns: The reader needed for reading values from the DNA file
        """

        stream = FileStream(
            dna_path, FileStream.AccessMode_Read, FileStream.OpenMode_Binary
        )

        reader = DNAReader(stream, DataLayer_All)
        reader.read()
        if not Status.isOk():
            status = Status.get()
            raise RuntimeError(f"Error loading DNA: {status.message}")
        return reader

    def is_read(self) -> bool:
        return Behavior.is_read(self) and Geometry.is_read(self)

    def read(self) -> None:
        if not self.is_read():
            self.start_read()
            Behavior.read(self)
            Geometry.read(self)

    def read_all_neutral_joints(self) -> List[Joint]:
        joints = []
        for i in range(self.get_joint_count()):
            name = self.get_joint_name(i)
            translation = self.get_neutral_joint_translation(i)
            orientation = self.get_neutral_joint_rotation(i)
            parent_name = self.get_joint_name(self.get_joint_parent_index(i))

            joint = Joint(
                name=name,
                translation=translation,
                orientation=orientation,
                parent_name=parent_name,
            )

            joints.append(joint)

        return joints

    def get_all_skin_weights_joint_indices_for_mesh(
        self, mesh_index: int
    ) -> List[List[int]]:
        return self.geometry_meshes[mesh_index].skin_weights.joint_indices

    def get_blend_shape_target_deltas_with_vertex_id(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> List[Tuple[int, Point3]]:
        blend_shape = self.geometry_meshes[mesh_index].blend_shapes[
            blend_shape_target_index
        ]
        indices = list(blend_shape.deltas.keys())

        deltas: List[Point3] = []
        for i in indices:
            deltas.append(blend_shape.deltas[i])

        if not deltas:
            return []

        return list(zip(indices, deltas))

    def get_all_skin_weights_values_for_mesh(
        self, mesh_index: int
    ) -> List[List[float]]:
        skin_weight_values = []
        mesh = self.geometry_meshes[mesh_index]
        for i in range(len(mesh.topology.positions)):
            skin_weight_values.append(mesh.skin_weights.values[i])

        return skin_weight_values

    def get_skin_weight_matrix_for_mesh(
        self, mesh_index: int
    ) -> List[List[Tuple[int, float]]]:
        vertex_position_count = len(self.geometry_meshes[mesh_index].topology.positions)

        joint_indices = self.get_all_skin_weights_joint_indices_for_mesh(mesh_index)
        if len(joint_indices) != vertex_position_count:
            raise DNAViewerError(
                "Number of joint indices and vertex count don't match!"
            )

        skin_weight_values = self.get_all_skin_weights_values_for_mesh(mesh_index)

        if len(skin_weight_values) != vertex_position_count:
            raise DNAViewerError(
                "Number of skin weight values and vertex count don't match!"
            )
        if len(joint_indices) != len(skin_weight_values):
            raise DNAViewerError(
                "Number of skin weight values and joint indices count don't match for vertex!"
            )

        weight_matrix = []
        for indices, values in zip(joint_indices, skin_weight_values):
            if not indices:
                raise DNAViewerError(
                    "JointIndexArray for vertex can't be less than one!"
                )
            vertex_weights = []
            for joint_index, skin_weight_value in zip(indices, values):
                vertex_weights.append((joint_index, skin_weight_value))
            weight_matrix.append(vertex_weights)
        return weight_matrix

    def get_vertex_texture_coordinates_for_mesh(self, mesh_index: int) -> List[UV]:
        return self.geometry_meshes[mesh_index].topology.texture_coordinates

    def get_vertex_positions_for_mesh_index(self, mesh_index: int) -> List[Point3]:
        return self.geometry_meshes[mesh_index].topology.positions

    def get_vertex_layout_positions_for_mesh_index(self, mesh_index: int) -> List[int]:
        return [
            item.position_index
            for item in self.geometry_meshes[mesh_index].topology.layouts
        ]

    def get_faces(self, mesh_index: int) -> List[List[int]]:
        return self.geometry_meshes[mesh_index].topology.face_vertex_layouts

    def get_polygon_faces_and_connects(
        self,
        mesh_index: int = None,
        dna_faces: List[List[int]] = None,
        dna_vertex_layout_positions: List[int] = None,
    ) -> Tuple[List[int], List[int]]:
        if mesh_index is None:
            if None in (dna_faces, dna_vertex_layout_positions):
                raise DNAViewerError(
                    "get_polygon_faces_and_connects -> Must provide either mesh_index or dna_faces and dna_vertex_layout_positions"
                )
        if dna_faces is None:
            dna_faces = self.get_faces(mesh_index)
        if dna_vertex_layout_positions is None:
            dna_vertex_layout_positions = (
                self.get_vertex_layout_positions_for_mesh_index(mesh_index)
            )

        polygon_faces = []
        polygon_connects = []
        for vertices_layout_index_array in dna_faces:
            polygon_faces.append(len(vertices_layout_index_array))
            for vertex_layout_index_array in vertices_layout_index_array:
                polygon_connects.append(
                    dna_vertex_layout_positions[vertex_layout_index_array]
                )

        return polygon_faces, polygon_connects

    def get_layouts_for_mesh_index(self, mesh_index: int) -> List[Layout]:
        return self.geometry_meshes[mesh_index].topology.layouts

    def get_texture_coordinate_index(self, mesh_index: int, layout_id: int) -> int:
        return (
            self.geometry_meshes[mesh_index]
            .topology.layouts[layout_id]
            .texture_coordinate_index
        )

    def has_blend_shapes(self, mesh_index: int) -> bool:
        return (
            len([bs.channel for bs in self.geometry_meshes[mesh_index].blend_shapes])
            > 0
        )

    def get_lowest_lod_containing_meshes(
        self, mesh_indices: List[int]
    ) -> Optional[int]:
        unique_mesh_indices = set(mesh_indices)
        for lod in range(self.get_lod_count()):
            if any(list(unique_mesh_indices & set(self.get_mesh_indices_for_lod(lod)))):
                return lod
        return None

    def get_meshes_by_lods(self, mesh_indices: List[int]) -> List[List[int]]:
        result_list = []
        for lod in range(self.get_lod_count()):
            temp = list(set(mesh_indices) & set(self.get_mesh_indices_for_lod(lod)))
            result_list.append(temp)
        return result_list

    def get_all_meshes_grouped_by_lod(self) -> List[List[int]]:
        """
        Gets the list of list of mesh indices grouped by the lod number.

        @type dna: DNA
        @param dna: Instance of DNA.

        @rtype: List[List[int]]
        @returns: The list of list of mesh indices grouped by the lod number
        """

        result: List[List[int]] = []

        for lod in range(self.get_lod_count()):
            mesh_indices = []
            for mesh_index in self.get_mesh_indices_for_lod(lod):
                mesh_indices.append(mesh_index)
            result.append(mesh_indices)

        return result

    def get_blend_shapes(self, mesh_index: int) -> List[BlendShape]:
        return self.geometry_meshes[mesh_index].blend_shapes

    def get_mesh_id_from_mesh_name(self, mesh_name: str) -> Optional[int]:
        return self.meshes_mapping.get(mesh_name, None)
