# DNA API overview

Here is an overview of main methods used to read from and write to DNA files.  
The following documentation is for C++. Currently, there is no Python documentation.  

As mentioned [here](/docs/dna.md#api-overview), there are classes that are used for reading a DNA from or writing it to a stream. Those are:  
- [BinaryStreamReader](/dnacalib/DNACalib/include/dna/BinaryStreamReader.h)
- [BinaryStreamWriter](/dnacalib/DNACalib/include/dna/BinaryStreamWriter.h)
- [JSONStreamReader](/dnacalib/DNACalib/include/dna/JSONStreamReader.h)
- [JSONStreamWriter](/dnacalib/DNACalib/include/dna/JSONStreamWriter.h)

After creating a reader, it can be used to query different information contained in the DNA.  
After creating a writer, it can be used to set new values in the DNA.  

This is done through methods listed on this page. They are grouped based on [layers](/docs/dna.md#layers) in the DNA file.  

**Note**: Not all available methods are listed on this page. For more details on methods listed here and a list of all available methods, consult appropriate reader and/or writer [here](/dnacalib/DNACalib/include/dna/layers).

## BinaryStreamReader
Contains methods for creating and destroying a [BinaryStreamReader](/dnacalib/DNACalib/include/dna/BinaryStreamReader.h).  
When creating a BinaryStreamReader, the user can filter data in the DNA file, by specifying which LODs to load. As explained [here](/docs/dna.md#reader), filtering can also be done by specifying which data layers to load.  

- `create(stream, layer = DataLayer::All, maxLOD = 0u, memRes = nullptr)`  
    Factory method for creation of BinaryStreamReader.  
    Parameters:  
        `stream` - Source stream from which data is going to be read.  
        `layer` - Specify the layer up to which the data needs to be loaded.  
        `maxLOD` - The maximum level of details to be loaded. A value of zero indicates to load all LODs.  
        `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.  

- `create(stream, layer, maxLOD, minLOD, memRes = nullptr)`  
    Factory method for creation of BinaryStreamReader.  
    Parameters:  
        `stream` - Source stream from which data is going to be read.  
        `layer` - Specify the layer up to which the data needs to be loaded.  
        `maxLOD` - The maximum level of details to be loaded.  
        `minLOD` - The minimum level of details to be loaded. A range of [0, LOD count - 1] for maxLOD / minLOD respectively indicates to load all LODs.  
        `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.  

- `create(stream, layer, lods, lodCount, memRes = nullptr)`  
    Factory method for creation of BinaryStreamReader.  
    Parameters:  
        `stream` - Source stream from which data is going to be read.  
        `layer` - Specify the layer up to which the data needs to be loaded.  
        `lods` - An array specifying which exact lods to load.  
        `lodCount` - The number of elements in the lods array.  
        `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.  

- `destroy(instance)`  
    Method for freeing a BinaryStreamReader instance.  
    Parameters:  
       `instance` - Instance of BinaryStreamReader to be freed.

## BinaryStreamWriter
- `create(stream, memRes = nullptr)`  
    Factory method for creation of BinaryStreamWriter.  
    Parameters:  
        `stream` - Stream into which the data is going to be written.
        `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.

- `destroy(BinaryStreamWriter* instance)`  
    Method for freeing a BinaryStreamWriter instance.  
    Parameters:  
        `instance` - Instance of BinaryStreamWriter to be freed.  

## JSONStreamReader
- `create(stream, memRes = nullptr)`  
    Factory method for creation of JSONStreamReader.  
        Parameters:  
            `stream` - Source stream from which data is going to be read.  
            `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.  

- `destroy(instance)`  
    Method for freeing a JSONStreamReader instance.  
        Parameters:  
            `instance` - Instance of JSONStreamReader to be freed.  

## JSONStreamWriter
- `create(stream, indentWidth = 4u, memRes = nullptr)`  
    Factory method for creation of JSONStreamWriter.  
    Parameters:  
        `stream` - Stream into which the data is going to be written.  
        `indentWidth` - Number of spaces to use for indentation.  
        `memRes` - Memory resource to be used for allocations. If a memory resource is not given, a default allocation mechanism will be used. User is responsible for releasing the returned pointer by calling destroy.  

- `destroy(instance)`  
    Method for freeing a JSONStreamWriter instance.  
    Parameters:  
        `instance` - Instance of JSONStreamWriter to be freed.  

## setFrom() method
Besides methods for creating a writer, both BinaryStreamReader and JSONStreamReader have a setFrom() method, inherited from [Writer](/dnacalib/DNACalib/include/dna/Writer.h), used to initialize a writer with data from a reader.  
Using this method, data used to initialize a writer can be filtered by data layers.  
- `setFrom(source, layer = DataLayer::All, memRes = nullptr)`  
    Initialize the Writer from the given Reader.  
    This function copies all the data from the given Reader into the Writer instance, by calling each getter function of the Reader, and passing the return values to the matching setter functions in the Writer.  
    Parameters:  
        `source` - The source DNA Reader from which the data needs to be copied.  
        `layer` - Limit which layers should be taken over from the given source reader.  
        `memRes` - Optional memory resource to use for temporary allocations during copying.  

## Reader methods
### DescriptorReader
Contains read-only accessors for various metadata about the character and the rig.  

- `getName()`
    Character name.
- `getArchetype()`
    Character archetype.
- `getGender()`
    Character gender.
- `getAge()`
    Character age.
- `getTranslationUnit()`
    The translation unit that is used (cm or m).
- `getRotationUnit()`
    The rotation unit that is used (degrees or radians).
- `getCoordinateSystem()`
    Coordinate system that is used (directions of x, y and z axes).
- `getLODCount()`
    Available levels of detail (e.g. 6 which means the following levels are available: [0,1,2,3,4,5], where 0 is the LOD with the highest details, and 5 is the LOD with lowest details).
- `getDBMaxLOD()`
    The maximum level of detail stored in the DNA data for this character. The value is relative to LOD-0 from the database.
- `getDBComplexity()`
    Name of the input control interface used to drive this character rig. This parameter denotes the character's input control complexity.
- `getDBName()`
    Name of the database from which the character originates. All characters from the same database must have the same Definition, but may have different complexity or LOD.

### DefinitionReader
Contains read-only accessors for DNA attributes that represent the rig's static data.  

- `getGUIControlCount()`
    Number of GUI controls.
- `getGUIControlName(index)`
    Name of the requested GUI control.
- `getRawControlCount()`
    Number of raw controls.
- `getRawControlName(index)`
    Name of the requested raw control.
- `getJointCount()`
    Number of joints.
- `getJointName(index)`
    Name of the requested joint.
- `getJointIndicesForLOD(lod)`
    List of joint indices for the specified LOD.
- `getJointParentIndex(index)`
    Index of the requested joint's parent.  
    The joint hierarchy may be traversed and reconstructed using this function. Example:  
    Joint names: [A, B, C, D, E, F, G, H, I]  
    Hierarchy:   [0, 0, 0, 1, 1, 4, 2, 6, 2]  
    Describes the following hierarchy:
    ```
    A
    ├── B
    │   ├── D
    │   └── E
    │       └── F
    └── C
        ├── G
        │   └── H
        └── I
    ```
    Requesting the parent index of joint 5 (joint name: F) would return 4 (joint name: E).  
    Requesting the parent index of the root joint: 0 (joint name: A) would return the same index 0.
- `getBlendShapeChannelCount()`
    Number of blend shape channels.
- `getBlendShapeChannelName(index)`
    Name of the requested blend shape channel.
- `getBlendShapeChannelIndicesForLOD(lod)`
    List of blend shape channel indices for the specified LOD.
- `getAnimatedMapCount()`
    Number of animated maps.
- `getAnimatedMapName(index)`
    Name of the requested animated map.
- `getAnimatedMapIndicesForLOD(lod)`
    List of animated map indices for the specified LOD.
- `getMeshCount()`
    Number of meshes.
- `getMeshName(index)`
    Name of the requested mesh.
- `getMeshIndicesForLOD(lod)`
    List of mesh indices for the specified LOD.
- `getMeshBlendShapeChannelMappingCount()`
    Number of mesh-blend shape channel mapping items.
- `getMeshBlendShapeChannelMapping(index)`
    A structure holding the mesh index and the associated blend shape channel index for the specified mapping index.
- `getMeshBlendShapeChannelMappingIndicesForLOD(lod)`
    List of mesh-blend shape channel mapping indices for the specified LOD.
- `getNeutralJointTranslation(index)`
    The joint's translation (x, y, z) in bind pose.
- `getNeutralJointTranslationXs()`
    List of all translation X values for joints in bind pose.
- `getNeutralJointTranslationYs()`
    List of all translation Y values for joints in bind pose.
- `getNeutralJointTranslationZs()`
    List of all translation Z values for joints in bind pose.
- `getNeutralJointRotation(index)`
    The joint's rotation (x, y, z) in bind pose.
- `getNeutralJointRotationXs()`
    List of all rotation X values for joints in bind pose.
- `getNeutralJointRotationYs()`
    List of all rotation Y values for joints in bind pose.
- `getNeutralJointRotationZs()`
    List of all rotation Z values for joints in bind pose.

### BehaviorReader
Contains read-only accessors for DNA attributes that define the rig's evaluation.  

- `getGUIToRawInputIndices()`
    Input indices used for mapping GUI to raw controls.
- `getGUIToRawOutputIndices()`
    Output indices used for mapping GUI to raw controls.
- `getGUIToRawFromValues()`
    Filter values(lower-bounds) used to decide whether a particular entry should be evaluated or not during GUI to raw control mapping.
- `getGUIToRawToValues()`
    Filter values(upper-bounds) used to decide whether a particular entry should be evaluated or not during GUI to raw control mapping.
- `getGUIToRawSlopeValues()`
    Computational values(slope/gradient) used for calculating the output value during GUI to raw control mapping.
- `getGUIToRawCutValues()`
    Computational values(vertical intercept) used for calculating the output value during GUI to raw control mapping.
- `getPSDCount()`
    The number of distinct PSD expressions.
- `getPSDRowIndices()`
    PSD(input) indices.
- `getPSDColumnIndices()`
    Control(input) indices.
- `getPSDValues()`
    Weights associated with each PSD row and column pair.
- `getJointRowCount()`
    Number of rows in the entire, uncompressed joint matrix.
- `getJointColumnCount()`
    Number of columns in the entire, uncompressed joint matrix.
- `getJointVariableAttributeIndices(lod)`
    Joint attribute indices (output indices) for the requested LOD.
- `getJointGroupCount()`
    Number of joint groups present in the entire joint matrix.
- `getJointGroupLODs(jointGroupIndex)`
    Number of rows per each level of detail for the requested joint group.  
    Each element's position represents the level itself, while the value denotes the number of rows within the joint group belonging to that level. e.g.:  
    ```
    [12, 9, 3]
     │   │  └── LOD-2 contains first 3 rows
     │   └── LOD-1 contains first 9 rows
     └── LOD-0 contains first 12 rows
    ```
- `getJointGroupInputIndices(jointGroupIndex)`
    Column indices that the requested joint group contains. The column indices point into the entire, uncompressed joint matrix.
- `getJointGroupOutputIndices(jointGroupIndex)`
    Row indices that the requested joint group contains. The row indices point into the entire, uncompressed joint matrix.
- `getJointGroupValues(jointGroupIndex)`
    Values that the requested joint group contains.
- `getJointGroupJointIndices(jointGroupIndex)`
    Joint indices that the requested joint group contains.
- `getBlendShapeChannelLODs()`
    Input index count per each level of detail for blend shape channels.  
    Each element's position represents the level itself (e.g. [0,1,2,3,4,5] Value 0 is LOD with highest of details, value 5 is LOD with lowest details), while the value denotes the number of input indices belonging to that level.
- `getBlendShapeChannelInputIndices()`
    Input indices used to index into the input vector.
- `getBlendShapeChannelOutputIndices()`
    Output indices specify the positions of blend shape channel output values.
- `getAnimatedMapLODs()`
    Row count per each level of detail for animated maps.  
    Each element's position represents the level itself (e.g. [0,1,2,3,4,5] Value 0 is LOD with highest of details, value 5 is LOD with lowest details), while the value denotes the number of rows (within the conditional table), belonging to that level.
- `getAnimatedMapInputIndices()`
    Input indices used to index into the array of input values.
- `getAnimatedMapOutputIndices()`
    Output indices that specify the computed output value's position.
- `getAnimatedMapFromValues()`
    Filter values(lower-bounds) used to decide whether a particular entry should be evaluated or not.
- `getAnimatedMapToValues()`
    Filter values(upper-bounds) used to decide whether a particular entry should be evaluated or not.
- `getAnimatedMapSlopeValues()`
    Computational values(slope/gradient) used for calculating the output value.
- `getAnimatedMapCutValues()`
    Computational values(vertical intercept) used for calculating the output value.

### GeometryReader
Contains read-only accessors to the geometry data associated with a rig.  

- `getVertexPositionCount(meshIndex)`
    Number of vertex positions in the entire mesh.
- `getVertexPosition(meshIndex, vertexIndex)`
    Position of the specified vertex in the specified mesh. The vertices are sorted by the vertex ID.
- `getVertexPositionXs(meshIndex)`
    List of all vertex position X values for the referenced mesh.
- `getVertexPositionYs(meshIndex)`
    List of all vertex position Y values for the referenced mesh.
- `getVertexPositionZs(meshIndex)`
    List of all vertex position Z values for the referenced mesh.
- `getVertexTextureCoordinateCount(meshIndex)`
    Number of texture coordinates in the entire mesh.
- `getVertexTextureCoordinate(meshIndex, textureCoordinateIndex)`
    Texture coordinate for specified index in the specified mesh.
- `getVertexTextureCoordinateUs(meshIndex)`
    List of all texture coordinate U values for the referenced mesh.
- `getVertexTextureCoordinateVs(meshIndex)`
    List of all texture coordinate V values for the referenced mesh.
- `getVertexNormalCount(meshIndex)`
    Number of vertex normals in the entire mesh.
- `getVertexNormal(meshIndex, normalIndex)`
    Vertex normal for specified index in the specified mesh.
- `getVertexNormalXs(meshIndex)`
    List of all normal X values for the referenced mesh.
- `getVertexNormalYs(meshIndex)`
    List of all normal Y value for the referenced meshs.
- `getVertexNormalZs(meshIndex)`
    List of all normal Z values for the referenced mesh.
- `getVertexLayoutCount(meshIndex)`
    Number of vertex layouts in the entire mesh. A vertex layout is a collection of vertex attributes.
- `getVertexLayout(meshIndex, layoutIndex)`
    Vertex layouts contain only attribute indices which can be used to query the actual attributes, such as positions, texture coordinates and normals, which are associated with the vertex. The indices from a layout are usable with the above defined APIs.
- `getVertexLayoutPositionIndices(meshIndex)`
    Position indices for each vertex of the referenced mesh.
- `getVertexLayoutTextureCoordinateIndices(meshIndex)`
    Texture coordinate indices for each vertex of the referenced mesh.
- `getVertexLayoutNormalIndices(meshIndex)`
    Normal indices for each vertex of the referenced mesh.
- `getFaceCount(meshIndex)`
    Number of faces that belong to the specified mesh.
- `getFaceVertexLayoutIndices(meshIndex, faceIndex)`
    List of vertex layout indices the belong to a face on the specified mesh.
- `getMaximumInfluencePerVertex(meshIndex)`
    The maximum number of joints that may influence any single vertex.
- `getSkinWeightsCount(meshIndex)`
    Number of skin weights associated with the specified mesh.
- `getSkinWeightsValues(meshIndex, vertexIndex)`
    List of skin weights influencing the requested vertex.
- `getSkinWeightsJointIndices(meshIndex, vertexIndex)`
    List of joint indices associated with each skin weight for the specified vertex. The joint indices are stored in the same order as the weights they are associated with.
- `getBlendShapeTargetCount(meshIndex)`
    Number of blend shapes that belong to the specified mesh.
- `getBlendShapeChannelIndex(meshIndex, blendShapeTargetIndex)`
    The matching blend shape channel index of the requested blend shape target.
- `getBlendShapeTargetDeltaCount(meshIndex, blendShapeTargetIndex)`
    Number of deltas that belong to the specified blend shape.
- `getBlendShapeTargetDelta(meshIndex, blendShapeTargetIndex, deltaIndex)`
    List of deltas for each affected vertex.
- `getBlendShapeTargetDeltaXs(meshIndex, blendShapeTargetIndex)`
    List of all delta X values for the referenced blend shape target.
- `getBlendShapeTargetDeltaYs(meshIndex, blendShapeTargetIndex)`
    List of all delta Y values for the referenced blend shape target.
- `getBlendShapeTargetDeltaZs(meshIndex, blendShapeTargetIndex)`
    List of all delta Z values for the referenced blend shape target.
- `getBlendShapeTargetVertexIndices(meshIndex, blendShapeTargetIndex)`
    Vertex position indices affected by the referenced blend shape target. The vertex position indices are stored in the same order as the deltas they are associated with. These indices can be used to query the associated vertices themselves through getVertexPosition.

## Writer methods

### DescriptorWriter
Contains write-only accessors to various metadata about the character and the rig.  

- `setName(name)`
    Sets character name.
- `setArchetype(archetype)`
    Sets character archetype.
- `setGender(gender)`
    Sets character gender.
- `setAge(age)`
    Sets character age.
- `setTranslationUnit(unit)`
    Sets translation unit (cm or m).
- `setRotationUnit(unit)`
    Sets rotation unit (degrees or radians).
- `setCoordinateSystem(system)`
    Sets coordinate system (directions of the axes).
- `setLODCount(lodCount)`
    Sets available levels of detail (e.g. 6 which means the following levels are available: [0,1,2,3,4,5], where 0 is the LOD with the highest details, and 5 is the LOD with lowest details).
- `setDBMaxLOD(lod)`
    Sets the maximum level of detail stored in the DNA data for this character.
- `setDBComplexity(name)`
    Sets name of the input control interface used to drive this character rig.
- `setDBName(name)`
    Sets name of the database from which the character originates.

### DefinitionWriter
Contains write-only accessors for DNA attributes that represent the rig's static data.  
- `clearGUIControlNames()`
    Deletes all stored GUI control names.
- `setGUIControlName(index, name)`
    Sets name of the specified GUI control.
- `clearRawControlNames()`
    Deletes all stored raw control names.
- `setRawControlName(index, name)`
    Sets name of the specified raw control.
- `clearJointNames()`
    Deletes all stored joint names.
- `setJointName(index, name)`
    Sets name of the specified joint.
- `clearJointIndices()`
    Deletes all stored joint indices.
- `setJointIndices(index, jointIndices, count)`
    Stores a list of joint indices onto a specified index. The index denotes the position of an entire joint index list, not the position of it's individual elements, i.e. the row index in a 2D matrix of joint indices.
- `clearLODJointMappings()`
    Deletes all stored LOD to joint list index mapping entries.
- `setLODJointMapping(lod, index)`
    Sets which joints belong to which level of detail.
- `clearBlendShapeChannelNames()`
    Deletes all stored blend shape channel names.
- `setBlendShapeChannelName(index, name)`
    Sets name of the specified blend shape channel.
- `clearBlendShapeChannelIndices()`
    Deletes all stored blend shape channel indices.
- `setBlendShapeChannelIndices(index, blendShapeChannelIndices, count)`
    Stores a list of blend shape channel name indices onto a specified index. The index denotes the position of an entire blend shape channel index list, not the position of it's individual elements, i.e. the row index in a 2D matrix of blend shape channel indices.
- `clearLODBlendShapeChannelMappings()`
    Deletes all stored LOD to blend shape channel list index mapping entries.
- `setLODBlendShapeChannelMapping(lod, index)`
    Sets which blend shape channels belong to which level of detail.
- `clearAnimatedMapNames()`
    Deletes all stored animated map names.
- `setAnimatedMapName(index, name)`
    Sets name of the specified animated map.
- `clearAnimatedMapIndices()`
    Deletes all stored animated map indices.
- `setAnimatedMapIndices(index, animatedMapIndices, count)`
    Stores a list of animated map name indices onto a specified index. The index denotes the position of an entire animated map index list, not the position of it's individual elements, i.e. the row index in a 2D matrix of animated map indices.
- `clearLODAnimatedMapMappings()`
    Deletes all stored LOD to animated map list index mapping entries.
- `setLODAnimatedMapMapping(lod, index)`
    Sets which animated maps belong to which level of detail.
- `clearMeshNames()`
    Deletes all stored mesh names.
- `setMeshName(index, name)`
    Sets name of the specified mesh.
- `clearMeshIndices()`
    Deletes all stored mesh indices.
- `setMeshIndices(index, meshIndices, count)`
    Stores a list of mesh name indices onto a specified index. The index denotes the position of an entire mesh index list, not the position of it's individual elements, i.e. the row index in a 2D matrix of mesh indices.
- `clearLODMeshMappings()`
    Deletes all stored LOD to mesh list index mapping entries.
- `setLODMeshMapping(lod, index)`
    Sets which meshes belong to which level of detail.
- `clearMeshBlendShapeChannelMappings()`
    Deletes all stored mesh to blend shape channel mapping entries.
- `setMeshBlendShapeChannelMapping(index, meshIndex, blendShapeChannelIndex)`
    Associates a blend shape channel with it's mesh.
- `setJointHierarchy(jointIndices, count)`
    Sets a simple array describing the parent-child relationships between joints.  
    Example:  
    Joint names: [A, B, C, D, E, F, G, H]  
    Hierarchy:   [0, 0, 0, 1, 1, 4, 2, 2]  
    Describes the following hierarchy:  
    ```
    A
    ├── B
    │   ├── D
    │   └── E
    │       └── F
    └── C
        ├── G
        └── H
    ```
- `setNeutralJointTranslations(translations, count)`
    Sets translations for joints in bind pose.
- `setNeutralJointRotations(rotations, count)`
    Sets rotations for joints in bind pose.

### BehaviorWriter
Contains write-only accessors for DNA attributes that define the rig's evaluation.
- `setGUIToRawInputIndices(inputIndices, count)`
    Sets input indices used for mapping GUI to raw controls.
- `setGUIToRawOutputIndices(outputIndices, count)`
    Sets output indices used for mapping GUI to raw controls.
- `setGUIToRawFromValues(fromValues, count)`
    Sets filter values(lower-bounds) used to decide whether a particular entry should be evaluated or not during GUI to raw control mapping.
- `setGUIToRawToValues(toValues, count)`
    Sets filter values(upper-bounds) used to decide whether a particular entry should be evaluated or not during GUI to raw control mapping.
- `setGUIToRawSlopeValues(slopeValues, count)`
    Sets computational values(slope/gradient) used for calculating the output value during GUI to raw control mapping.
- `setGUIToRawCutValues(cutValues, count)`
    Sets computational values(vertical intercept) used for calculating the output value during GUI to raw control mapping.
- `setPSDCount(count)`
    Sets the number of distinct PSD expressions.
- `setPSDRowIndices(rowIndices, count)`
    Sets PSD(input) indices which will become the rows of the PSD matrix.
- `setPSDColumnIndices(columnIndices, count)`
    Sets control(input) indices which will become the columns of the PSD matrix.
- `setPSDValues(weights, count)`
    Sets weights associated with each PSD row and column pair.
- `setJointRowCount(rowCount)`
    Sets number of rows in the entire, uncompressed joint matrix.
- `setJointColumnCount(columnCount)`
    Sets number of columns in the entire, uncompressed joint matrix.
- `clearJointGroups()`
    Deletes all joint groups.
- `deleteJointGroup(jointGroupIndex)`
    Deletes the specified joint group.
- `setJointGroupLODs(jointGroupIndex, lods, count)`
    Sets number of rows per each level of detail for the specified joint group.  
    Each element's position represents the level itself, while the value denotes the number of rows within the joint group belonging to that level. e.g.:  
    ```
    [12, 9, 3]
     │   │  └── LOD-2 contains first 3 rows
     │   └── LOD-1 contains first 9 rows
     └── LOD-0 contains first 12 rows
    ```
- `setJointGroupInputIndices(jointGroupIndex, inputIndices, count)`
    Sets column indices that the specified joint group contains. The column indices point into the entire, uncompressed joint matrix.
- `setJointGroupOutputIndices(jointGroupIndex, outputIndices, count)`
    Sets row indices that the specified joint group contains. The row indices point into the entire, uncompressed joint matrix.
- `setJointGroupValues(jointGroupIndex, values, count)`
    Sets values that the specified joint group contains.
- `setJointGroupJointIndices(jointGroupIndex, jointIndices, count)`
    Sets joint indices that the specified joint group contains.
- `setBlendShapeChannelLODs(lods, count)`
    Sets input index count per each level of detail for blend shapes.  
    Each element's position represents the level itself (e.g. [0,1,2,3,4,5] Value 0 is LOD with highest of details, value 5 is LOD with lowest details), while the value denotes the number of input indices belonging to that level.  
- `setBlendShapeChannelInputIndices(inputIndices, count)`
    Sets input indices used to index into the input vector.
- `setBlendShapeChannelOutputIndices(outputIndices, count)`
    Sets output indices specify the positions of blend shape output values.
- `setAnimatedMapLODs(lods, count)`
    Sets row count per each level of detail for animated maps.  
    Each element's position represents the level itself (e.g. [0,1,2,3,4,5] Value 0 is LOD with highest of details, value 5 is LOD with lowest details), while the value denotes the number of rows (within the conditional table), belonging to that level.  
- `setAnimatedMapInputIndices(inputIndices, count)`
    Sets input indices used to index into the array of input values.
- `setAnimatedMapOutputIndices(outputIndices, count)`
    Sets output indices that specify the computed output value's position.
- `setAnimatedMapFromValues(fromValues, count)`
    Sets filter values(lower-bounds) used to decide whether a particular entry should be evaluated or not.
- `setAnimatedMapToValues(toValues, count)`
    Sets filter values(upper-bounds) used to decide whether a particular entry should be evaluated or not.
- `setAnimatedMapSlopeValues(slopeValues, count)`
    Sets computational values(slope/gradient) used for calculating the output value.
- `setAnimatedMapCutValues(cutValues, count)`
    Sets computational values(vertical intercept) used for calculating the output value.

### GeometryWriter
Contains write-only accessors for the geometry data associated with a rig.

- `clearMeshes()`
    Deletes all meshes.
- `deleteMesh(meshIndex)`
    Deletes the specified mesh.
- `setVertexPositions(meshIndex, positions, count)`
    Sets vertex positions.
- `setVertexTextureCoordinates(meshIndex, textureCoordinates, count)`
    Sets vertex texture coordinates.
- `setVertexNormals(meshIndex, normals, count)`
    Sets vertex normals.
- `setVertexLayouts(meshIndex, layouts, count)`
    Sets vertex layouts the belong to the specified mesh.
- `clearFaceVertexLayoutIndices(meshIndex)`
    Deletes all lists of vertex layout indices for the specified mesh.
- `setFaceVertexLayoutIndices(meshIndex, faceIndex, layoutIndices, count)`
    Sets vertex layout indices that belong to the specified face. The layout indices point into the array that is set through setVertexLayouts().
- `setMaximumInfluencePerVertex(meshIndex, maxInfluenceCount)`
    Sets the maximum number of joints that may influence any single vertex.
- `clearSkinWeights(meshIndex)`
    Deletes all skin weights for the specified mesh.
- `setSkinWeightsValues(meshIndex, vertexIndex, weights, count)`
    Sets skin weights influencing the referenced vertex. The sum of weights must add up to 1.
- `setSkinWeightsJointIndices(meshIndex, vertexIndex, jointIndices, count)`
    Sets joint indices associated with each skin weight for the specified vertex. The joint indices must be stored in the same order as the weights they are associated with.
- `clearBlendShapeTargets(meshIndex)`
    Deletes all blend shape targets for the specified mesh.
- `setBlendShapeChannelIndex(meshIndex, blendShapeTargetIndex, blendShapeChannelIndex)`
    Sets the matching blend shape channel index of the specified blend shape target. Associate the mesh-local blend shape target index with the absolute blend shape channel index as found in the Definition layer.
- `setBlendShapeTargetDeltas(meshIndex, blendShapeTargetIndex, deltas, count)`
    Sets deltas for each affected vertex.
- `setBlendShapeTargetVertexIndices(meshIndex, blendShapeTargetIndex, vertexIndices, count)`
    Sets vertex position indices affected by the specified blend shape target. The vertex position indices must be stored in the same order as the deltas they are associated with.
