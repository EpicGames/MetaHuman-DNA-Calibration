from typing import Dict, List, Optional, Tuple, cast

from dna import BinaryStreamReader as DNAReader

from ..model import UV, BlendShape, Layout, Mesh, Point3, SkinWeightsData, Topology
from .definition import Definition
from .layer import Layer


class Geometry(Definition):
    def __init__(self, reader: DNAReader, layers: Optional[List[Layer]]) -> None:
        super().__init__(reader, layers)
        self.geometry_meshes: List[Mesh] = []
        self.geometry_read = False

    def start_read(self) -> None:
        super().start_read()
        self.geometry_read = False

    def is_read(self) -> bool:
        return super().is_read() and self.geometry_read

    def read(self) -> None:
        """
        Starts reading in the mesh from the geometry part of the DNA
        """
        super().read()

        if not self.geometry_read and self.layer_enabled(Layer.geometry):
            self.geometry_read = True
            self.geometry_meshes = []
            for lod in range(self.get_lod_count()):
                for mesh_index in self.get_mesh_indices_for_lod(lod):
                    self.geometry_meshes.append(self.add_mesh(mesh_index))

    def get_maximum_influence_per_vertex(self, mesh_index: int) -> int:
        return cast(int, self.reader.getMaximumInfluencePerVertex(meshIndex=mesh_index))

    def get_vertex_position_count(self, mesh_index: int) -> int:
        return cast(int, self.reader.getVertexPositionCount(mesh_index))

    def get_skin_weights_values(
        self, mesh_index: int, vertex_index: int
    ) -> List[float]:
        return cast(
            List[float],
            self.reader.getSkinWeightsValues(
                meshIndex=mesh_index, vertexIndex=vertex_index
            ),
        )

    def get_skin_weights_joint_indices(
        self, mesh_index: int, vertex_index: int
    ) -> List[int]:
        return cast(
            List[int],
            self.reader.getSkinWeightsJointIndices(
                meshIndex=mesh_index, vertexIndex=vertex_index
            ),
        )

    def get_vertex_texture_coordinate_count(self, mesh_index: int) -> int:
        return cast(
            int, self.reader.getVertexTextureCoordinateCount(meshIndex=mesh_index)
        )

    def get_vertex_texture_coordinate(
        self, mesh_index: int, texture_coordinate_index: int
    ) -> Tuple[float, float]:
        return cast(
            Tuple[float, float],
            self.reader.getVertexTextureCoordinate(
                meshIndex=mesh_index, textureCoordinateIndex=texture_coordinate_index
            ),
        )

    def get_face_count(self, mesh_index: int) -> int:
        return cast(int, self.reader.getFaceCount(meshIndex=mesh_index))

    def get_face_vertex_layout_indices(
        self, mesh_index: int, face_index: int
    ) -> List[int]:
        return cast(
            List[int],
            self.reader.getFaceVertexLayoutIndices(
                meshIndex=mesh_index, faceIndex=face_index
            ),
        )

    def get_vertex_layout(
        self, mesh_index: int, layout_index: int
    ) -> Tuple[int, int, int]:
        return cast(
            Tuple[int, int, int],
            self.reader.getVertexLayout(meshIndex=mesh_index, layoutIndex=layout_index),
        )

    def get_vertex_layout_count(self, mesh_index: int) -> int:
        return cast(int, self.reader.getVertexLayoutCount(meshIndex=mesh_index))

    def get_vertex_position(
        self, mesh_index: int, vertex_index: int
    ) -> Tuple[float, float, float]:
        return cast(
            Tuple[float, float, float],
            self.reader.getVertexPosition(
                meshIndex=mesh_index, vertexIndex=vertex_index
            ),
        )

    def get_blend_shape_target_vertex_indices(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> List[int]:
        return cast(
            List[int],
            self.reader.getBlendShapeTargetVertexIndices(
                meshIndex=mesh_index, blendShapeTargetIndex=blend_shape_target_index
            ),
        )

    def get_blend_shape_target_delta_count(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> int:
        return cast(
            int,
            self.reader.getBlendShapeTargetDeltaCount(
                meshIndex=mesh_index, blendShapeTargetIndex=blend_shape_target_index
            ),
        )

    def get_blend_shape_target_delta(
        self, mesh_index: int, blend_shape_target_index: int, delta_index: int
    ) -> Tuple[int, int, int]:
        return cast(
            Tuple[int, int, int],
            self.reader.getBlendShapeTargetDelta(
                meshIndex=mesh_index,
                blendShapeTargetIndex=blend_shape_target_index,
                deltaIndex=delta_index,
            ),
        )

    def get_blend_shape_target_count(self, mesh_index: int) -> int:
        return cast(int, self.reader.getBlendShapeTargetCount(meshIndex=mesh_index))

    def get_blend_shape_channel_index(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> int:
        return cast(
            int,
            self.reader.getBlendShapeChannelIndex(
                meshIndex=mesh_index, blendShapeTargetIndex=blend_shape_target_index
            ),
        )

    def add_mesh(self, mesh_index: int) -> Mesh:
        mesh = Mesh()
        mesh.name = self.get_mesh_name(mesh_index)
        mesh.topology = self.add_mesh_topology(mesh_index)
        mesh.skin_weights = self.add_mesh_skin_weights(mesh_index)
        mesh.blend_shapes = self.add_mesh_blend_shapes(mesh_index)
        return mesh

    def add_mesh_skin_weights(self, mesh_index: int) -> SkinWeightsData:
        """Reads in the skin weights"""
        skin_weights = SkinWeightsData()
        for vertex_index in range(self.get_vertex_position_count(mesh_index)):
            skin_weights.values.append(
                self.get_skin_weights_values(mesh_index, vertex_index)
            )
            skin_weights.joint_indices.append(
                self.get_skin_weights_joint_indices(mesh_index, vertex_index)
            )

        return skin_weights

    def add_mesh_topology(self, mesh_index: int) -> Topology:
        """Reads in the positions, texture coordinates, normals, layouts and face vertex layouts"""
        topology = Topology()
        topology.positions = self.add_positions(mesh_index)
        topology.texture_coordinates = self.add_texture_coordinates(mesh_index)
        topology.layouts = self.add_layouts(mesh_index)
        topology.face_vertex_layouts = self.add_face_vertex_layouts(mesh_index)
        return topology

    def add_face_vertex_layouts(self, mesh_index: int) -> List[List[int]]:
        """Reads in the face vertex layouts"""
        face_vertex_layouts = []

        for face_index in range(self.get_face_count(mesh_index)):
            face_vertex_layouts.append(
                self.get_face_vertex_layout_indices(mesh_index, face_index)
            )

        return face_vertex_layouts

    def add_layouts(self, mesh_index: int) -> List[Layout]:
        """Reads in the vertex layouts"""
        layouts = []

        for layout_index in range(self.get_vertex_layout_count(mesh_index)):
            (
                position_id,
                texture_coordinate_id,
                _,
            ) = self.get_vertex_layout(mesh_index, layout_index)
            layouts.append(
                Layout(
                    position_index=position_id,
                    texture_coordinate_index=texture_coordinate_id,
                )
            )
        return layouts

    def add_texture_coordinates(self, mesh_index: int) -> List[UV]:
        """Reads in the texture coordinates"""
        texture_coordinates = []
        for texture_coordinate_index in range(
            self.get_vertex_texture_coordinate_count(mesh_index)
        ):
            u, v = self.get_vertex_texture_coordinate(
                mesh_index, texture_coordinate_index
            )
            texture_coordinates.append(UV(u=u, v=v))
        return texture_coordinates

    def add_positions(self, mesh_index: int) -> List[Point3]:
        """Reads in the vertex positions"""

        positions = []
        for vertex_index in range(self.get_vertex_position_count(mesh_index)):
            x, y, z = self.get_vertex_position(mesh_index, vertex_index)
            positions.append(Point3(x=x, y=y, z=z))
        return positions

    def read_target_deltas(
        self, mesh_index: int, blend_shape_target_index: int
    ) -> Dict[int, Point3]:
        """
        Reads in the target deltas

        @rtype: Dict[int, Point3]
        @returns: Mapping of vertex indices to positions
        """

        result: Dict[int, Point3] = {}

        vertices = self.get_blend_shape_target_vertex_indices(
            mesh_index, blend_shape_target_index
        )

        blend_shape_target_delta_count = self.get_blend_shape_target_delta_count(
            mesh_index, blend_shape_target_index
        )
        for delta_index in range(blend_shape_target_delta_count):
            x, y, z = self.get_blend_shape_target_delta(
                mesh_index, blend_shape_target_index, delta_index
            )
            result[vertices[delta_index]] = Point3(x=x, y=y, z=z)
        return result

    def add_mesh_blend_shapes(self, mesh_index: int) -> List[BlendShape]:
        """
        Reads in the blend shapes

        @type mesh_index: int
        @param mesh_index: The mesh index
        """

        blend_shape_target_count = self.get_blend_shape_target_count(mesh_index)
        blend_shapes = []
        for blend_shape_target_index in range(blend_shape_target_count):
            blend_shapes.append(
                BlendShape(
                    channel=self.get_blend_shape_channel_index(
                        mesh_index, blend_shape_target_index
                    ),
                    deltas=self.read_target_deltas(
                        mesh_index, blend_shape_target_index
                    ),
                )
            )
        return blend_shapes
