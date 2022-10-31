import logging
from typing import Dict, Optional

from dna import BinaryStreamReader

from ..const.printing import BLEND_SHAPE_PRINT_RANGE
from ..model.geometry import UV, BlendShape, Layout, Mesh, Point3


class Geometry:
    """
    A class used for reading the geometry part of the DNA file

    Attributes
    ----------
    @type reader: BinaryStreamReader
    @param reader: The stream reader being used

    @type mesh: Mesh
    @param mesh: The mesh model

    @type mesh_index: int
    @param mesh_index: The mesh index
    """

    def __init__(self, stream_reader: BinaryStreamReader, mesh_index: int) -> None:
        self.reader = stream_reader
        self.mesh: Optional[Mesh] = None
        self.mesh_index = mesh_index

    def read(self) -> Mesh:
        """
        Starts reading in the mesh from the geometry part of the DNA

        @rtype: Mesh
        @returns: The instance of the mesh model
        """

        self.mesh = Mesh()

        self.add_mesh_name()
        self.add_topology()
        self.add_skin_weights()
        return self.mesh

    def add_mesh_name(self) -> None:
        """Reads in the mesh name"""

        self.mesh.name = self.reader.getMeshName(self.mesh_index)

    def add_skin_weights(self) -> None:
        """Reads in the skin weights"""

        self.mesh.skin_weights.maximum_influence_per_vertex = (
            self.reader.getMaximumInfluencePerVertex(self.mesh_index)
        )
        for vertex_index in range(self.reader.getVertexPositionCount(self.mesh_index)):
            self.mesh.skin_weights.values.append(
                self.reader.getSkinWeightsValues(self.mesh_index, vertex_index)
            )
            self.mesh.skin_weights.joint_indices.append(
                self.reader.getSkinWeightsJointIndices(self.mesh_index, vertex_index)
            )

    def add_topology(self) -> None:
        """Reads in the positions, texture coordinates, normals, layouts and face vertex layouts"""

        self.add_positions()
        self.add_texture_coordinates()
        self.add_normals()
        self.add_layouts()
        self.add_face_vertex_layouts()

    def add_face_vertex_layouts(self) -> None:
        """Reads in the face vertex layouts"""

        for face_index in range(self.reader.getFaceCount(self.mesh_index)):
            self.mesh.topology.face_vertex_layouts.append(
                self.reader.getFaceVertexLayoutIndices(self.mesh_index, face_index)
            )

    def add_layouts(self) -> None:
        """Reads in the vertex layouts"""

        for layout_index in range(self.reader.getVertexLayoutCount(self.mesh_index)):
            position_id, texture_coordinate_id, normal_id = self.reader.getVertexLayout(
                self.mesh_index, layout_index
            )
            self.mesh.topology.layouts.append(
                Layout(
                    position_index=position_id,
                    texture_coordinate_index=texture_coordinate_id,
                    normal_index=normal_id,
                )
            )

    def add_normals(self) -> None:
        """Reads in the normals"""

        for normal_index in range(self.reader.getVertexNormalCount(self.mesh_index)):
            x, y, z = self.reader.getVertexNormal(self.mesh_index, normal_index)
            self.mesh.topology.normals.append(Point3(x=x, y=y, z=z))

    def add_texture_coordinates(self) -> None:
        """Reads in the texture coordinates"""

        for texture_coordinate_index in range(
            self.reader.getVertexTextureCoordinateCount(self.mesh_index)
        ):
            u, v = self.reader.getVertexTextureCoordinate(
                self.mesh_index, texture_coordinate_index
            )
            self.mesh.topology.texture_coordinates.append(UV(u=u, v=v))

    def add_positions(self) -> None:
        """Reads in the vertex positions"""

        for vertex_index in range(self.reader.getVertexPositionCount(self.mesh_index)):
            x, y, z = self.reader.getVertexPosition(self.mesh_index, vertex_index)
            self.mesh.topology.positions.append(Point3(x=x, y=y, z=z))

    def read_target_deltas(self, blend_shape_target_index: int) -> Dict[int, Point3]:
        """
        Reads in the target deltas

        @rtype: Dict[int, Point3]
        @returns: Mapping of vertex indices to positions
        """

        result: Dict[int, Point3] = {}

        vertices = self.reader.getBlendShapeTargetVertexIndices(
            self.mesh_index, blend_shape_target_index
        )

        blend_shape_target_delta_count = self.reader.getBlendShapeTargetDeltaCount(
            self.mesh_index, blend_shape_target_index
        )
        for delta_index in range(blend_shape_target_delta_count):
            x, y, z = self.reader.getBlendShapeTargetDelta(
                self.mesh_index, blend_shape_target_index, delta_index
            )
            result[vertices[delta_index]] = Point3(x=x, y=y, z=z)

        return result

    def read_blend_shapes(self, mesh: Mesh, mesh_index: int) -> None:
        """
        Reads in the blend shapes

        @type mesh: Mesh
        @param mesh: The mesh model

        @type mesh_index: int
        @param mesh_index: The mesh index
        """

        blend_shape_target_count = self.reader.getBlendShapeTargetCount(mesh_index)
        for blend_shape_target_index in range(blend_shape_target_count):
            if (blend_shape_target_index + 1) % BLEND_SHAPE_PRINT_RANGE == 0:
                logging.info(
                    f"\t{blend_shape_target_index + 1} / {blend_shape_target_count}"
                )

            mesh.blend_shapes.append(
                BlendShape(
                    channel=self.reader.getBlendShapeChannelIndex(
                        mesh_index, blend_shape_target_index
                    ),
                    deltas=self.read_target_deltas(blend_shape_target_index),
                )
            )

        if blend_shape_target_count % BLEND_SHAPE_PRINT_RANGE != 0:
            logging.info(f"\t{blend_shape_target_count} / {blend_shape_target_count}")
