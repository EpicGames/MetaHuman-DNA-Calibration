from dataclasses import dataclass, field
from typing import List, Optional, Tuple

from ..config.units import AngleUnit, LinearUnit
from ..model.behavior import Behavior
from ..model.definition import Definition
from ..model.descriptor import Descriptor
from ..model.geometry import UV, BlendShape, Geometry, Layout, Mesh, Point3
from ..model.joint import Joint
from ..util.conversion import Conversion
from ..util.error import DNAViewerError


@dataclass
class BaseDNA:
    """
    A model class for holding data about the DNA

    Attributes
    ----------
    @type descriptor: Descriptor
    @param descriptor: Data representing the descriptor part of the DNA

    @type definition: Definition
    @param definition: Data representing the definition part of the DNA

    @type behavior: Behavior
    @param behavior: Data representing the behavior part of the DNA

    @type geometry: Geometry
    @param geometry: Data representing the geometry part of the DNA
    """

    descriptor: Optional[Descriptor] = field(default=None)
    definition: Optional[Definition] = field(default=None)
    behavior: Optional[Behavior] = field(default=None)
    geometry: Optional[Geometry] = field(default=None)


class DNA(BaseDNA):
    """
    Used for getting data stored in the models

    @type path: str
    @param path: The path to the DNA file
    """

    def __init__(self, path: str) -> None:
        super().__init__()
        self.path = path

    def read_all_neutral_joints(self) -> List[Joint]:
        joints = []

        for i, name in enumerate(self.definition.joints.names):
            translation = self.definition.neutral_joint_translations[i]
            orientation = self.definition.neutral_joint_rotations[i]
            parent_name = self.definition.joints.names[
                self.definition.joints.parent_index[i]
            ]

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
        return self.geometry.meshes[mesh_index].skin_weights.joint_indices

    def get_blend_shape_target_deltas_with_vertex_id(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> List[Tuple[int, Point3]]:
        blend_shape = self.geometry.meshes[mesh_index].blend_shapes[
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
        mesh = self.geometry.meshes[mesh_index]
        for i in range(len(mesh.topology.positions)):
            skin_weight_values.append(mesh.skin_weights.values[i])

        return skin_weight_values

    def get_skin_weight_matrix_for_mesh(
        self, mesh_index: int
    ) -> List[List[Tuple[int, float]]]:
        vertex_position_count = len(self.geometry.meshes[mesh_index].topology.positions)

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
        return self.geometry.meshes[mesh_index].topology.texture_coordinates

    def get_vertex_normals_for_mesh(self, mesh_index: int) -> List[Point3]:
        return self.geometry.meshes[mesh_index].topology.normals

    def get_raw_control_names(self) -> List[str]:
        return self.definition.raw_control_names

    def get_animated_map_names(self) -> List[str]:
        return self.definition.animated_maps.names

    def get_vertex_positions_for_mesh_index(self, mesh_index: int) -> List[Point3]:
        return self.geometry.meshes[mesh_index].topology.positions

    def get_vertex_layout_positions_for_mesh_index(self, mesh_index: int) -> List[int]:
        return [
            item.position_index
            for item in self.geometry.meshes[mesh_index].topology.layouts
        ]

    def get_faces(self, mesh_index: int) -> List[List[int]]:
        return self.geometry.meshes[mesh_index].topology.face_vertex_layouts

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
        return self.geometry.meshes[mesh_index].topology.layouts

    def get_texture_coordinate_index(self, mesh_index: int, layout_id: int) -> int:
        return (
            self.geometry.meshes[mesh_index]
            .topology.layouts[layout_id]
            .texture_coordinate_index
        )

    def get_normal_for_mesh_index_and_layout(
        self, mesh_index: int, layout: Layout
    ) -> Point3:
        return self.geometry.meshes[mesh_index].topology.normals[layout.normal_index]

    def has_blend_shapes(self, mesh_index: int) -> bool:
        return (
            len([bs.channel for bs in self.geometry.meshes[mesh_index].blend_shapes])
            > 0
        )

    def get_maximum_influence_per_vertex(self, mesh_index: int) -> int:
        return self.geometry.meshes[
            mesh_index
        ].skin_weights.maximum_influence_per_vertex

    def get_blend_shape_name(self, blend_shape_channel: int) -> str:
        return self.definition.blend_shape_channels.names[blend_shape_channel]

    def get_geometry(self) -> Geometry:
        return self.geometry

    def get_mesh_name(self, mesh_index: int) -> str:
        return self.definition.meshes.names[mesh_index]

    def get_mesh_names(self) -> List[str]:
        return self.definition.meshes.names

    def get_translation_unit_int(self) -> int:
        return self.descriptor.translation_unit

    def get_linear_unit(self) -> LinearUnit:
        return Conversion.get_linear_unit_from_int(self.get_translation_unit_int())

    def get_angle_unit_int(self) -> int:
        return self.descriptor.rotation_unit

    def get_angle_unit(self) -> AngleUnit:
        return Conversion.get_angle_unit_from_int(self.get_angle_unit_int())

    def get_lod_count(self) -> int:
        return self.descriptor.lod_count

    def get_mesh_indices_for_lod(self, lod: int) -> List[int]:
        return self.definition.meshes.indices_for_lod[lod]

    def get_joint_indices_for_lod(self, lod: int) -> List[int]:
        return self.definition.joints.indices_for_lod[lod]

    def get_lowest_lod_containing_meshes(
        self, mesh_indices: List[int]
    ) -> Optional[int]:
        unique_mesh_indices = set(mesh_indices)
        for lod in range(self.get_lod_count()):
            if any(list(unique_mesh_indices & set(self.get_mesh_indices_for_lod(lod)))):
                return lod
        return None

    def get_character_name(self) -> str:
        return self.descriptor.name

    def get_meshes_by_lods(self, mesh_indices: List[int]) -> List[List[int]]:
        result_list = []
        for lod in range(self.get_lod_count()):
            temp = list(set(mesh_indices) & set(self.get_mesh_indices_for_lod(lod)))
            result_list.append(temp)
        return result_list

    def get_blend_shapes(self, mesh_index: int) -> List[BlendShape]:
        return self.geometry.meshes[mesh_index].blend_shapes

    def get_mesh_data(self, mesh_index: int) -> Mesh:
        return self.geometry.meshes[mesh_index]

    def get_mesh_id_from_mesh_name(self, mesh_name: str) -> Optional[int]:
        for mesh_id, mesh in enumerate(self.geometry.meshes.values()):
            if mesh.name == mesh_name:
                return mesh_id
        return None

    def get_mesh_count(self) -> int:
        return len(self.geometry.meshes.values())
