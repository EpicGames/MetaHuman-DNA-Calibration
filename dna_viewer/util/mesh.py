import logging
from typing import List, Optional

from ..builder.scene import Scene as SceneBuilder
from ..config.character import BuildOptions, Character
from ..config.scene import Scene as SceneConfig
from ..config.units import AngleUnit, LinearUnit
from ..model.dna import DNA
from ..util.error import DNAViewerError


def get_mesh_names(dna: DNA) -> List[str]:
    """
    Gets the list of mesh names contained in the DNA file.

    @type dna: DNA
    @param dna: Instance of DNA

    @rtype: List[str]
    @returns: The list of mesh names contained in the DNA file
    """

    return dna.get_mesh_names()


def get_mesh_lods(dna: DNA) -> List[List[int]]:
    """
    Gets the list of list of mesh indices grouped by the lod number.

    @type dna: DNA
    @param dna: Instance of DNA.

    @rtype: List[List[int]]
    @returns: The list of list of mesh indices grouped by the lod number
    """

    result: List[List[int]] = []

    for lod in range(dna.get_lod_count()):
        mesh_indices = []
        for mesh_index in dna.get_mesh_indices_for_lod(lod):
            mesh_indices.append(mesh_index)
        result.append(mesh_indices)

    return result


def create_build_options(
    add_joints: bool = False,
    add_blend_shapes: bool = False,
    add_skin: bool = False,
    add_ctrl_attributes_on_root_joint: bool = False,
    add_animated_map_attributes_on_root_joint: bool = False,
    add_mesh_name_to_blend_shape_channel_name: bool = False,
    add_key_frames: bool = False,
) -> BuildOptions:
    """
    Creates the build options object used in the character building process.

    @type add_joints: bool
    @param add_joints: Represents if joints should be added

    @type add_blend_shapes: bool
    @param add_blend_shapes: Represents if blend shapes should be added

    @type add_skin: bool
    @param add_skin: Represents if skin should be added

    @type add_ctrl_attributes_on_root_joint: bool
    @param add_ctrl_attributes_on_root_joint: Represents if gui control attributes should be added on the root joint

    @type add_animated_map_attributes_on_root_joint: bool
    @param add_animated_map_attributes_on_root_joint: Represents if animated map attributes should be added on the root joint

    @type add_mesh_name_to_blend_shape_channel_name: bool
    @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mash name of blend shape channel is added to name when creating it

    @type add_key_frames: bool
    @param add_key_frames: A flag representing whether key frames should be added

    @rtype: BuildOptions
    @returns: The created build options object
    """

    return BuildOptions(
        add_joints=add_joints,
        add_blend_shapes=add_blend_shapes,
        add_skin=add_skin,
        add_ctrl_attributes_on_root_joint=add_ctrl_attributes_on_root_joint,
        add_animated_map_attributes_on_root_joint=add_animated_map_attributes_on_root_joint,
        add_mesh_name_to_blend_shape_channel_name=add_mesh_name_to_blend_shape_channel_name,
        add_key_frames=add_key_frames,
    )


def build_meshes(
    dna: DNA,
    options: BuildOptions = None,
    group_by_lod: bool = False,
    mesh_list: List[int] = None,
    lod_list: List[int] = None,
    create_new_scene: bool = False,
) -> List[str]:
    """
    Starts the mesh building process with the provided parameters.

    @type dna: DNA
    @param dna: Instance of DNA

    @type options: BuildOptions
    @param options: The build options used in the build process

    @type group_by_lod: bool
    @param group_by_lod: Represents if the created meshes should be added to a holding transform representing the lod

    @type mesh_list: List[int]
    @param mesh_list: List of mesh indices that should be added.

    @type lod_list: List[int]
    @param lod_list: List of lods from which all containing meshes should be added.

    @type create_new_scene: bool
    @param create_new_scene: Represents if a new scene should be created in the build process.

    @rtype: List[str]
    @returns: The list of full paths of the created meshes in the maya scene
    """

    options = options or BuildOptions()

    meshes: List[int] = []
    meshes_by_lod = get_mesh_lods(dna)

    if lod_list:
        for lod in lod_list:
            meshes.extend(meshes_by_lod[lod])

    if mesh_list:
        meshes.extend(mesh_list)

    if mesh_list is None and lod_list is None:
        meshes = [mesh_index for meshes in meshes_by_lod for mesh_index in meshes]

    character_config = (
        Character()
        .with_dna(dna=dna)
        .with_character_node(value=group_by_lod)
        .with_meshes(meshes=meshes)
    )
    character_config.options = options

    config = (
        SceneConfig()
        .with_character(character=character_config)
        .with_create_new_scene(create_new_scene)
        .with_linear_unit(unit=LinearUnit.cm)
        .with_angle_unit(unit=AngleUnit.degree)
    )
    scene_build_result = SceneBuilder(config).build()

    result = []
    for character_result in scene_build_result.character_results:
        for nodes_by_lod in character_result.nodes.values():
            for node in nodes_by_lod:
                result.append(node)
    return result


def get_mesh_indices_containing_string(
    mesh_name_part: str, lod: int, dna: DNA
) -> List[int]:
    """
    Gets the mesh indices containing a search string.

    @type mesh_name_part: str
    @param mesh_name_part: The string that is searched for in the meshes

    @type lod: int
    @param lod: The lod in which the mesh names will be searched for the result

    @type dna: DNA
    @param dna: Instance of DNA

    @rtype: List[int]
    @returns: The list of mesh indices which contain the mesh_name_part in their name
    """

    if not 0 <= lod < dna.get_lod_count():
        raise DNAViewerError(f"Lod {lod} does not exist")

    result = []
    for mesh_index in dna.get_mesh_indices_for_lod(lod):
        if mesh_name_part.lower() in dna.get_mesh_name(mesh_index).lower():
            result.append(mesh_index)

    if not result:
        raise DNAViewerError(f"No results for {mesh_name_part}")

    return result


def get_mesh_index(mesh_name: str, lod: int, dna: DNA) -> Optional[int]:
    """
    Gets a mesh index with the given search string, returns the first one if multiple are found.

    @type mesh_name: str
    @param mesh_name: The string that is searched for in the meshes

    @type lod: int
    @param lod: The lod in which the mesh names will be searched for the result

    @type dna: DNA
    @param dna: Instance of DNA
    """

    try:
        results = get_mesh_indices_containing_string(mesh_name, lod, dna)
        if results:
            logging.warning(
                "Multiple meshes found, first result is returned, you should probably try a more specific mesh name"
            )
        return results[0]
    except DNAViewerError as e:
        logging.error(e)
    return None
