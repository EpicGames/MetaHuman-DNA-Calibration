//Maya ASCII 2018ff09 scene
//Name: head_shader.ma
//Last modified: Thu, May 11, 2023 11:07:07 AM
//Codeset: 1252
requires maya "2018ff09";
requires -nodeType "dx11Shader" "dx11Shader" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201903222215-65bada0e52";
fileInfo "osv" "Microsoft Windows 8 Enterprise Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	rename -uid "CD1D855B-4CC1-03B9-E8CC-E6BF4F8A8291";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 24.558818622337995 37.536741765596531 49.473419305101473 ;
	setAttr ".r" -type "double3" -34.200000000000081 26.400000000000034 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "F3CA1968-42E0-2562-D48E-8E92D22FAA9E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 5;
	setAttr ".fcp" 5000;
	setAttr ".coi" 66.781447814796309;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "454C4DAC-4672-A7BA-5681-D29524B95D6C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "10346C6E-4959-FD63-4770-EB86C0DA9A0F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "438A88D8-4C74-4308-4781-ED938937582F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "91186241-41E7-C094-8F4D-EC8E7485B54C";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "DE4B3D3E-436D-1678-9588-73BCCD1336B9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "EC4CA487-46D7-CDDE-6A85-A1AB658FF36B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "712B377D-4D04-ED6F-9279-4E87D1D1F47D";
	setAttr -s 11 ".lnk";
	setAttr -s 11 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "72D2669D-45F9-DDB6-D9BF-9F83176C46B7";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "2407C35D-4457-2733-8A7D-5D904E5DE24C";
	setAttr -s 3 ".tpdt";
	setAttr ".tpdt[0].tpcd" -type "Int32Array" 1 -1 ;
	setAttr ".tpdt[1].tpcd" -type "Int32Array" 1 -3 ;
	setAttr ".tpdt[1].tpdn" -type "string" "skeleton_015";
	setAttr ".tpdt[3].tppi" 1;
	setAttr ".tpdt[3].tpdn" -type "string" "bodyPoseRederSetup";
createNode displayLayerManager -n "layerManager";
	rename -uid "79BFC8EF-470A-40F6-E1D2-E789AB9B3B69";
	setAttr -s 16 ".dli[1:15]"  1 2 3 4 5 6 7 8 
		9 10 11 12 13 14 15;
createNode displayLayer -n "defaultLayer";
	rename -uid "B6FB5592-4878-4F42-CE19-96A588BDA53F";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "1B641219-4575-A2AC-6492-3CAA2ECDD1E4";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "4ECCDAA8-40DA-ADF4-1313-AC86E060F1AE";
	setAttr ".g" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "9FE00233-4A46-74DA-D6BA-018CBBE3D871";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -330.95236780151544 1.1904761431709079 ;
	setAttr ".tgi[0].vh" -type "double2" 317.85713022663526 338.09522466054096 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "E113578C-46E2-6EF6-76C1-30A7C20853B8";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"updateModelPanelBar\" \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n"
		+ "            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"updateModelPanelBar\" \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"updateModelPanelBar\" \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -editorChanged \"updateModelPanelBar\" \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"all\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n"
		+ "            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 0\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 1\n            -captureSequenceNumber -1\n            -width 1319\n            -height 626\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n"
		+ "            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"<function selCom at 0x7f29c5c04aa0>\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n"
		+ "            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n"
		+ "                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n"
		+ "                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n"
		+ "                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n"
		+ "                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -image \"C:/work/Batman/characters/Bane/sourceimages/Bane_tpage_2048.tga\" \n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n"
		+ "                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n"
		+ "                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererOverrideName \"stereoOverrideVP2\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n"
		+ "                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n"
		+ "            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n"
		+ "            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"pass\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -editorChanged \\\"updateModelPanelBar\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"all\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 1\\n    -captureSequenceNumber -1\\n    -width 1319\\n    -height 626\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -editorChanged \\\"updateModelPanelBar\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"all\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 0\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 1\\n    -captureSequenceNumber -1\\n    -width 1319\\n    -height 626\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"1 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "52A90A50-49D6-A85B-C0B8-41AF6075B53A";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 40 -ast 0 -aet 200 ";
	setAttr ".st" 6;
createNode dx11Shader -n "shader_head_shader";
	rename -uid "DB32AAEB-43AB-449E-DBF5-E882184E97ED";
	addAttr -s false -is true -ci true -k true -sn "te" -ln "techniqueEnum" -nn "Technique" 
		-ct "HW_shader_parameter" -min 0 -max 2 -en "TessellationOFF" -at "enum";
	addAttr -ci true -sn "Light_0_use_implicit_lighting" -ln "Light_0_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_0_connected_light" -ln "Light_0_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_1_use_implicit_lighting" -ln "Light_1_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_1_connected_light" -ln "Light_1_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_2_use_implicit_lighting" -ln "Light_2_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_2_connected_light" -ln "Light_2_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Name" -ln "SuperFilterTaps_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Type" -ln "SuperFilterTaps_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps" -ln "SuperFilterTaps" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "SuperFilterTapsX" -ln "SuperFilterTapsX" -ct "HW_shader_parameter" 
		-dv -0.84052002429962158 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -sn "SuperFilterTapsY" -ln "SuperFilterTapsY" -ct "HW_shader_parameter" 
		-dv -0.073954001069068909 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Name" -ln "shadowMapTexelSize_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Type" -ln "shadowMapTexelSize_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize" -ln "shadowMapTexelSize" 
		-ct "HW_shader_parameter" -dv 0.0019531298894435167 -smn 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Name" -ln "LinearSpaceLighting_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Type" -ln "LinearSpaceLighting_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "LinearSpaceLighting" -ln "LinearSpaceLighting" 
		-nn "Linear Space Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseShadows_Name" -ln "UseShadows_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "UseShadows_Type" -ln "UseShadows_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "UseShadows" -ln "UseShadows" -nn "Shadows" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Name" -ln "shadowMultiplier_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Type" -ln "shadowMultiplier_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowMultiplier" -ln "shadowMultiplier" 
		-nn "Shadow Strength" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Name" -ln "IsSwatchRender_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Type" -ln "IsSwatchRender_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender" -ln "IsSwatchRender" -ct "HW_shader_parameter" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Name" -ln "shadowDepthBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Type" -ln "shadowDepthBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDepthBias" -ln "shadowDepthBias" -nn "Shadow Bias" 
		-ct "HW_shader_parameter" -dv 0.0099999997764825821 -min 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Name" -ln "MayaFullScreenGamma_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Type" -ln "MayaFullScreenGamma_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma" -ln "MayaFullScreenGamma" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Name" -ln "flipBackfaceNormals_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Type" -ln "flipBackfaceNormals_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "flipBackfaceNormals" -ln "flipBackfaceNormals" 
		-nn "Double Sided Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Enable_Name" -ln "light0Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Enable_Type" -ln "light0Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Enable" -ln "light0Enable" -nn "Enable Light 0" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Type_Name" -ln "light0Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Type_Type" -ln "light0Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Type" -ln "light0Type" -nn "Light 0 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light0Pos_Name" -ln "light0Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Pos_Type" -ln "light0Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Pos" -ln "light0Pos" -nn "Light 0 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0Color_Name" -ln "light0Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Color_Type" -ln "light0Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light0Color" -ln "light0Color" -nn "Light 0 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ColorR" -ln "light0ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorG" -ln "light0ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorB" -ln "light0ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -h true -sn "light0Intensity_Name" -ln "light0Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Intensity_Type" -ln "light0Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Intensity" -ln "light0Intensity" -nn "Light 0 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0Dir_Name" -ln "light0Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Dir_Type" -ln "light0Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Dir" -ln "light0Dir" -nn "Light 0 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Name" -ln "light0ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Type" -ln "light0ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0ConeAngle" -ln "light0ConeAngle" -nn "Light 0 Cone Angle" 
		-ct "HW_shader_parameter" -dv 0.46000000834465027 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0FallOff_Name" -ln "light0FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0FallOff_Type" -ln "light0FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0FallOff" -ln "light0FallOff" -nn "Light 0 Penumbra Angle" 
		-ct "HW_shader_parameter" -dv 0.69999998807907104 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Name" -ln "light0AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Type" -ln "light0AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0AttenScale" -ln "light0AttenScale" 
		-nn "Light 0 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Name" -ln "light0ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Type" -ln "light0ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn" -ln "light0ShadowOn" -nn "Light 0 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Enable_Name" -ln "light1Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Enable_Type" -ln "light1Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Enable" -ln "light1Enable" -nn "Enable Light 1" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Type_Name" -ln "light1Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Type_Type" -ln "light1Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Type" -ln "light1Type" -nn "Light 1 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light1Pos_Name" -ln "light1Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Pos_Type" -ln "light1Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Pos" -ln "light1Pos" -nn "Light 1 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1Color_Name" -ln "light1Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Color_Type" -ln "light1Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light1Color" -ln "light1Color" -nn "Light 1 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ColorR" -ln "light1ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorG" -ln "light1ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorB" -ln "light1ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -h true -sn "light1Intensity_Name" -ln "light1Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Intensity_Type" -ln "light1Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Intensity" -ln "light1Intensity" -nn "Light 1 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1Dir_Name" -ln "light1Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Dir_Type" -ln "light1Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Dir" -ln "light1Dir" -nn "Light 1 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Name" -ln "light1ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Type" -ln "light1ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1ConeAngle" -ln "light1ConeAngle" -nn "Light 1 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1FallOff_Name" -ln "light1FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1FallOff_Type" -ln "light1FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1FallOff" -ln "light1FallOff" -nn "Light 1 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Name" -ln "light1AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Type" -ln "light1AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1AttenScale" -ln "light1AttenScale" 
		-nn "Light 1 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Name" -ln "light1ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Type" -ln "light1ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn" -ln "light1ShadowOn" -nn "Light 1 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Enable_Name" -ln "light2Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Enable_Type" -ln "light2Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Enable" -ln "light2Enable" -nn "Enable Light 2" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Type_Name" -ln "light2Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Type_Type" -ln "light2Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Type" -ln "light2Type" -nn "Light 2 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light2Pos_Name" -ln "light2Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Pos_Type" -ln "light2Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Pos" -ln "light2Pos" -nn "Light 2 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2Color_Name" -ln "light2Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Color_Type" -ln "light2Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light2Color" -ln "light2Color" -nn "Light 2 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ColorR" -ln "light2ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorG" -ln "light2ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorB" -ln "light2ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -h true -sn "light2Intensity_Name" -ln "light2Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Intensity_Type" -ln "light2Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Intensity" -ln "light2Intensity" -nn "Light 2 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2Dir_Name" -ln "light2Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Dir_Type" -ln "light2Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Dir" -ln "light2Dir" -nn "Light 2 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Name" -ln "light2ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Type" -ln "light2ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2ConeAngle" -ln "light2ConeAngle" -nn "Light 2 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2FallOff_Name" -ln "light2FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2FallOff_Type" -ln "light2FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2FallOff" -ln "light2FallOff" -nn "Light 2 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Name" -ln "light2AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Type" -ln "light2AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2AttenScale" -ln "light2AttenScale" 
		-nn "Light 2 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Name" -ln "light2ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Type" -ln "light2ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn" -ln "light2ShadowOn" -nn "Light 2 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Name" -ln "UseAmbientOcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Type" -ln "UseAmbientOcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseAmbientOcclusionTexture" -ln "UseAmbientOcclusionTexture" 
		-nn "Use Occlusion Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Name" -ln "transpDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Type" -ln "transpDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "transpDepthTexture" -ln "transpDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "transpDepthTextureR" -ln "transpDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureG" -ln "transpDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureB" -ln "transpDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Name" -ln "opaqueDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Type" -ln "opaqueDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "opaqueDepthTexture" -ln "opaqueDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "opaqueDepthTextureR" -ln "opaqueDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureG" -ln "opaqueDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureB" -ln "opaqueDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Name" -ln "UseDiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Type" -ln "UseDiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTexture" -ln "UseDiffuseTexture" 
		-nn "Use Diffuse Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Name" -ln "UseDiffuseTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Type" -ln "UseDiffuseTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTextureAlpha" -ln "UseDiffuseTextureAlpha" 
		-nn "Use Diffuse Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Name" -ln "DiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Type" -ln "DiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseTexture" -ln "DiffuseTexture" -nn "Diffuse Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseTextureR" -ln "DiffuseTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureG" -ln "DiffuseTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureB" -ln "DiffuseTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Name" -ln "DiffuseColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Type" -ln "DiffuseColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "DiffuseColor" -ln "DiffuseColor" -nn "Diffuse Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseColorR" -ln "DiffuseColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorG" -ln "DiffuseColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorB" -ln "DiffuseColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -h true -sn "Opacity_Name" -ln "Opacity_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Opacity_Type" -ln "Opacity_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Opacity" -ln "Opacity" -nn "Opacity" -ct "HW_shader_parameter" 
		-dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Name" -ln "UseOpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Type" -ln "UseOpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseOpacityMaskTexture" -ln "UseOpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Name" -ln "OpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Type" -ln "OpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OpacityMaskTexture" -ln "OpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OpacityMaskTextureR" -ln "OpacityMaskTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureG" -ln "OpacityMaskTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureB" -ln "OpacityMaskTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Name" -ln "OpacityMaskBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Type" -ln "OpacityMaskBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskBias" -ln "OpacityMaskBias" -nn "Opacity Mask Bias" 
		-ct "HW_shader_parameter" -dv 0.10000000149011612 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Name" -ln "UseSpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Type" -ln "UseSpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTexture" -ln "UseSpecularTexture" 
		-nn "Use Specular Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Name" -ln "SpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Type" -ln "SpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularTexture" -ln "SpecularTexture" -nn "Specular Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularTextureR" -ln "SpecularTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureG" -ln "SpecularTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureB" -ln "SpecularTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -h true -sn "SpecularColor_Name" -ln "SpecularColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularColor_Type" -ln "SpecularColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "SpecularColor" -ln "SpecularColor" -nn "Specular Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularColorR" -ln "SpecularColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorG" -ln "SpecularColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorB" -ln "SpecularColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Name" -ln "UseNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Type" -ln "UseNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseNormalTexture" -ln "UseNormalTexture" 
		-nn "Use Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalTexture_Name" -ln "NormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexture_Type" -ln "NormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "NormalTexture" -ln "NormalTexture" -nn "Normal Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "NormalTextureR" -ln "NormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureG" -ln "NormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureB" -ln "NormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -h true -sn "NormalHeight_Name" -ln "NormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalHeight_Type" -ln "NormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalHeight" -ln "NormalHeight" -nn "Normal Height" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 5 -at "float";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Name" -ln "SupportNonUniformScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Type" -ln "SupportNonUniformScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SupportNonUniformScale" -ln "SupportNonUniformScale" 
		-nn "Support Non-Uniform Scale" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Name" -ln "NormalCoordsysX_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Type" -ln "NormalCoordsysX_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysX" -ln "NormalCoordsysX" -nn "Normal X (Red)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Name" -ln "NormalCoordsysY_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Type" -ln "NormalCoordsysY_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysY" -ln "NormalCoordsysY" -nn "Normal Y (Green)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Name" -ln "DisplacementModel_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Type" -ln "DisplacementModel_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementModel" -ln "DisplacementModel" 
		-nn "Displacement Model" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en 
		"Grayscale:Tangent Vector" -at "enum";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Name" -ln "UseDisplacementMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Type" -ln "UseDisplacementMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDisplacementMap" -ln "UseDisplacementMap" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Name" -ln "DisplacementTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Type" -ln "DisplacementTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DisplacementTexture" -ln "DisplacementTexture" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DisplacementTextureR" -ln "DisplacementTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureG" -ln "DisplacementTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureB" -ln "DisplacementTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Name" -ln "VectorDisplacementCoordSys_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Type" -ln "VectorDisplacementCoordSys_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "VectorDisplacementCoordSys" -ln "VectorDisplacementCoordSys" 
		-nn "Displacement Coordsys" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 
		-en "Mudbox (XZY):Maya (XYZ)" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Name" -ln "DisplacementHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Type" -ln "DisplacementHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementHeight" -ln "DisplacementHeight" 
		-nn "Displacement Height" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Name" -ln "DisplacementOffset_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Type" -ln "DisplacementOffset_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementOffset" -ln "DisplacementOffset" 
		-nn "Displacement Offset" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn -1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Name" -ln "DisplacementClippingBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Type" -ln "DisplacementClippingBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementClippingBias" -ln "DisplacementClippingBias" 
		-nn "Displacement Clipping Bias" -ct "HW_shader_parameter" -dv 5 -min -99999 -max 
		99999 -smn 0 -smx 99 -at "float";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Name" -ln "BBoxExtraScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Type" -ln "BBoxExtraScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "BBoxExtraScale" -ln "BBoxExtraScale" -nn "Bounding Box Extra Scale" 
		-ct "HW_shader_parameter" -dv 1 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationRange_Name" -ln "TessellationRange_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationRange_Type" -ln "TessellationRange_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationRange" -ln "TessellationRange" 
		-nn "Tessellation Range" -ct "HW_shader_parameter" -min 0 -max 99999 -smx 999 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationMin_Name" -ln "TessellationMin_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationMin_Type" -ln "TessellationMin_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationMin" -ln "TessellationMin" -nn "Tessellation Minimum" 
		-ct "HW_shader_parameter" -dv 3 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Name" -ln "FlatTessellation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Type" -ln "FlatTessellation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "FlatTessellation" -ln "FlatTessellation" 
		-nn "Flat Tessellation" -ct "HW_shader_parameter" -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Name" -ln "UseTranslucency_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Type" -ln "UseTranslucency_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseTranslucency" -ln "UseTranslucency" -nn "Back Scattering" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Name" -ln "UseThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Type" -ln "UseThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseThicknessTexture" -ln "UseThicknessTexture" 
		-nn "Use Thickness Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Name" -ln "UseDiffuseIBLMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Type" -ln "UseDiffuseIBLMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseIBLMap" -ln "UseDiffuseIBLMap" 
		-nn "Use Diffuse Cubemap" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Name" -ln "DiffuseIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Type" -ln "DiffuseIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseIBLIntensity" -ln "DiffuseIBLIntensity" 
		-nn "Diffuse IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Name" -ln "DiffuseTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Type" -ln "DiffuseTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseTexcoord" -ln "DiffuseTexcoord" -nn "Diffuse Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Name" -ln "OpacityMaskTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Type" -ln "OpacityMaskTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskTexcoord" -ln "OpacityMaskTexcoord" 
		-nn "Opacity Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Name" -ln "SpecularTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Type" -ln "SpecularTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularTexcoord" -ln "SpecularTexcoord" 
		-nn "Specular Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Name" -ln "NormalTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Type" -ln "NormalTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalTexcoord" -ln "NormalTexcoord" -nn "Normal Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Name" -ln "DisplacementTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Type" -ln "DisplacementTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementTexcoord" -ln "DisplacementTexcoord" 
		-nn "Displacement Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en 
		"TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Name" -ln "ThicknessTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Type" -ln "ThicknessTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "ThicknessTexcoord" -ln "ThicknessTexcoord" 
		-nn "Translucency Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 
		-en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Name" -ln "light0ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Type" -ln "light0ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light0ShadowMap" -ln "light0ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ShadowMapR" -ln "light0ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapG" -ln "light0ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapB" -ln "light0ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Name" -ln "light1ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Type" -ln "light1ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light1ShadowMap" -ln "light1ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ShadowMapR" -ln "light1ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapG" -ln "light1ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapB" -ln "light1ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Name" -ln "light2ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Type" -ln "light2ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light2ShadowMap" -ln "light2ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ShadowMapR" -ln "light2ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapG" -ln "light2ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapB" -ln "light2ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -h true -sn "screenSize_Name" -ln "screenSize_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize_Type" -ln "screenSize_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize" -ln "screenSize" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "screenSizeX" -ln "screenSizeX" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -sn "screenSizeY" -ln "screenSizeY" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -h true -sn "SkyRotation_Name" -ln "SkyRotation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SkyRotation_Type" -ln "SkyRotation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SkyRotation" -ln "SkyRotation" -nn "Sky Rotation" 
		-ct "HW_shader_parameter" -min 0 -max 99999 -smn 0 -smx 360 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Name" -ln "DiffuseCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Type" -ln "DiffuseCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseCubeIBL" -ln "DiffuseCubeIBL" -nn "Diffuse Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseCubeIBLR" -ln "DiffuseCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLG" -ln "DiffuseCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLB" -ln "DiffuseCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Name" -ln "UseSpecCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Type" -ln "UseSpecCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecCubeIBL" -ln "UseSpecCubeIBL" -nn "Use Specular Cubemap" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Name" -ln "SpecularIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Type" -ln "SpecularIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularIBLIntensity" -ln "SpecularIBLIntensity" 
		-nn "Specular IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Name" -ln "SpecularCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Type" -ln "SpecularCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularCubeIBL" -ln "SpecularCubeIBL" -nn "Specular Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularCubeIBLR" -ln "SpecularCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLG" -ln "SpecularCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLB" -ln "SpecularCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -h true -sn "LutTexture_Name" -ln "LutTexture_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LutTexture_Type" -ln "LutTexture_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -uac -sn "LutTexture" -ln "LutTexture" -nn "SSS LUT Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "LutTextureR" -ln "LutTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureG" -ln "LutTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureB" -ln "LutTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -h true -sn "DitherTexture_Name" -ln "DitherTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DitherTexture_Type" -ln "DitherTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DitherTexture" -ln "DitherTexture" -nn "SSS Dither Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DitherTextureR" -ln "DitherTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureG" -ln "DitherTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureB" -ln "DitherTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Name" -ln "skinCoeffX_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Type" -ln "skinCoeffX_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffX" -ln "skinCoeffX" -nn "SSS Coeffient R" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Name" -ln "skinCoeffY_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Type" -ln "skinCoeffY_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffY" -ln "skinCoeffY" -nn "SSS Coeffient G" 
		-ct "HW_shader_parameter" -dv 0.5 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Name" -ln "skinCoeffZ_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Type" -ln "skinCoeffZ_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffZ" -ln "skinCoeffZ" -nn "SSS Coeffient B" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Name" -ln "NormalBlurring_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Type" -ln "NormalBlurring_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalBlurring" -ln "NormalBlurring" -nn "SSS Softness" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Name" -ln "UseScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Type" -ln "UseScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseScatteringRadiusTexture" -ln "UseScatteringRadiusTexture" 
		-nn "Use SSS Radius Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Name" -ln "ScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Type" -ln "ScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "ScatteringRadiusTexture" -ln "ScatteringRadiusTexture" 
		-nn "SSS Radius Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "ScatteringRadiusTextureR" -ln "ScatteringRadiusTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureG" -ln "ScatteringRadiusTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureB" -ln "ScatteringRadiusTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -h true -sn "skinScattering_Name" -ln "skinScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScattering_Type" -ln "skinScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScattering" -ln "skinScattering" -nn "SSS Radius" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowDither_Name" -ln "shadowDither_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDither_Type" -ln "shadowDither_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDither" -ln "shadowDither" -nn "SSS Shadow Dither" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowBlur_Name" -ln "shadowBlur_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "shadowBlur_Type" -ln "shadowBlur_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "shadowBlur" -ln "shadowBlur" -nn "SSS Shadow Blur" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowScattering_Name" -ln "shadowScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowScattering_Type" -ln "shadowScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowScattering" -ln "shadowScattering" 
		-nn "SSS Shadow Scattering" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Name" -ln "shadowSaturation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Type" -ln "shadowSaturation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowSaturation" -ln "shadowSaturation" 
		-nn "SSS Shadow Saturation" -ct "HW_shader_parameter" -dv 1 -min 0 -max 4 -smx 4 
		-at "float";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Name" -ln "BackScatteringThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Type" -ln "BackScatteringThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "BackScatteringThicknessTexture" -ln "BackScatteringThicknessTexture" 
		-nn "Thickness Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureR" -ln "BackScatteringThicknessTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureG" -ln "BackScatteringThicknessTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureB" -ln "BackScatteringThicknessTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Name" -ln "skinScatteringRoughness_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Type" -ln "skinScatteringRoughness_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringRoughness" -ln "skinScatteringRoughness" 
		-nn "Back Scattering Width" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Name" -ln "skinScatteringOuterColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Type" -ln "skinScatteringOuterColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "skinScatteringOuterColor" -ln "skinScatteringOuterColor" 
		-nn "Back Scattering Color" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "skinScatteringOuterColorR" -ln "skinScatteringOuterColorR" 
		-ct "HW_shader_parameter" -dv 0.25 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorG" -ln "skinScatteringOuterColorG" 
		-ct "HW_shader_parameter" -dv 0.05000000074505806 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorB" -ln "skinScatteringOuterColorB" 
		-ct "HW_shader_parameter" -dv 0.019999999552965164 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Name" -ln "skinScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Type" -ln "skinScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringAmount" -ln "skinScatteringAmount" 
		-nn "Back Scattering Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 6 -smx 6 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Name" -ln "skinAmbientScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Type" -ln "skinAmbientScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinAmbientScatteringAmount" -ln "skinAmbientScatteringAmount" 
		-nn "Back Scattering Ambient Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 
		6 -smx 6 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Name" -ln "UseSpecularTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Type" -ln "UseSpecularTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTextureAlpha" -ln "UseSpecularTextureAlpha" 
		-nn "Use Roughness Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "LobeMix_Name" -ln "LobeMix_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LobeMix_Type" -ln "LobeMix_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "LobeMix" -ln "LobeMix" -nn "Lobe Mixing" 
		-ct "HW_shader_parameter" -dv 0.75 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "Roughness_Name" -ln "Roughness_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Roughness_Type" -ln "Roughness_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Roughness" -ln "Roughness" -nn "Roughness multiplier" 
		-ct "HW_shader_parameter" -dv 0.20000000298023224 -min 0.0099999997764825821 -max 
		1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Name" -ln "OcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Type" -ln "OcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OcclusionTexture" -ln "OcclusionTexture" -nn "Ambient Occlusion Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OcclusionTextureR" -ln "OcclusionTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureG" -ln "OcclusionTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureB" -ln "OcclusionTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Name" -ln "OcclusionAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Type" -ln "OcclusionAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionAmount" -ln "OcclusionAmount" -nn "Occlusion Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Name" -ln "UseCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Type" -ln "UseCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseCavityTexture" -ln "UseCavityTexture" 
		-nn "Use Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "CavityTexture_Name" -ln "CavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityTexture_Type" -ln "CavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "CavityTexture" -ln "CavityTexture" -nn "Cavity Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "CavityTextureR" -ln "CavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureG" -ln "CavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureB" -ln "CavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -h true -sn "CavityAmount_Name" -ln "CavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityAmount_Type" -ln "CavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "CavityAmount" -ln "CavityAmount" -nn "Cavity Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Name" -ln "UseMicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Type" -ln "UseMicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroCavityTexture" -ln "UseMicroCavityTexture" 
		-nn "Use Micro Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Name" -ln "MicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Type" -ln "MicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroCavityTexture" -ln "MicroCavityTexture" 
		-nn "Micro Cavity Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroCavityTextureR" -ln "MicroCavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureG" -ln "MicroCavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureB" -ln "MicroCavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Name" -ln "MicroCavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Type" -ln "MicroCavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroCavityAmount" -ln "MicroCavityAmount" 
		-nn "Micro Cavity Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Name" -ln "UseMicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Type" -ln "UseMicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroNormalTexture" -ln "UseMicroNormalTexture" 
		-nn "Use Micro Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Name" -ln "MicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Type" -ln "MicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroNormalTexture" -ln "MicroNormalTexture" 
		-nn "Micro Normal Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroNormalTextureR" -ln "MicroNormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureG" -ln "MicroNormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureB" -ln "MicroNormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Name" -ln "MicroNormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Type" -ln "MicroNormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroNormalHeight" -ln "MicroNormalHeight" 
		-nn "Micro Normal Height" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		5 -at "float";
	addAttr -is true -ci true -h true -sn "MicroScale_Name" -ln "MicroScale_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "MicroScale_Type" -ln "MicroScale_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "MicroScale" -ln "MicroScale" -nn "Micro Scale" 
		-ct "HW_shader_parameter" -dv 32 -min 16 -max 99999 -smx 256 -at "float";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Name" -ln "UseBlendTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Type" -ln "UseBlendTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseBlendTexture" -ln "UseBlendTexture" -nn "Enable Wrinkle Mixing" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Name" -ln "OcclusionTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Type" -ln "OcclusionTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionTexcoord" -ln "OcclusionTexcoord" 
		-nn "Ambient Occlusion Map UV" -ct "HW_shader_parameter" -dv 1 -min 0 -max 2 -smn 
		0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -ci true -sn "Position" -ln "Position" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Position_Name" -ln "Position_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -h true -sn "Position_Source" -ln "Position_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -sn "Position_DefaultTexture" -ln "Position_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Position";
	addAttr -ci true -sn "TexCoord0" -ln "TexCoord0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord0_Name" -ln "TexCoord0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord0";
	addAttr -is true -ci true -h true -sn "TexCoord0_Source" -ln "TexCoord0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -is true -ci true -sn "TexCoord0_DefaultTexture" -ln "TexCoord0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -ci true -sn "TexCoord1" -ln "TexCoord1" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord1_Name" -ln "TexCoord1_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord1";
	addAttr -is true -ci true -h true -sn "TexCoord1_Source" -ln "TexCoord1_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -is true -ci true -sn "TexCoord1_DefaultTexture" -ln "TexCoord1_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -ci true -sn "TexCoord2" -ln "TexCoord2" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord2_Name" -ln "TexCoord2_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord2";
	addAttr -is true -ci true -h true -sn "TexCoord2_Source" -ln "TexCoord2_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -is true -ci true -sn "TexCoord2_DefaultTexture" -ln "TexCoord2_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -ci true -sn "Normal" -ln "Normal" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Normal_Name" -ln "Normal_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -h true -sn "Normal_Source" -ln "Normal_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -sn "Normal_DefaultTexture" -ln "Normal_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Normal";
	addAttr -ci true -sn "Binormal0" -ln "Binormal0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Binormal0_Name" -ln "Binormal0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Binormal0";
	addAttr -is true -ci true -h true -sn "Binormal0_Source" -ln "Binormal0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -is true -ci true -sn "Binormal0_DefaultTexture" -ln "Binormal0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -ci true -sn "Tangent0" -ln "Tangent0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Tangent0_Name" -ln "Tangent0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -h true -sn "Tangent0_Source" -ln "Tangent0_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -sn "Tangent0_DefaultTexture" -ln "Tangent0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Tangent0";
	addAttr -is true -ci true -h true -sn "animNormalMap_00_Name" -ln "animNormalMap_00_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animNormalMap_00_Type" -ln "animNormalMap_00_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animNormalMap_00" -ln "animNormalMap_00" -nn "Wrinkle Map 00" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animNormalMap_00R" -ln "animNormalMap_00R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_00";
	addAttr -is true -ci true -sn "animNormalMap_00G" -ln "animNormalMap_00G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_00";
	addAttr -is true -ci true -sn "animNormalMap_00B" -ln "animNormalMap_00B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_00";
	addAttr -is true -ci true -h true -sn "maskChannel_00_Name" -ln "maskChannel_00_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_00_Type" -ln "maskChannel_00_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_00" -ln "maskChannel_00" -nn "Channel 00 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_00R" -ln "maskChannel_00R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_00";
	addAttr -is true -ci true -sn "maskChannel_00G" -ln "maskChannel_00G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_00";
	addAttr -is true -ci true -sn "maskChannel_00B" -ln "maskChannel_00B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_00";
	addAttr -is true -ci true -h true -sn "maskChannel_01_Name" -ln "maskChannel_01_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_01_Type" -ln "maskChannel_01_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_01" -ln "maskChannel_01" -nn "Channel 01 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_01R" -ln "maskChannel_01R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_01";
	addAttr -is true -ci true -sn "maskChannel_01G" -ln "maskChannel_01G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_01";
	addAttr -is true -ci true -sn "maskChannel_01B" -ln "maskChannel_01B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_01";
	addAttr -is true -ci true -h true -sn "animNormalMap_01_Name" -ln "animNormalMap_01_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animNormalMap_01_Type" -ln "animNormalMap_01_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animNormalMap_01" -ln "animNormalMap_01" -nn "Wrinkle Map 01" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animNormalMap_01R" -ln "animNormalMap_01R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_01";
	addAttr -is true -ci true -sn "animNormalMap_01G" -ln "animNormalMap_01G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_01";
	addAttr -is true -ci true -sn "animNormalMap_01B" -ln "animNormalMap_01B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_01";
	addAttr -is true -ci true -h true -sn "maskChannel_02_Name" -ln "maskChannel_02_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_02_Type" -ln "maskChannel_02_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_02" -ln "maskChannel_02" -nn "Channel 02 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_02R" -ln "maskChannel_02R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_02";
	addAttr -is true -ci true -sn "maskChannel_02G" -ln "maskChannel_02G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_02";
	addAttr -is true -ci true -sn "maskChannel_02B" -ln "maskChannel_02B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_02";
	addAttr -is true -ci true -h true -sn "animNormalMap_02_Name" -ln "animNormalMap_02_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animNormalMap_02_Type" -ln "animNormalMap_02_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animNormalMap_02" -ln "animNormalMap_02" -nn "Wrinkle Map 02" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animNormalMap_02R" -ln "animNormalMap_02R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_02";
	addAttr -is true -ci true -sn "animNormalMap_02G" -ln "animNormalMap_02G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_02";
	addAttr -is true -ci true -sn "animNormalMap_02B" -ln "animNormalMap_02B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animNormalMap_02";
	addAttr -is true -ci true -h true -sn "maskChannel_03_Name" -ln "maskChannel_03_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_03_Type" -ln "maskChannel_03_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_03" -ln "maskChannel_03" -nn "Channel 03 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_03R" -ln "maskChannel_03R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_03";
	addAttr -is true -ci true -sn "maskChannel_03G" -ln "maskChannel_03G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_03";
	addAttr -is true -ci true -sn "maskChannel_03B" -ln "maskChannel_03B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_03";
	addAttr -is true -ci true -h true -sn "animColorMap_00_Name" -ln "animColorMap_00_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animColorMap_00_Type" -ln "animColorMap_00_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animColorMap_00" -ln "animColorMap_00" -nn "Blood Flow 00" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animColorMap_00R" -ln "animColorMap_00R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_00";
	addAttr -is true -ci true -sn "animColorMap_00G" -ln "animColorMap_00G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_00";
	addAttr -is true -ci true -sn "animColorMap_00B" -ln "animColorMap_00B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_00";
	addAttr -is true -ci true -h true -sn "maskChannel_04_Name" -ln "maskChannel_04_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_04_Type" -ln "maskChannel_04_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_04" -ln "maskChannel_04" -nn "Channel 04 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_04R" -ln "maskChannel_04R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_04";
	addAttr -is true -ci true -sn "maskChannel_04G" -ln "maskChannel_04G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_04";
	addAttr -is true -ci true -sn "maskChannel_04B" -ln "maskChannel_04B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_04";
	addAttr -is true -ci true -h true -sn "animColorMap_01_Name" -ln "animColorMap_01_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animColorMap_01_Type" -ln "animColorMap_01_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animColorMap_01" -ln "animColorMap_01" -nn "Blood Flow 01" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animColorMap_01R" -ln "animColorMap_01R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_01";
	addAttr -is true -ci true -sn "animColorMap_01G" -ln "animColorMap_01G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_01";
	addAttr -is true -ci true -sn "animColorMap_01B" -ln "animColorMap_01B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_01";
	addAttr -is true -ci true -h true -sn "animColorMap_02_Name" -ln "animColorMap_02_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "animColorMap_02_Type" -ln "animColorMap_02_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "animColorMap_02" -ln "animColorMap_02" -nn "Blood Flow 02" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "animColorMap_02R" -ln "animColorMap_02R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_02";
	addAttr -is true -ci true -sn "animColorMap_02G" -ln "animColorMap_02G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_02";
	addAttr -is true -ci true -sn "animColorMap_02B" -ln "animColorMap_02B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "animColorMap_02";
	addAttr -is true -ci true -h true -sn "maskChannel_05_Name" -ln "maskChannel_05_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_05_Type" -ln "maskChannel_05_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_05" -ln "maskChannel_05" -nn "Channel 05 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_05R" -ln "maskChannel_05R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_05";
	addAttr -is true -ci true -sn "maskChannel_05G" -ln "maskChannel_05G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_05";
	addAttr -is true -ci true -sn "maskChannel_05B" -ln "maskChannel_05B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_05";
	addAttr -is true -ci true -h true -sn "maskWeight_00_Name" -ln "maskWeight_00_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_00_Type" -ln "maskWeight_00_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_00" -ln "maskWeight_00" -nn "Channel 00 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_06_Name" -ln "maskChannel_06_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_06_Type" -ln "maskChannel_06_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_06" -ln "maskChannel_06" -nn "Channel 06 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_06R" -ln "maskChannel_06R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_06";
	addAttr -is true -ci true -sn "maskChannel_06G" -ln "maskChannel_06G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_06";
	addAttr -is true -ci true -sn "maskChannel_06B" -ln "maskChannel_06B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_06";
	addAttr -is true -ci true -h true -sn "maskWeight_01_Name" -ln "maskWeight_01_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_01_Type" -ln "maskWeight_01_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_01" -ln "maskWeight_01" -nn "Channel 01 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_07_Name" -ln "maskChannel_07_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_07_Type" -ln "maskChannel_07_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_07" -ln "maskChannel_07" -nn "Channel 07 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_07R" -ln "maskChannel_07R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_07";
	addAttr -is true -ci true -sn "maskChannel_07G" -ln "maskChannel_07G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_07";
	addAttr -is true -ci true -sn "maskChannel_07B" -ln "maskChannel_07B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_07";
	addAttr -is true -ci true -h true -sn "maskWeight_02_Name" -ln "maskWeight_02_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_02_Type" -ln "maskWeight_02_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_02" -ln "maskWeight_02" -nn "Channel 02 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_08_Name" -ln "maskChannel_08_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_08_Type" -ln "maskChannel_08_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_08" -ln "maskChannel_08" -nn "Channel 08 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_08R" -ln "maskChannel_08R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_08";
	addAttr -is true -ci true -sn "maskChannel_08G" -ln "maskChannel_08G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_08";
	addAttr -is true -ci true -sn "maskChannel_08B" -ln "maskChannel_08B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_08";
	addAttr -is true -ci true -h true -sn "maskChannel_09_Name" -ln "maskChannel_09_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_09_Type" -ln "maskChannel_09_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_09" -ln "maskChannel_09" -nn "Channel 09 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_09R" -ln "maskChannel_09R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_09";
	addAttr -is true -ci true -sn "maskChannel_09G" -ln "maskChannel_09G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_09";
	addAttr -is true -ci true -sn "maskChannel_09B" -ln "maskChannel_09B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_09";
	addAttr -is true -ci true -h true -sn "maskWeight_03_Name" -ln "maskWeight_03_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_03_Type" -ln "maskWeight_03_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_03" -ln "maskWeight_03" -nn "Channel 03 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_10_Name" -ln "maskChannel_10_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_10_Type" -ln "maskChannel_10_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_10" -ln "maskChannel_10" -nn "Channel 10 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_10R" -ln "maskChannel_10R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_10";
	addAttr -is true -ci true -sn "maskChannel_10G" -ln "maskChannel_10G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_10";
	addAttr -is true -ci true -sn "maskChannel_10B" -ln "maskChannel_10B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_10";
	addAttr -is true -ci true -h true -sn "maskWeight_04_Name" -ln "maskWeight_04_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_04_Type" -ln "maskWeight_04_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_04" -ln "maskWeight_04" -nn "Channel 04 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_05_Name" -ln "maskWeight_05_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_05_Type" -ln "maskWeight_05_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_05" -ln "maskWeight_05" -nn "Channel 05 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_11_Name" -ln "maskChannel_11_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_11_Type" -ln "maskChannel_11_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_11" -ln "maskChannel_11" -nn "Channel 11 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_11R" -ln "maskChannel_11R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_11";
	addAttr -is true -ci true -sn "maskChannel_11G" -ln "maskChannel_11G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_11";
	addAttr -is true -ci true -sn "maskChannel_11B" -ln "maskChannel_11B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_11";
	addAttr -is true -ci true -h true -sn "maskWeight_06_Name" -ln "maskWeight_06_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_06_Type" -ln "maskWeight_06_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_06" -ln "maskWeight_06" -nn "Channel 06 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_12_Name" -ln "maskChannel_12_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_12_Type" -ln "maskChannel_12_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_12" -ln "maskChannel_12" -nn "Channel 12 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_12R" -ln "maskChannel_12R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_12";
	addAttr -is true -ci true -sn "maskChannel_12G" -ln "maskChannel_12G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_12";
	addAttr -is true -ci true -sn "maskChannel_12B" -ln "maskChannel_12B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_12";
	addAttr -is true -ci true -h true -sn "maskChannel_13_Name" -ln "maskChannel_13_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_13_Type" -ln "maskChannel_13_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_13" -ln "maskChannel_13" -nn "Channel 13 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_13R" -ln "maskChannel_13R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_13";
	addAttr -is true -ci true -sn "maskChannel_13G" -ln "maskChannel_13G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_13";
	addAttr -is true -ci true -sn "maskChannel_13B" -ln "maskChannel_13B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_13";
	addAttr -is true -ci true -h true -sn "maskWeight_07_Name" -ln "maskWeight_07_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_07_Type" -ln "maskWeight_07_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_07" -ln "maskWeight_07" -nn "Channel 07 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_08_Name" -ln "maskWeight_08_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_08_Type" -ln "maskWeight_08_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_08" -ln "maskWeight_08" -nn "Channel 08 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_14_Name" -ln "maskChannel_14_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_14_Type" -ln "maskChannel_14_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_14" -ln "maskChannel_14" -nn "Channel 14 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_14R" -ln "maskChannel_14R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_14";
	addAttr -is true -ci true -sn "maskChannel_14G" -ln "maskChannel_14G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_14";
	addAttr -is true -ci true -sn "maskChannel_14B" -ln "maskChannel_14B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_14";
	addAttr -is true -ci true -h true -sn "maskChannel_15_Name" -ln "maskChannel_15_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_15_Type" -ln "maskChannel_15_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_15" -ln "maskChannel_15" -nn "Channel 15 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_15R" -ln "maskChannel_15R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_15";
	addAttr -is true -ci true -sn "maskChannel_15G" -ln "maskChannel_15G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_15";
	addAttr -is true -ci true -sn "maskChannel_15B" -ln "maskChannel_15B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_15";
	addAttr -is true -ci true -h true -sn "maskWeight_09_Name" -ln "maskWeight_09_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_09_Type" -ln "maskWeight_09_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_09" -ln "maskWeight_09" -nn "Channel 09 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_16_Name" -ln "maskChannel_16_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_16_Type" -ln "maskChannel_16_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_16" -ln "maskChannel_16" -nn "Channel 16 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_16R" -ln "maskChannel_16R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_16";
	addAttr -is true -ci true -sn "maskChannel_16G" -ln "maskChannel_16G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_16";
	addAttr -is true -ci true -sn "maskChannel_16B" -ln "maskChannel_16B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_16";
	addAttr -is true -ci true -h true -sn "maskWeight_10_Name" -ln "maskWeight_10_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_10_Type" -ln "maskWeight_10_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_10" -ln "maskWeight_10" -nn "Channel 10 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_17_Name" -ln "maskChannel_17_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_17_Type" -ln "maskChannel_17_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_17" -ln "maskChannel_17" -nn "Channel 17 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_17R" -ln "maskChannel_17R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_17";
	addAttr -is true -ci true -sn "maskChannel_17G" -ln "maskChannel_17G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_17";
	addAttr -is true -ci true -sn "maskChannel_17B" -ln "maskChannel_17B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_17";
	addAttr -is true -ci true -h true -sn "maskWeight_11_Name" -ln "maskWeight_11_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_11_Type" -ln "maskWeight_11_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_11" -ln "maskWeight_11" -nn "Channel 11 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_12_Name" -ln "maskWeight_12_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_12_Type" -ln "maskWeight_12_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_12" -ln "maskWeight_12" -nn "Channel 12 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_18_Name" -ln "maskChannel_18_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_18_Type" -ln "maskChannel_18_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_18" -ln "maskChannel_18" -nn "Channel 18 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_18R" -ln "maskChannel_18R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_18";
	addAttr -is true -ci true -sn "maskChannel_18G" -ln "maskChannel_18G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_18";
	addAttr -is true -ci true -sn "maskChannel_18B" -ln "maskChannel_18B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_18";
	addAttr -is true -ci true -h true -sn "maskWeight_13_Name" -ln "maskWeight_13_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_13_Type" -ln "maskWeight_13_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_13" -ln "maskWeight_13" -nn "Channel 13 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_19_Name" -ln "maskChannel_19_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_19_Type" -ln "maskChannel_19_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_19" -ln "maskChannel_19" -nn "Channel 19 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_19R" -ln "maskChannel_19R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_19";
	addAttr -is true -ci true -sn "maskChannel_19G" -ln "maskChannel_19G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_19";
	addAttr -is true -ci true -sn "maskChannel_19B" -ln "maskChannel_19B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_19";
	addAttr -is true -ci true -h true -sn "maskWeight_14_Name" -ln "maskWeight_14_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_14_Type" -ln "maskWeight_14_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_14" -ln "maskWeight_14" -nn "Channel 14 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_20_Name" -ln "maskChannel_20_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_20_Type" -ln "maskChannel_20_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_20" -ln "maskChannel_20" -nn "Channel 20 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_20R" -ln "maskChannel_20R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_20";
	addAttr -is true -ci true -sn "maskChannel_20G" -ln "maskChannel_20G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_20";
	addAttr -is true -ci true -sn "maskChannel_20B" -ln "maskChannel_20B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_20";
	addAttr -is true -ci true -h true -sn "maskWeight_15_Name" -ln "maskWeight_15_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_15_Type" -ln "maskWeight_15_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_15" -ln "maskWeight_15" -nn "Channel 15 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_21_Name" -ln "maskChannel_21_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_21_Type" -ln "maskChannel_21_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_21" -ln "maskChannel_21" -nn "Channel 21 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_21R" -ln "maskChannel_21R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_21";
	addAttr -is true -ci true -sn "maskChannel_21G" -ln "maskChannel_21G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_21";
	addAttr -is true -ci true -sn "maskChannel_21B" -ln "maskChannel_21B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_21";
	addAttr -is true -ci true -h true -sn "maskWeight_16_Name" -ln "maskWeight_16_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_16_Type" -ln "maskWeight_16_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_16" -ln "maskWeight_16" -nn "Channel 16 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_22_Name" -ln "maskChannel_22_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_22_Type" -ln "maskChannel_22_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_22" -ln "maskChannel_22" -nn "Channel 22 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_22R" -ln "maskChannel_22R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_22";
	addAttr -is true -ci true -sn "maskChannel_22G" -ln "maskChannel_22G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_22";
	addAttr -is true -ci true -sn "maskChannel_22B" -ln "maskChannel_22B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_22";
	addAttr -is true -ci true -h true -sn "maskWeight_17_Name" -ln "maskWeight_17_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_17_Type" -ln "maskWeight_17_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_17" -ln "maskWeight_17" -nn "Channel 17 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_23_Name" -ln "maskChannel_23_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_23_Type" -ln "maskChannel_23_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_23" -ln "maskChannel_23" -nn "Channel 23 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_23R" -ln "maskChannel_23R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_23";
	addAttr -is true -ci true -sn "maskChannel_23G" -ln "maskChannel_23G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_23";
	addAttr -is true -ci true -sn "maskChannel_23B" -ln "maskChannel_23B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_23";
	addAttr -is true -ci true -h true -sn "maskWeight_18_Name" -ln "maskWeight_18_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_18_Type" -ln "maskWeight_18_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_18" -ln "maskWeight_18" -nn "Channel 18 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_24_Name" -ln "maskChannel_24_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_24_Type" -ln "maskChannel_24_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_24" -ln "maskChannel_24" -nn "Channel 24 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_24R" -ln "maskChannel_24R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_24";
	addAttr -is true -ci true -sn "maskChannel_24G" -ln "maskChannel_24G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_24";
	addAttr -is true -ci true -sn "maskChannel_24B" -ln "maskChannel_24B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_24";
	addAttr -is true -ci true -h true -sn "maskChannel_25_Name" -ln "maskChannel_25_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_25_Type" -ln "maskChannel_25_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_25" -ln "maskChannel_25" -nn "Channel 25 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_25R" -ln "maskChannel_25R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_25";
	addAttr -is true -ci true -sn "maskChannel_25G" -ln "maskChannel_25G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_25";
	addAttr -is true -ci true -sn "maskChannel_25B" -ln "maskChannel_25B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_25";
	addAttr -is true -ci true -h true -sn "maskWeight_19_Name" -ln "maskWeight_19_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_19_Type" -ln "maskWeight_19_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_19" -ln "maskWeight_19" -nn "Channel 19 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_20_Name" -ln "maskWeight_20_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_20_Type" -ln "maskWeight_20_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_20" -ln "maskWeight_20" -nn "Channel 20 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_26_Name" -ln "maskChannel_26_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_26_Type" -ln "maskChannel_26_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_26" -ln "maskChannel_26" -nn "Channel 26 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_26R" -ln "maskChannel_26R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_26";
	addAttr -is true -ci true -sn "maskChannel_26G" -ln "maskChannel_26G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_26";
	addAttr -is true -ci true -sn "maskChannel_26B" -ln "maskChannel_26B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_26";
	addAttr -is true -ci true -h true -sn "maskWeight_21_Name" -ln "maskWeight_21_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_21_Type" -ln "maskWeight_21_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_21" -ln "maskWeight_21" -nn "Channel 21 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_27_Name" -ln "maskChannel_27_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_27_Type" -ln "maskChannel_27_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_27" -ln "maskChannel_27" -nn "Channel 27 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_27R" -ln "maskChannel_27R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_27";
	addAttr -is true -ci true -sn "maskChannel_27G" -ln "maskChannel_27G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_27";
	addAttr -is true -ci true -sn "maskChannel_27B" -ln "maskChannel_27B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_27";
	addAttr -is true -ci true -h true -sn "maskWeight_22_Name" -ln "maskWeight_22_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_22_Type" -ln "maskWeight_22_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_22" -ln "maskWeight_22" -nn "Channel 22 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_28_Name" -ln "maskChannel_28_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_28_Type" -ln "maskChannel_28_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_28" -ln "maskChannel_28" -nn "Channel 28 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_28R" -ln "maskChannel_28R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_28";
	addAttr -is true -ci true -sn "maskChannel_28G" -ln "maskChannel_28G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_28";
	addAttr -is true -ci true -sn "maskChannel_28B" -ln "maskChannel_28B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_28";
	addAttr -is true -ci true -h true -sn "maskWeight_23_Name" -ln "maskWeight_23_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_23_Type" -ln "maskWeight_23_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_23" -ln "maskWeight_23" -nn "Channel 23 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_29_Name" -ln "maskChannel_29_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_29_Type" -ln "maskChannel_29_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_29" -ln "maskChannel_29" -nn "Channel 29 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_29R" -ln "maskChannel_29R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_29";
	addAttr -is true -ci true -sn "maskChannel_29G" -ln "maskChannel_29G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_29";
	addAttr -is true -ci true -sn "maskChannel_29B" -ln "maskChannel_29B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_29";
	addAttr -is true -ci true -h true -sn "maskChannel_30_Name" -ln "maskChannel_30_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_30_Type" -ln "maskChannel_30_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_30" -ln "maskChannel_30" -nn "Channel 30 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_30R" -ln "maskChannel_30R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_30";
	addAttr -is true -ci true -sn "maskChannel_30G" -ln "maskChannel_30G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_30";
	addAttr -is true -ci true -sn "maskChannel_30B" -ln "maskChannel_30B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_30";
	addAttr -is true -ci true -h true -sn "maskWeight_24_Name" -ln "maskWeight_24_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_24_Type" -ln "maskWeight_24_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_24" -ln "maskWeight_24" -nn "Channel 24 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_25_Name" -ln "maskWeight_25_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_25_Type" -ln "maskWeight_25_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_25" -ln "maskWeight_25" -nn "Channel 25 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_31_Name" -ln "maskChannel_31_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_31_Type" -ln "maskChannel_31_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_31" -ln "maskChannel_31" -nn "Channel 31 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_31R" -ln "maskChannel_31R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_31";
	addAttr -is true -ci true -sn "maskChannel_31G" -ln "maskChannel_31G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_31";
	addAttr -is true -ci true -sn "maskChannel_31B" -ln "maskChannel_31B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_31";
	addAttr -is true -ci true -h true -sn "maskWeight_26_Name" -ln "maskWeight_26_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_26_Type" -ln "maskWeight_26_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_26" -ln "maskWeight_26" -nn "Channel 26 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_32_Name" -ln "maskChannel_32_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_32_Type" -ln "maskChannel_32_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_32" -ln "maskChannel_32" -nn "Channel 32 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_32R" -ln "maskChannel_32R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_32";
	addAttr -is true -ci true -sn "maskChannel_32G" -ln "maskChannel_32G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_32";
	addAttr -is true -ci true -sn "maskChannel_32B" -ln "maskChannel_32B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_32";
	addAttr -is true -ci true -h true -sn "maskWeight_27_Name" -ln "maskWeight_27_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_27_Type" -ln "maskWeight_27_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_27" -ln "maskWeight_27" -nn "Channel 27 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_33_Name" -ln "maskChannel_33_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_33_Type" -ln "maskChannel_33_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_33" -ln "maskChannel_33" -nn "Channel 33 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_33R" -ln "maskChannel_33R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_33";
	addAttr -is true -ci true -sn "maskChannel_33G" -ln "maskChannel_33G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_33";
	addAttr -is true -ci true -sn "maskChannel_33B" -ln "maskChannel_33B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_33";
	addAttr -is true -ci true -h true -sn "maskWeight_28_Name" -ln "maskWeight_28_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_28_Type" -ln "maskWeight_28_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_28" -ln "maskWeight_28" -nn "Channel 28 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_34_Name" -ln "maskChannel_34_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_34_Type" -ln "maskChannel_34_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_34" -ln "maskChannel_34" -nn "Channel 34 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_34R" -ln "maskChannel_34R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_34";
	addAttr -is true -ci true -sn "maskChannel_34G" -ln "maskChannel_34G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_34";
	addAttr -is true -ci true -sn "maskChannel_34B" -ln "maskChannel_34B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_34";
	addAttr -is true -ci true -h true -sn "maskWeight_29_Name" -ln "maskWeight_29_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_29_Type" -ln "maskWeight_29_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_29" -ln "maskWeight_29" -nn "Channel 29 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_35_Name" -ln "maskChannel_35_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_35_Type" -ln "maskChannel_35_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_35" -ln "maskChannel_35" -nn "Channel 35 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_35R" -ln "maskChannel_35R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_35";
	addAttr -is true -ci true -sn "maskChannel_35G" -ln "maskChannel_35G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_35";
	addAttr -is true -ci true -sn "maskChannel_35B" -ln "maskChannel_35B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_35";
	addAttr -is true -ci true -h true -sn "maskWeight_30_Name" -ln "maskWeight_30_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_30_Type" -ln "maskWeight_30_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_30" -ln "maskWeight_30" -nn "Channel 30 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskChannel_36_Name" -ln "maskChannel_36_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskChannel_36_Type" -ln "maskChannel_36_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "maskChannel_36" -ln "maskChannel_36" -nn "Channel 36 Mask" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "maskChannel_36R" -ln "maskChannel_36R" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_36";
	addAttr -is true -ci true -sn "maskChannel_36G" -ln "maskChannel_36G" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_36";
	addAttr -is true -ci true -sn "maskChannel_36B" -ln "maskChannel_36B" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "maskChannel_36";
	addAttr -is true -ci true -h true -sn "maskWeight_31_Name" -ln "maskWeight_31_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_31_Type" -ln "maskWeight_31_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_31" -ln "maskWeight_31" -nn "Channel 31 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_32_Name" -ln "maskWeight_32_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_32_Type" -ln "maskWeight_32_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_32" -ln "maskWeight_32" -nn "Channel 32 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_33_Name" -ln "maskWeight_33_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_33_Type" -ln "maskWeight_33_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_33" -ln "maskWeight_33" -nn "Channel 33 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_34_Name" -ln "maskWeight_34_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_34_Type" -ln "maskWeight_34_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_34" -ln "maskWeight_34" -nn "Channel 34 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_35_Name" -ln "maskWeight_35_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_35_Type" -ln "maskWeight_35_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_35" -ln "maskWeight_35" -nn "Channel 35 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_36_Name" -ln "maskWeight_36_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_36_Type" -ln "maskWeight_36_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_36" -ln "maskWeight_36" -nn "Channel 36 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_37_Name" -ln "maskWeight_37_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_37_Type" -ln "maskWeight_37_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_37" -ln "maskWeight_37" -nn "Channel 37 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_38_Name" -ln "maskWeight_38_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_38_Type" -ln "maskWeight_38_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_38" -ln "maskWeight_38" -nn "Channel 38 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_39_Name" -ln "maskWeight_39_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_39_Type" -ln "maskWeight_39_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_39" -ln "maskWeight_39" -nn "Channel 39 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_40_Name" -ln "maskWeight_40_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_40_Type" -ln "maskWeight_40_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_40" -ln "maskWeight_40" -nn "Channel 40 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_41_Name" -ln "maskWeight_41_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_41_Type" -ln "maskWeight_41_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_41" -ln "maskWeight_41" -nn "Channel 41 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_42_Name" -ln "maskWeight_42_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_42_Type" -ln "maskWeight_42_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_42" -ln "maskWeight_42" -nn "Channel 42 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_43_Name" -ln "maskWeight_43_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_43_Type" -ln "maskWeight_43_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_43" -ln "maskWeight_43" -nn "Channel 43 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_44_Name" -ln "maskWeight_44_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_44_Type" -ln "maskWeight_44_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_44" -ln "maskWeight_44" -nn "Channel 44 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_45_Name" -ln "maskWeight_45_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_45_Type" -ln "maskWeight_45_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_45" -ln "maskWeight_45" -nn "Channel 45 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_46_Name" -ln "maskWeight_46_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_46_Type" -ln "maskWeight_46_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_46" -ln "maskWeight_46" -nn "Channel 46 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_47_Name" -ln "maskWeight_47_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_47_Type" -ln "maskWeight_47_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_47" -ln "maskWeight_47" -nn "Channel 47 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_48_Name" -ln "maskWeight_48_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_48_Type" -ln "maskWeight_48_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_48" -ln "maskWeight_48" -nn "Channel 48 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_49_Name" -ln "maskWeight_49_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_49_Type" -ln "maskWeight_49_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_49" -ln "maskWeight_49" -nn "Channel 49 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_50_Name" -ln "maskWeight_50_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_50_Type" -ln "maskWeight_50_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_50" -ln "maskWeight_50" -nn "Channel 50 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_51_Name" -ln "maskWeight_51_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_51_Type" -ln "maskWeight_51_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_51" -ln "maskWeight_51" -nn "Channel 51 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_52_Name" -ln "maskWeight_52_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_52_Type" -ln "maskWeight_52_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_52" -ln "maskWeight_52" -nn "Channel 52 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_53_Name" -ln "maskWeight_53_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_53_Type" -ln "maskWeight_53_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_53" -ln "maskWeight_53" -nn "Channel 53 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_54_Name" -ln "maskWeight_54_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_54_Type" -ln "maskWeight_54_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_54" -ln "maskWeight_54" -nn "Channel 54 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_55_Name" -ln "maskWeight_55_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_55_Type" -ln "maskWeight_55_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_55" -ln "maskWeight_55" -nn "Channel 55 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_56_Name" -ln "maskWeight_56_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_56_Type" -ln "maskWeight_56_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_56" -ln "maskWeight_56" -nn "Channel 56 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_57_Name" -ln "maskWeight_57_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_57_Type" -ln "maskWeight_57_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_57" -ln "maskWeight_57" -nn "Channel 57 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_58_Name" -ln "maskWeight_58_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_58_Type" -ln "maskWeight_58_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_58" -ln "maskWeight_58" -nn "Channel 58 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_59_Name" -ln "maskWeight_59_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_59_Type" -ln "maskWeight_59_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_59" -ln "maskWeight_59" -nn "Channel 59 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_60_Name" -ln "maskWeight_60_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_60_Type" -ln "maskWeight_60_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_60" -ln "maskWeight_60" -nn "Channel 60 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_61_Name" -ln "maskWeight_61_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_61_Type" -ln "maskWeight_61_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_61" -ln "maskWeight_61" -nn "Channel 61 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_62_Name" -ln "maskWeight_62_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_62_Type" -ln "maskWeight_62_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_62" -ln "maskWeight_62" -nn "Channel 62 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_63_Name" -ln "maskWeight_63_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_63_Type" -ln "maskWeight_63_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_63" -ln "maskWeight_63" -nn "Channel 63 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_64_Name" -ln "maskWeight_64_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_64_Type" -ln "maskWeight_64_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_64" -ln "maskWeight_64" -nn "Channel 64 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_65_Name" -ln "maskWeight_65_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_65_Type" -ln "maskWeight_65_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_65" -ln "maskWeight_65" -nn "Channel 65 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_66_Name" -ln "maskWeight_66_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_66_Type" -ln "maskWeight_66_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_66" -ln "maskWeight_66" -nn "Channel 66 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_67_Name" -ln "maskWeight_67_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_67_Type" -ln "maskWeight_67_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_67" -ln "maskWeight_67" -nn "Channel 67 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_68_Name" -ln "maskWeight_68_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_68_Type" -ln "maskWeight_68_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_68" -ln "maskWeight_68" -nn "Channel 68 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_69_Name" -ln "maskWeight_69_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_69_Type" -ln "maskWeight_69_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_69" -ln "maskWeight_69" -nn "Channel 69 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_70_Name" -ln "maskWeight_70_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_70_Type" -ln "maskWeight_70_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_70" -ln "maskWeight_70" -nn "Channel 70 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_71_Name" -ln "maskWeight_71_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_71_Type" -ln "maskWeight_71_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_71" -ln "maskWeight_71" -nn "Channel 71 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_72_Name" -ln "maskWeight_72_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_72_Type" -ln "maskWeight_72_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_72" -ln "maskWeight_72" -nn "Channel 72 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_73_Name" -ln "maskWeight_73_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_73_Type" -ln "maskWeight_73_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_73" -ln "maskWeight_73" -nn "Channel 73 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_74_Name" -ln "maskWeight_74_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_74_Type" -ln "maskWeight_74_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_74" -ln "maskWeight_74" -nn "Channel 74 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_75_Name" -ln "maskWeight_75_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_75_Type" -ln "maskWeight_75_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_75" -ln "maskWeight_75" -nn "Channel 75 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_76_Name" -ln "maskWeight_76_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_76_Type" -ln "maskWeight_76_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_76" -ln "maskWeight_76" -nn "Channel 76 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_77_Name" -ln "maskWeight_77_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_77_Type" -ln "maskWeight_77_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_77" -ln "maskWeight_77" -nn "Channel 77 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_78_Name" -ln "maskWeight_78_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_78_Type" -ln "maskWeight_78_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_78" -ln "maskWeight_78" -nn "Channel 78 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_79_Name" -ln "maskWeight_79_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_79_Type" -ln "maskWeight_79_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_79" -ln "maskWeight_79" -nn "Channel 79 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_80_Name" -ln "maskWeight_80_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_80_Type" -ln "maskWeight_80_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_80" -ln "maskWeight_80" -nn "Channel 80 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "maskWeight_81_Name" -ln "maskWeight_81_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "maskWeight_81_Type" -ln "maskWeight_81_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "maskWeight_81" -ln "maskWeight_81" -nn "Channel 81 Multiplier" 
		-ct "HW_shader_parameter" -min 0 -smx 1 -at "float";
	setAttr ".vpar" -type "stringArray" 7 "Position" "TexCoord0" "TexCoord1" "TexCoord2" "Normal" "Binormal0" "Tangent0"  ;
	setAttr ".upar" -type "stringArray" 249 "light0Enable" "light0Type" "light0Pos" "light0Color" "light0Intensity" "light0Dir" "light0ConeAngle" "light0FallOff" "light0AttenScale" "light0ShadowOn" "light1Enable" "light1Type" "light1Pos" "light1Color" "light1Intensity" "light1Dir" "light1ConeAngle" "light1FallOff" "light1AttenScale" "light1ShadowOn" "light2Enable" "light2Type" "light2Pos" "light2Color" "light2Intensity" "light2Dir" "light2ConeAngle" "light2FallOff" "light2AttenScale" "light2ShadowOn" "SuperFilterTaps" "shadowMapTexelSize" "IsSwatchRender" "screenSize" "MayaFullScreenGamma" "LinearSpaceLighting" "UseShadows" "shadowMultiplier" "shadowDepthBias" "flipBackfaceNormals" "SkyRotation" "UseDiffuseIBLMap" "DiffuseIBLIntensity" "DiffuseCubeIBL" "UseSpecCubeIBL" "SpecularIBLIntensity" "SpecularCubeIBL" "UseDiffuseTexture" "UseDiffuseTextureAlpha" "DiffuseTexture" "DiffuseColor" "LutTexture" "DitherTexture" "skinCoeffX" "skinCoeffY" "skinCoeffZ" "NormalBlurring" "UseScatteringRadiusTexture" "ScatteringRadiusTexture" "skinScattering" "shadowDither" "shadowBlur" "shadowScattering" "shadowSaturation" "UseTranslucency" "BackScatteringThicknessTexture" "UseThicknessTexture" "skinScatteringRoughness" "skinScatteringOuterColor" "skinScatteringAmount" "skinAmbientScatteringAmount" "transpDepthTexture" "opaqueDepthTexture" "UseSpecularTexture" "UseSpecularTextureAlpha" "SpecularTexture" "SpecularColor" "LobeMix" "Roughness" "UseAmbientOcclusionTexture" "OcclusionTexture" "OcclusionAmount" "UseCavityTexture" "CavityTexture" "CavityAmount" "UseNormalTexture" "NormalTexture" "NormalHeight" "SupportNonUniformScale" "NormalCoordsysX" "NormalCoordsysY" "UseMicroCavityTexture" "MicroCavityTexture" "MicroCavityAmount" "UseMicroNormalTexture" "MicroNormalTexture" "MicroNormalHeight" "MicroScale" "OpacityMaskTexture" "Opacity" "UseOpacityMaskTexture" "OpacityMaskBias" "DisplacementModel" "UseDisplacementMap" "DisplacementTexture" "VectorDisplacementCoordSys" "DisplacementHeight" "DisplacementOffset" "DisplacementClippingBias" "BBoxExtraScale" "TessellationRange" "TessellationMin" "FlatTessellation" "UseBlendTexture" "animNormalMap_00" "maskChannel_00" "maskChannel_01" "animNormalMap_01" "maskChannel_02" "animNormalMap_02" "maskChannel_03" "animColorMap_00" "maskChannel_04" "animColorMap_01" "animColorMap_02" "maskChannel_05" "maskWeight_00" "maskChannel_06" "maskWeight_01" "maskChannel_07" "maskWeight_02" "maskChannel_08" "maskChannel_09" "maskWeight_03" "maskChannel_10" "maskWeight_04" "maskWeight_05" "maskChannel_11" "maskWeight_06" "maskChannel_12" "maskChannel_13" "maskWeight_07" "maskWeight_08" "maskChannel_14" "maskChannel_15" "maskWeight_09" "maskChannel_16" "maskWeight_10" "maskChannel_17" "maskWeight_11" "maskWeight_12" "maskChannel_18" "maskWeight_13" "maskChannel_19" "maskWeight_14" "maskChannel_20" "maskWeight_15" "maskChannel_21" "maskWeight_16" "maskChannel_22" "maskWeight_17" "maskChannel_23" "maskWeight_18" "maskChannel_24" "maskChannel_25" "maskWeight_19" "maskWeight_20" "maskChannel_26" "maskWeight_21" "maskChannel_27" "maskWeight_22" "maskChannel_28" "maskWeight_23" "maskChannel_29" "maskChannel_30" "maskWeight_24" "maskWeight_25" "maskChannel_31" "maskWeight_26" "maskChannel_32" "maskWeight_27" "maskChannel_33" "maskWeight_28" "maskChannel_34" "maskWeight_29" "maskChannel_35" "maskWeight_30" "maskChannel_36" "maskWeight_31" "maskWeight_32" "maskWeight_33" "maskWeight_34" "maskWeight_35" "maskWeight_36" "maskWeight_37" "maskWeight_38" "maskWeight_39" "maskWeight_40" "maskWeight_41" "maskWeight_42" "maskWeight_43" "maskWeight_44" "maskWeight_45" "maskWeight_46" "maskWeight_47" "maskWeight_48" "maskWeight_49" "maskWeight_50" "maskWeight_51" "maskWeight_52" "maskWeight_53" "maskWeight_54" "maskWeight_55" "maskWeight_56" "maskWeight_57" "maskWeight_58" "maskWeight_59" "maskWeight_60" "maskWeight_61" "maskWeight_62" "maskWeight_63" "maskWeight_64" "maskWeight_65" "maskWeight_66" "maskWeight_67" "maskWeight_68" "maskWeight_69" "maskWeight_70" "maskWeight_71" "maskWeight_72" "maskWeight_73" "maskWeight_74" "maskWeight_75" "maskWeight_76" "maskWeight_77" "maskWeight_78" "maskWeight_79" "maskWeight_80" "maskWeight_81" "DiffuseTexcoord" "OcclusionTexcoord" "OpacityMaskTexcoord" "SpecularTexcoord" "NormalTexcoord" "DisplacementTexcoord" "ThicknessTexcoord" "light0ShadowMap" "light1ShadowMap" "light2ShadowMap"  ;
	setAttr ".s" -type "string" "$PROJECT_ROOT/Common/SourceAssets/shaders/dx11_shd_head.fx";
	setAttr ".t" -type "string" "TessellationOFF";
	setAttr ".SuperFilterTaps_Name" -type "string" "SuperFilterTaps";
	setAttr ".SuperFilterTaps_Type" -type "string" "float1x2";
	setAttr ".SuperFilterTaps" -type "float2" -0.84052002 -0.073954001 ;
	setAttr ".shadowMapTexelSize_Name" -type "string" "shadowMapTexelSize";
	setAttr ".shadowMapTexelSize_Type" -type "string" "float";
	setAttr ".shadowMapTexelSize" 0.0019531298894435167;
	setAttr ".LinearSpaceLighting_Name" -type "string" "LinearSpaceLighting";
	setAttr ".LinearSpaceLighting_Type" -type "string" "bool";
	setAttr -k on ".LinearSpaceLighting" yes;
	setAttr ".UseShadows_Name" -type "string" "UseShadows";
	setAttr ".UseShadows_Type" -type "string" "bool";
	setAttr -k on ".UseShadows" yes;
	setAttr ".shadowMultiplier_Name" -type "string" "shadowMultiplier";
	setAttr ".shadowMultiplier_Type" -type "string" "float";
	setAttr -k on ".shadowMultiplier" 1;
	setAttr ".IsSwatchRender_Name" -type "string" "IsSwatchRender";
	setAttr ".IsSwatchRender_Type" -type "string" "bool";
	setAttr ".IsSwatchRender" no;
	setAttr ".shadowDepthBias_Name" -type "string" "shadowDepthBias";
	setAttr ".shadowDepthBias_Type" -type "string" "float";
	setAttr -k on ".shadowDepthBias" 0.0099999997764825821;
	setAttr ".MayaFullScreenGamma_Name" -type "string" "MayaFullScreenGamma";
	setAttr ".MayaFullScreenGamma_Type" -type "string" "bool";
	setAttr ".MayaFullScreenGamma" no;
	setAttr ".flipBackfaceNormals_Name" -type "string" "flipBackfaceNormals";
	setAttr ".flipBackfaceNormals_Type" -type "string" "bool";
	setAttr -k on ".flipBackfaceNormals" yes;
	setAttr ".light0Enable_Name" -type "string" "light0Enable";
	setAttr ".light0Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light0Enable" no;
	setAttr ".light0Type_Name" -type "string" "light0Type";
	setAttr ".light0Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light0Type" 2;
	setAttr ".light0Pos_Name" -type "string" "light0Pos";
	setAttr ".light0Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 100 1;
	setAttr ".light0Color_Name" -type "string" "light0Color";
	setAttr ".light0Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light0Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light0Color";
	setAttr ".light0Intensity_Name" -type "string" "light0Intensity";
	setAttr ".light0Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light0Intensity" 1;
	setAttr ".light0Dir_Name" -type "string" "light0Dir";
	setAttr ".light0Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light0ConeAngle_Name" -type "string" "light0ConeAngle";
	setAttr ".light0ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light0ConeAngle" 0.46000000834465027;
	setAttr ".light0FallOff_Name" -type "string" "light0FallOff";
	setAttr ".light0FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light0FallOff" 0.69999998807907104;
	setAttr ".light0AttenScale_Name" -type "string" "light0AttenScale";
	setAttr ".light0AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light0AttenScale" 0;
	setAttr ".light0ShadowOn_Name" -type "string" "light0ShadowOn";
	setAttr ".light0ShadowOn_Type" -type "string" "bool";
	setAttr ".light0ShadowOn" yes;
	setAttr ".light1Enable_Name" -type "string" "light1Enable";
	setAttr ".light1Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light1Enable" no;
	setAttr ".light1Type_Name" -type "string" "light1Type";
	setAttr ".light1Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light1Type" 2;
	setAttr ".light1Pos_Name" -type "string" "light1Pos";
	setAttr ".light1Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -100 100 100 1;
	setAttr ".light1Color_Name" -type "string" "light1Color";
	setAttr ".light1Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light1Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light1Color";
	setAttr ".light1Intensity_Name" -type "string" "light1Intensity";
	setAttr ".light1Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light1Intensity" 1;
	setAttr ".light1Dir_Name" -type "string" "light1Dir";
	setAttr ".light1Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light1ConeAngle_Name" -type "string" "light1ConeAngle";
	setAttr ".light1ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light1ConeAngle" 45;
	setAttr ".light1FallOff_Name" -type "string" "light1FallOff";
	setAttr ".light1FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light1FallOff" 0;
	setAttr ".light1AttenScale_Name" -type "string" "light1AttenScale";
	setAttr ".light1AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light1AttenScale" 0;
	setAttr ".light1ShadowOn_Name" -type "string" "light1ShadowOn";
	setAttr ".light1ShadowOn_Type" -type "string" "bool";
	setAttr ".light1ShadowOn" yes;
	setAttr ".light2Enable_Name" -type "string" "light2Enable";
	setAttr ".light2Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light2Enable" no;
	setAttr ".light2Type_Name" -type "string" "light2Type";
	setAttr ".light2Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light2Type" 2;
	setAttr ".light2Pos_Name" -type "string" "light2Pos";
	setAttr ".light2Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 -100 1;
	setAttr ".light2Color_Name" -type "string" "light2Color";
	setAttr ".light2Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light2Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light2Color";
	setAttr ".light2Intensity_Name" -type "string" "light2Intensity";
	setAttr ".light2Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light2Intensity" 1;
	setAttr ".light2Dir_Name" -type "string" "light2Dir";
	setAttr ".light2Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light2ConeAngle_Name" -type "string" "light2ConeAngle";
	setAttr ".light2ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light2ConeAngle" 45;
	setAttr ".light2FallOff_Name" -type "string" "light2FallOff";
	setAttr ".light2FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light2FallOff" 0;
	setAttr ".light2AttenScale_Name" -type "string" "light2AttenScale";
	setAttr ".light2AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light2AttenScale" 0;
	setAttr ".light2ShadowOn_Name" -type "string" "light2ShadowOn";
	setAttr ".light2ShadowOn_Type" -type "string" "bool";
	setAttr ".light2ShadowOn" yes;
	setAttr ".UseAmbientOcclusionTexture_Name" -type "string" "UseAmbientOcclusionTexture";
	setAttr ".UseAmbientOcclusionTexture_Type" -type "string" "bool";
	setAttr -k on ".UseAmbientOcclusionTexture" yes;
	setAttr ".transpDepthTexture_Name" -type "string" "transpDepthTexture";
	setAttr ".transpDepthTexture_Type" -type "string" "texture";
	setAttr ".transpDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".opaqueDepthTexture_Name" -type "string" "opaqueDepthTexture";
	setAttr ".opaqueDepthTexture_Type" -type "string" "texture";
	setAttr ".opaqueDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".UseDiffuseTexture_Name" -type "string" "UseDiffuseTexture";
	setAttr ".UseDiffuseTexture_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTexture" yes;
	setAttr ".UseDiffuseTextureAlpha_Name" -type "string" "UseDiffuseTextureAlpha";
	setAttr ".UseDiffuseTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTextureAlpha" no;
	setAttr ".DiffuseTexture_Name" -type "string" "DiffuseTexture";
	setAttr ".DiffuseTexture_Type" -type "string" "texture";
	setAttr ".DiffuseTexture" -type "float3" 0 0 0 ;
	setAttr ".DiffuseColor_Name" -type "string" "DiffuseColor";
	setAttr ".DiffuseColor_Type" -type "string" "color1x3";
	setAttr -k on ".DiffuseColor" -type "float3" 1 1 1 ;
	setAttr ".Opacity_Name" -type "string" "Opacity";
	setAttr ".Opacity_Type" -type "string" "float";
	setAttr -k on ".Opacity" 1;
	setAttr ".UseOpacityMaskTexture_Name" -type "string" "UseOpacityMaskTexture";
	setAttr ".UseOpacityMaskTexture_Type" -type "string" "bool";
	setAttr -k on ".UseOpacityMaskTexture" no;
	setAttr ".OpacityMaskTexture_Name" -type "string" "OpacityMaskTexture";
	setAttr ".OpacityMaskTexture_Type" -type "string" "texture";
	setAttr ".OpacityMaskTexture" -type "float3" 0 0 0 ;
	setAttr ".OpacityMaskBias_Name" -type "string" "OpacityMaskBias";
	setAttr ".OpacityMaskBias_Type" -type "string" "float";
	setAttr -k on ".OpacityMaskBias" 0.10000000149011612;
	setAttr ".UseSpecularTexture_Name" -type "string" "UseSpecularTexture";
	setAttr ".UseSpecularTexture_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTexture" yes;
	setAttr ".SpecularTexture_Name" -type "string" "SpecularTexture";
	setAttr ".SpecularTexture_Type" -type "string" "texture";
	setAttr ".SpecularTexture" -type "float3" 0 0 0 ;
	setAttr ".SpecularColor_Name" -type "string" "SpecularColor";
	setAttr ".SpecularColor_Type" -type "string" "color1x3";
	setAttr -k on ".SpecularColor" -type "float3" 0.56862748 0.56862748 0.56862748 ;
	setAttr ".UseNormalTexture_Name" -type "string" "UseNormalTexture";
	setAttr ".UseNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseNormalTexture" yes;
	setAttr ".NormalTexture_Name" -type "string" "NormalTexture";
	setAttr ".NormalTexture_Type" -type "string" "texture";
	setAttr ".NormalTexture" -type "float3" 0 0 0 ;
	setAttr ".NormalHeight_Name" -type "string" "NormalHeight";
	setAttr ".NormalHeight_Type" -type "string" "float";
	setAttr -k on ".NormalHeight" 1;
	setAttr ".SupportNonUniformScale_Name" -type "string" "SupportNonUniformScale";
	setAttr ".SupportNonUniformScale_Type" -type "string" "bool";
	setAttr -k on ".SupportNonUniformScale" yes;
	setAttr ".NormalCoordsysX_Name" -type "string" "NormalCoordsysX";
	setAttr ".NormalCoordsysX_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysX" 0;
	setAttr ".NormalCoordsysY_Name" -type "string" "NormalCoordsysY";
	setAttr ".NormalCoordsysY_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysY" 1;
	setAttr ".DisplacementModel_Name" -type "string" "DisplacementModel";
	setAttr ".DisplacementModel_Type" -type "string" "enum";
	setAttr -k on ".DisplacementModel" 0;
	setAttr ".UseDisplacementMap_Name" -type "string" "UseDisplacementMap";
	setAttr ".UseDisplacementMap_Type" -type "string" "bool";
	setAttr -k on ".UseDisplacementMap" no;
	setAttr ".DisplacementTexture_Name" -type "string" "DisplacementTexture";
	setAttr ".DisplacementTexture_Type" -type "string" "texture";
	setAttr ".DisplacementTexture" -type "float3" 0 0 0 ;
	setAttr ".VectorDisplacementCoordSys_Name" -type "string" "VectorDisplacementCoordSys";
	setAttr ".VectorDisplacementCoordSys_Type" -type "string" "enum";
	setAttr -k on ".VectorDisplacementCoordSys" 0;
	setAttr ".DisplacementHeight_Name" -type "string" "DisplacementHeight";
	setAttr ".DisplacementHeight_Type" -type "string" "float";
	setAttr -k on ".DisplacementHeight" 0.5;
	setAttr ".DisplacementOffset_Name" -type "string" "DisplacementOffset";
	setAttr ".DisplacementOffset_Type" -type "string" "float";
	setAttr -k on ".DisplacementOffset" 0.5;
	setAttr ".DisplacementClippingBias_Name" -type "string" "DisplacementClippingBias";
	setAttr ".DisplacementClippingBias_Type" -type "string" "float";
	setAttr -k on ".DisplacementClippingBias" 5;
	setAttr ".BBoxExtraScale_Name" -type "string" "BBoxExtraScale";
	setAttr ".BBoxExtraScale_Type" -type "string" "float";
	setAttr -k on ".BBoxExtraScale" 1;
	setAttr ".TessellationRange_Name" -type "string" "TessellationRange";
	setAttr ".TessellationRange_Type" -type "string" "float";
	setAttr -k on ".TessellationRange" 0;
	setAttr ".TessellationMin_Name" -type "string" "TessellationMin";
	setAttr ".TessellationMin_Type" -type "string" "float";
	setAttr -k on ".TessellationMin" 3;
	setAttr ".FlatTessellation_Name" -type "string" "FlatTessellation";
	setAttr ".FlatTessellation_Type" -type "string" "float";
	setAttr -k on ".FlatTessellation" 0;
	setAttr ".UseTranslucency_Name" -type "string" "UseTranslucency";
	setAttr ".UseTranslucency_Type" -type "string" "bool";
	setAttr -k on ".UseTranslucency" yes;
	setAttr ".UseThicknessTexture_Name" -type "string" "UseThicknessTexture";
	setAttr ".UseThicknessTexture_Type" -type "string" "bool";
	setAttr -k on ".UseThicknessTexture" yes;
	setAttr ".UseDiffuseIBLMap_Name" -type "string" "UseDiffuseIBLMap";
	setAttr ".UseDiffuseIBLMap_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseIBLMap" yes;
	setAttr ".DiffuseIBLIntensity_Name" -type "string" "DiffuseIBLIntensity";
	setAttr ".DiffuseIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".DiffuseIBLIntensity" 0.64999997615814209;
	setAttr ".DiffuseTexcoord_Name" -type "string" "DiffuseTexcoord";
	setAttr ".DiffuseTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DiffuseTexcoord" 0;
	setAttr ".OpacityMaskTexcoord_Name" -type "string" "OpacityMaskTexcoord";
	setAttr ".OpacityMaskTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OpacityMaskTexcoord" 0;
	setAttr ".SpecularTexcoord_Name" -type "string" "SpecularTexcoord";
	setAttr ".SpecularTexcoord_Type" -type "string" "enum";
	setAttr -k on ".SpecularTexcoord" 0;
	setAttr ".NormalTexcoord_Name" -type "string" "NormalTexcoord";
	setAttr ".NormalTexcoord_Type" -type "string" "enum";
	setAttr -k on ".NormalTexcoord" 0;
	setAttr ".DisplacementTexcoord_Name" -type "string" "DisplacementTexcoord";
	setAttr ".DisplacementTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DisplacementTexcoord" 0;
	setAttr ".ThicknessTexcoord_Name" -type "string" "ThicknessTexcoord";
	setAttr ".ThicknessTexcoord_Type" -type "string" "enum";
	setAttr -k on ".ThicknessTexcoord" 0;
	setAttr ".light0ShadowMap_Name" -type "string" "light0ShadowMap";
	setAttr ".light0ShadowMap_Type" -type "string" "texture";
	setAttr ".light0ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light1ShadowMap_Name" -type "string" "light1ShadowMap";
	setAttr ".light1ShadowMap_Type" -type "string" "texture";
	setAttr ".light1ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light2ShadowMap_Name" -type "string" "light2ShadowMap";
	setAttr ".light2ShadowMap_Type" -type "string" "texture";
	setAttr ".light2ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".screenSize_Name" -type "string" "screenSize";
	setAttr ".screenSize_Type" -type "string" "float1x2";
	setAttr ".screenSize" -type "float2" 0 0 ;
	setAttr ".SkyRotation_Name" -type "string" "SkyRotation";
	setAttr ".SkyRotation_Type" -type "string" "float";
	setAttr -k on ".SkyRotation" 12.5;
	setAttr ".DiffuseCubeIBL_Name" -type "string" "DiffuseCubeIBL";
	setAttr ".DiffuseCubeIBL_Type" -type "string" "texture";
	setAttr ".DiffuseCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".UseSpecCubeIBL_Name" -type "string" "UseSpecCubeIBL";
	setAttr ".UseSpecCubeIBL_Type" -type "string" "bool";
	setAttr -k on ".UseSpecCubeIBL" yes;
	setAttr ".SpecularIBLIntensity_Name" -type "string" "SpecularIBLIntensity";
	setAttr ".SpecularIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".SpecularIBLIntensity" 1.1847133636474609;
	setAttr ".SpecularCubeIBL_Name" -type "string" "SpecularCubeIBL";
	setAttr ".SpecularCubeIBL_Type" -type "string" "texture";
	setAttr ".SpecularCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".LutTexture_Name" -type "string" "LutTexture";
	setAttr ".LutTexture_Type" -type "string" "texture";
	setAttr ".LutTexture" -type "float3" 0 0 0 ;
	setAttr ".DitherTexture_Name" -type "string" "DitherTexture";
	setAttr ".DitherTexture_Type" -type "string" "texture";
	setAttr ".DitherTexture" -type "float3" 0 0 0 ;
	setAttr ".skinCoeffX_Name" -type "string" "skinCoeffX";
	setAttr ".skinCoeffX_Type" -type "string" "float";
	setAttr -k on ".skinCoeffX" 0.79500001668930054;
	setAttr ".skinCoeffY_Name" -type "string" "skinCoeffY";
	setAttr ".skinCoeffY_Type" -type "string" "float";
	setAttr -k on ".skinCoeffY" 0.28799998760223389;
	setAttr ".skinCoeffZ_Name" -type "string" "skinCoeffZ";
	setAttr ".skinCoeffZ_Type" -type "string" "float";
	setAttr -k on ".skinCoeffZ" 0.030999999493360519;
	setAttr ".NormalBlurring_Name" -type "string" "NormalBlurring";
	setAttr ".NormalBlurring_Type" -type "string" "float";
	setAttr -k on ".NormalBlurring" 1;
	setAttr ".UseScatteringRadiusTexture_Name" -type "string" "UseScatteringRadiusTexture";
	setAttr ".UseScatteringRadiusTexture_Type" -type "string" "bool";
	setAttr -k on ".UseScatteringRadiusTexture" no;
	setAttr ".ScatteringRadiusTexture_Name" -type "string" "ScatteringRadiusTexture";
	setAttr ".ScatteringRadiusTexture_Type" -type "string" "texture";
	setAttr ".ScatteringRadiusTexture" -type "float3" 0 0 0 ;
	setAttr ".skinScattering_Name" -type "string" "skinScattering";
	setAttr ".skinScattering_Type" -type "string" "float";
	setAttr -k on ".skinScattering" 0.38999998569488525;
	setAttr ".shadowDither_Name" -type "string" "shadowDither";
	setAttr ".shadowDither_Type" -type "string" "float";
	setAttr -k on ".shadowDither" 0.086999997496604919;
	setAttr ".shadowBlur_Name" -type "string" "shadowBlur";
	setAttr ".shadowBlur_Type" -type "string" "float";
	setAttr -k on ".shadowBlur" 1;
	setAttr ".shadowScattering_Name" -type "string" "shadowScattering";
	setAttr ".shadowScattering_Type" -type "string" "float";
	setAttr -k on ".shadowScattering" 1;
	setAttr ".shadowSaturation_Name" -type "string" "shadowSaturation";
	setAttr ".shadowSaturation_Type" -type "string" "float";
	setAttr -k on ".shadowSaturation" 1.2740000486373901;
	setAttr ".BackScatteringThicknessTexture_Name" -type "string" "BackScatteringThicknessTexture";
	setAttr ".BackScatteringThicknessTexture_Type" -type "string" "texture";
	setAttr ".BackScatteringThicknessTexture" -type "float3" 0 0 0 ;
	setAttr ".skinScatteringRoughness_Name" -type "string" "skinScatteringRoughness";
	setAttr ".skinScatteringRoughness_Type" -type "string" "float";
	setAttr -k on ".skinScatteringRoughness" 1;
	setAttr ".skinScatteringOuterColor_Name" -type "string" "skinScatteringOuterColor";
	setAttr ".skinScatteringOuterColor_Type" -type "string" "color1x3";
	setAttr -k on ".skinScatteringOuterColor" -type "float3" 0.39607844 0.039215688 
		0 ;
	setAttr ".skinScatteringAmount_Name" -type "string" "skinScatteringAmount";
	setAttr ".skinScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinScatteringAmount" 0.30000001192092896;
	setAttr ".skinAmbientScatteringAmount_Name" -type "string" "skinAmbientScatteringAmount";
	setAttr ".skinAmbientScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinAmbientScatteringAmount" 0.76433122158050537;
	setAttr ".UseSpecularTextureAlpha_Name" -type "string" "UseSpecularTextureAlpha";
	setAttr ".UseSpecularTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTextureAlpha" no;
	setAttr ".LobeMix_Name" -type "string" "LobeMix";
	setAttr ".LobeMix_Type" -type "string" "float";
	setAttr -k on ".LobeMix" 0.57099997997283936;
	setAttr ".Roughness_Name" -type "string" "Roughness";
	setAttr ".Roughness_Type" -type "string" "float";
	setAttr -k on ".Roughness" 0.49000000953674316;
	setAttr ".OcclusionTexture_Name" -type "string" "OcclusionTexture";
	setAttr ".OcclusionTexture_Type" -type "string" "texture";
	setAttr ".OcclusionTexture" -type "float3" 0 0 0 ;
	setAttr ".OcclusionAmount_Name" -type "string" "OcclusionAmount";
	setAttr ".OcclusionAmount_Type" -type "string" "float";
	setAttr -k on ".OcclusionAmount" 0.5;
	setAttr ".UseCavityTexture_Name" -type "string" "UseCavityTexture";
	setAttr ".UseCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseCavityTexture" yes;
	setAttr ".CavityTexture_Name" -type "string" "CavityTexture";
	setAttr ".CavityTexture_Type" -type "string" "texture";
	setAttr ".CavityTexture" -type "float3" 0 0 0 ;
	setAttr ".CavityAmount_Name" -type "string" "CavityAmount";
	setAttr ".CavityAmount_Type" -type "string" "float";
	setAttr -k on ".CavityAmount" 1;
	setAttr ".UseMicroCavityTexture_Name" -type "string" "UseMicroCavityTexture";
	setAttr ".UseMicroCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroCavityTexture" no;
	setAttr ".MicroCavityTexture_Name" -type "string" "MicroCavityTexture";
	setAttr ".MicroCavityTexture_Type" -type "string" "texture";
	setAttr ".MicroCavityTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroCavityAmount_Name" -type "string" "MicroCavityAmount";
	setAttr ".MicroCavityAmount_Type" -type "string" "float";
	setAttr -k on ".MicroCavityAmount" 1;
	setAttr ".UseMicroNormalTexture_Name" -type "string" "UseMicroNormalTexture";
	setAttr ".UseMicroNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroNormalTexture" no;
	setAttr ".MicroNormalTexture_Name" -type "string" "MicroNormalTexture";
	setAttr ".MicroNormalTexture_Type" -type "string" "texture";
	setAttr ".MicroNormalTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroNormalHeight_Name" -type "string" "MicroNormalHeight";
	setAttr ".MicroNormalHeight_Type" -type "string" "float";
	setAttr -k on ".MicroNormalHeight" 1;
	setAttr ".MicroScale_Name" -type "string" "MicroScale";
	setAttr ".MicroScale_Type" -type "string" "float";
	setAttr -k on ".MicroScale" 32;
	setAttr ".UseBlendTexture_Name" -type "string" "UseBlendTexture";
	setAttr ".UseBlendTexture_Type" -type "string" "bool";
	setAttr -k on ".UseBlendTexture" yes;
	setAttr ".OcclusionTexcoord_Name" -type "string" "OcclusionTexcoord";
	setAttr ".OcclusionTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OcclusionTexcoord" 1;
	setAttr ".Position_Name" -type "string" "Position";
	setAttr ".Position_Source" -type "string" "position";
	setAttr ".TexCoord0_Name" -type "string" "TexCoord0";
	setAttr ".TexCoord0_Source" -type "string" "uv:map1";
	setAttr ".TexCoord0_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord1_Name" -type "string" "TexCoord1";
	setAttr ".TexCoord1_Source" -type "string" "uv:map2";
	setAttr ".TexCoord1_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord2_Name" -type "string" "TexCoord2";
	setAttr ".TexCoord2_Source" -type "string" "uv:map3";
	setAttr ".TexCoord2_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".Normal_Name" -type "string" "Normal";
	setAttr ".Normal_Source" -type "string" "normal";
	setAttr ".Binormal0_Name" -type "string" "Binormal0";
	setAttr ".Binormal0_Source" -type "string" "binormal:map1";
	setAttr ".Tangent0_Name" -type "string" "Tangent0";
	setAttr ".Tangent0_Source" -type "string" "tangent:map1";
	setAttr ".animNormalMap_00_Name" -type "string" "animNormalMap_00";
	setAttr ".animNormalMap_00_Type" -type "string" "texture";
	setAttr ".animNormalMap_00" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_00_Name" -type "string" "maskChannel_00";
	setAttr ".maskChannel_00_Type" -type "string" "texture";
	setAttr ".maskChannel_00" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_01_Name" -type "string" "maskChannel_01";
	setAttr ".maskChannel_01_Type" -type "string" "texture";
	setAttr ".maskChannel_01" -type "float3" 0 0 0 ;
	setAttr ".animNormalMap_01_Name" -type "string" "animNormalMap_01";
	setAttr ".animNormalMap_01_Type" -type "string" "texture";
	setAttr ".animNormalMap_01" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_02_Name" -type "string" "maskChannel_02";
	setAttr ".maskChannel_02_Type" -type "string" "texture";
	setAttr ".maskChannel_02" -type "float3" 0 0 0 ;
	setAttr ".animNormalMap_02_Name" -type "string" "animNormalMap_02";
	setAttr ".animNormalMap_02_Type" -type "string" "texture";
	setAttr ".animNormalMap_02" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_03_Name" -type "string" "maskChannel_03";
	setAttr ".maskChannel_03_Type" -type "string" "texture";
	setAttr ".maskChannel_03" -type "float3" 0 0 0 ;
	setAttr ".animColorMap_00_Name" -type "string" "animColorMap_00";
	setAttr ".animColorMap_00_Type" -type "string" "texture";
	setAttr ".animColorMap_00" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_04_Name" -type "string" "maskChannel_04";
	setAttr ".maskChannel_04_Type" -type "string" "texture";
	setAttr ".maskChannel_04" -type "float3" 0 0 0 ;
	setAttr ".animColorMap_01_Name" -type "string" "animColorMap_01";
	setAttr ".animColorMap_01_Type" -type "string" "texture";
	setAttr ".animColorMap_01" -type "float3" 0 0 0 ;
	setAttr ".animColorMap_02_Name" -type "string" "animColorMap_02";
	setAttr ".animColorMap_02_Type" -type "string" "texture";
	setAttr ".animColorMap_02" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_05_Name" -type "string" "maskChannel_05";
	setAttr ".maskChannel_05_Type" -type "string" "texture";
	setAttr ".maskChannel_05" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_00_Name" -type "string" "maskWeight_00";
	setAttr ".maskWeight_00_Type" -type "string" "float";
	setAttr -k on ".maskWeight_00" 0;
	setAttr ".maskChannel_06_Name" -type "string" "maskChannel_06";
	setAttr ".maskChannel_06_Type" -type "string" "texture";
	setAttr ".maskChannel_06" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_01_Name" -type "string" "maskWeight_01";
	setAttr ".maskWeight_01_Type" -type "string" "float";
	setAttr -k on ".maskWeight_01" 0;
	setAttr ".maskChannel_07_Name" -type "string" "maskChannel_07";
	setAttr ".maskChannel_07_Type" -type "string" "texture";
	setAttr ".maskChannel_07" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_02_Name" -type "string" "maskWeight_02";
	setAttr ".maskWeight_02_Type" -type "string" "float";
	setAttr -k on ".maskWeight_02" 0;
	setAttr ".maskChannel_08_Name" -type "string" "maskChannel_08";
	setAttr ".maskChannel_08_Type" -type "string" "texture";
	setAttr ".maskChannel_08" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_09_Name" -type "string" "maskChannel_09";
	setAttr ".maskChannel_09_Type" -type "string" "texture";
	setAttr ".maskChannel_09" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_03_Name" -type "string" "maskWeight_03";
	setAttr ".maskWeight_03_Type" -type "string" "float";
	setAttr -k on ".maskWeight_03" 0;
	setAttr ".maskChannel_10_Name" -type "string" "maskChannel_10";
	setAttr ".maskChannel_10_Type" -type "string" "texture";
	setAttr ".maskChannel_10" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_04_Name" -type "string" "maskWeight_04";
	setAttr ".maskWeight_04_Type" -type "string" "float";
	setAttr -k on ".maskWeight_04" 0;
	setAttr ".maskWeight_05_Name" -type "string" "maskWeight_05";
	setAttr ".maskWeight_05_Type" -type "string" "float";
	setAttr -k on ".maskWeight_05" 0;
	setAttr ".maskChannel_11_Name" -type "string" "maskChannel_11";
	setAttr ".maskChannel_11_Type" -type "string" "texture";
	setAttr ".maskChannel_11" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_06_Name" -type "string" "maskWeight_06";
	setAttr ".maskWeight_06_Type" -type "string" "float";
	setAttr -k on ".maskWeight_06" 0;
	setAttr ".maskChannel_12_Name" -type "string" "maskChannel_12";
	setAttr ".maskChannel_12_Type" -type "string" "texture";
	setAttr ".maskChannel_12" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_13_Name" -type "string" "maskChannel_13";
	setAttr ".maskChannel_13_Type" -type "string" "texture";
	setAttr ".maskChannel_13" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_07_Name" -type "string" "maskWeight_07";
	setAttr ".maskWeight_07_Type" -type "string" "float";
	setAttr -k on ".maskWeight_07" 0;
	setAttr ".maskWeight_08_Name" -type "string" "maskWeight_08";
	setAttr ".maskWeight_08_Type" -type "string" "float";
	setAttr -k on ".maskWeight_08" 0;
	setAttr ".maskChannel_14_Name" -type "string" "maskChannel_14";
	setAttr ".maskChannel_14_Type" -type "string" "texture";
	setAttr ".maskChannel_14" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_15_Name" -type "string" "maskChannel_15";
	setAttr ".maskChannel_15_Type" -type "string" "texture";
	setAttr ".maskChannel_15" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_09_Name" -type "string" "maskWeight_09";
	setAttr ".maskWeight_09_Type" -type "string" "float";
	setAttr -k on ".maskWeight_09" 0;
	setAttr ".maskChannel_16_Name" -type "string" "maskChannel_16";
	setAttr ".maskChannel_16_Type" -type "string" "texture";
	setAttr ".maskChannel_16" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_10_Name" -type "string" "maskWeight_10";
	setAttr ".maskWeight_10_Type" -type "string" "float";
	setAttr -k on ".maskWeight_10" 0;
	setAttr ".maskChannel_17_Name" -type "string" "maskChannel_17";
	setAttr ".maskChannel_17_Type" -type "string" "texture";
	setAttr ".maskChannel_17" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_11_Name" -type "string" "maskWeight_11";
	setAttr ".maskWeight_11_Type" -type "string" "float";
	setAttr -k on ".maskWeight_11" 0;
	setAttr ".maskWeight_12_Name" -type "string" "maskWeight_12";
	setAttr ".maskWeight_12_Type" -type "string" "float";
	setAttr -k on ".maskWeight_12" 0;
	setAttr ".maskChannel_18_Name" -type "string" "maskChannel_18";
	setAttr ".maskChannel_18_Type" -type "string" "texture";
	setAttr ".maskChannel_18" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_13_Name" -type "string" "maskWeight_13";
	setAttr ".maskWeight_13_Type" -type "string" "float";
	setAttr -k on ".maskWeight_13" 0;
	setAttr ".maskChannel_19_Name" -type "string" "maskChannel_19";
	setAttr ".maskChannel_19_Type" -type "string" "texture";
	setAttr ".maskChannel_19" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_14_Name" -type "string" "maskWeight_14";
	setAttr ".maskWeight_14_Type" -type "string" "float";
	setAttr -k on ".maskWeight_14" 0;
	setAttr ".maskChannel_20_Name" -type "string" "maskChannel_20";
	setAttr ".maskChannel_20_Type" -type "string" "texture";
	setAttr ".maskChannel_20" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_15_Name" -type "string" "maskWeight_15";
	setAttr ".maskWeight_15_Type" -type "string" "float";
	setAttr -k on ".maskWeight_15" 0;
	setAttr ".maskChannel_21_Name" -type "string" "maskChannel_21";
	setAttr ".maskChannel_21_Type" -type "string" "texture";
	setAttr ".maskChannel_21" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_16_Name" -type "string" "maskWeight_16";
	setAttr ".maskWeight_16_Type" -type "string" "float";
	setAttr -k on ".maskWeight_16" 0;
	setAttr ".maskChannel_22_Name" -type "string" "maskChannel_22";
	setAttr ".maskChannel_22_Type" -type "string" "texture";
	setAttr ".maskChannel_22" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_17_Name" -type "string" "maskWeight_17";
	setAttr ".maskWeight_17_Type" -type "string" "float";
	setAttr -k on ".maskWeight_17" 0;
	setAttr ".maskChannel_23_Name" -type "string" "maskChannel_23";
	setAttr ".maskChannel_23_Type" -type "string" "texture";
	setAttr ".maskChannel_23" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_18_Name" -type "string" "maskWeight_18";
	setAttr ".maskWeight_18_Type" -type "string" "float";
	setAttr -k on ".maskWeight_18" 0;
	setAttr ".maskChannel_24_Name" -type "string" "maskChannel_24";
	setAttr ".maskChannel_24_Type" -type "string" "texture";
	setAttr ".maskChannel_24" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_25_Name" -type "string" "maskChannel_25";
	setAttr ".maskChannel_25_Type" -type "string" "texture";
	setAttr ".maskChannel_25" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_19_Name" -type "string" "maskWeight_19";
	setAttr ".maskWeight_19_Type" -type "string" "float";
	setAttr -k on ".maskWeight_19" 0;
	setAttr ".maskWeight_20_Name" -type "string" "maskWeight_20";
	setAttr ".maskWeight_20_Type" -type "string" "float";
	setAttr -k on ".maskWeight_20" 0;
	setAttr ".maskChannel_26_Name" -type "string" "maskChannel_26";
	setAttr ".maskChannel_26_Type" -type "string" "texture";
	setAttr ".maskChannel_26" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_21_Name" -type "string" "maskWeight_21";
	setAttr ".maskWeight_21_Type" -type "string" "float";
	setAttr -k on ".maskWeight_21" 0;
	setAttr ".maskChannel_27_Name" -type "string" "maskChannel_27";
	setAttr ".maskChannel_27_Type" -type "string" "texture";
	setAttr ".maskChannel_27" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_22_Name" -type "string" "maskWeight_22";
	setAttr ".maskWeight_22_Type" -type "string" "float";
	setAttr -k on ".maskWeight_22" 0;
	setAttr ".maskChannel_28_Name" -type "string" "maskChannel_28";
	setAttr ".maskChannel_28_Type" -type "string" "texture";
	setAttr ".maskChannel_28" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_23_Name" -type "string" "maskWeight_23";
	setAttr ".maskWeight_23_Type" -type "string" "float";
	setAttr -k on ".maskWeight_23" 0;
	setAttr ".maskChannel_29_Name" -type "string" "maskChannel_29";
	setAttr ".maskChannel_29_Type" -type "string" "texture";
	setAttr ".maskChannel_29" -type "float3" 0 0 0 ;
	setAttr ".maskChannel_30_Name" -type "string" "maskChannel_30";
	setAttr ".maskChannel_30_Type" -type "string" "texture";
	setAttr ".maskChannel_30" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_24_Name" -type "string" "maskWeight_24";
	setAttr ".maskWeight_24_Type" -type "string" "float";
	setAttr -k on ".maskWeight_24" 0;
	setAttr ".maskWeight_25_Name" -type "string" "maskWeight_25";
	setAttr ".maskWeight_25_Type" -type "string" "float";
	setAttr -k on ".maskWeight_25" 0;
	setAttr ".maskChannel_31_Name" -type "string" "maskChannel_31";
	setAttr ".maskChannel_31_Type" -type "string" "texture";
	setAttr ".maskChannel_31" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_26_Name" -type "string" "maskWeight_26";
	setAttr ".maskWeight_26_Type" -type "string" "float";
	setAttr -k on ".maskWeight_26" 0;
	setAttr ".maskChannel_32_Name" -type "string" "maskChannel_32";
	setAttr ".maskChannel_32_Type" -type "string" "texture";
	setAttr ".maskChannel_32" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_27_Name" -type "string" "maskWeight_27";
	setAttr ".maskWeight_27_Type" -type "string" "float";
	setAttr -k on ".maskWeight_27" 0;
	setAttr ".maskChannel_33_Name" -type "string" "maskChannel_33";
	setAttr ".maskChannel_33_Type" -type "string" "texture";
	setAttr ".maskChannel_33" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_28_Name" -type "string" "maskWeight_28";
	setAttr ".maskWeight_28_Type" -type "string" "float";
	setAttr -k on ".maskWeight_28" 0;
	setAttr ".maskChannel_34_Name" -type "string" "maskChannel_34";
	setAttr ".maskChannel_34_Type" -type "string" "texture";
	setAttr ".maskChannel_34" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_29_Name" -type "string" "maskWeight_29";
	setAttr ".maskWeight_29_Type" -type "string" "float";
	setAttr -k on ".maskWeight_29" 0;
	setAttr ".maskChannel_35_Name" -type "string" "maskChannel_35";
	setAttr ".maskChannel_35_Type" -type "string" "texture";
	setAttr ".maskChannel_35" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_30_Name" -type "string" "maskWeight_30";
	setAttr ".maskWeight_30_Type" -type "string" "float";
	setAttr -k on ".maskWeight_30" 0;
	setAttr ".maskChannel_36_Name" -type "string" "maskChannel_36";
	setAttr ".maskChannel_36_Type" -type "string" "texture";
	setAttr ".maskChannel_36" -type "float3" 0 0 0 ;
	setAttr ".maskWeight_31_Name" -type "string" "maskWeight_31";
	setAttr ".maskWeight_31_Type" -type "string" "float";
	setAttr -k on ".maskWeight_31" 0;
	setAttr ".maskWeight_32_Name" -type "string" "maskWeight_32";
	setAttr ".maskWeight_32_Type" -type "string" "float";
	setAttr -k on ".maskWeight_32" 0;
	setAttr ".maskWeight_33_Name" -type "string" "maskWeight_33";
	setAttr ".maskWeight_33_Type" -type "string" "float";
	setAttr -k on ".maskWeight_33" 0;
	setAttr ".maskWeight_34_Name" -type "string" "maskWeight_34";
	setAttr ".maskWeight_34_Type" -type "string" "float";
	setAttr -k on ".maskWeight_34" 0;
	setAttr ".maskWeight_35_Name" -type "string" "maskWeight_35";
	setAttr ".maskWeight_35_Type" -type "string" "float";
	setAttr -k on ".maskWeight_35" 0;
	setAttr ".maskWeight_36_Name" -type "string" "maskWeight_36";
	setAttr ".maskWeight_36_Type" -type "string" "float";
	setAttr -k on ".maskWeight_36" 0;
	setAttr ".maskWeight_37_Name" -type "string" "maskWeight_37";
	setAttr ".maskWeight_37_Type" -type "string" "float";
	setAttr -k on ".maskWeight_37" 0;
	setAttr ".maskWeight_38_Name" -type "string" "maskWeight_38";
	setAttr ".maskWeight_38_Type" -type "string" "float";
	setAttr -k on ".maskWeight_38" 0;
	setAttr ".maskWeight_39_Name" -type "string" "maskWeight_39";
	setAttr ".maskWeight_39_Type" -type "string" "float";
	setAttr -k on ".maskWeight_39" 0;
	setAttr ".maskWeight_40_Name" -type "string" "maskWeight_40";
	setAttr ".maskWeight_40_Type" -type "string" "float";
	setAttr -k on ".maskWeight_40" 0;
	setAttr ".maskWeight_41_Name" -type "string" "maskWeight_41";
	setAttr ".maskWeight_41_Type" -type "string" "float";
	setAttr -k on ".maskWeight_41" 0;
	setAttr ".maskWeight_42_Name" -type "string" "maskWeight_42";
	setAttr ".maskWeight_42_Type" -type "string" "float";
	setAttr -k on ".maskWeight_42" 0;
	setAttr ".maskWeight_43_Name" -type "string" "maskWeight_43";
	setAttr ".maskWeight_43_Type" -type "string" "float";
	setAttr -k on ".maskWeight_43" 0;
	setAttr ".maskWeight_44_Name" -type "string" "maskWeight_44";
	setAttr ".maskWeight_44_Type" -type "string" "float";
	setAttr -k on ".maskWeight_44" 0;
	setAttr ".maskWeight_45_Name" -type "string" "maskWeight_45";
	setAttr ".maskWeight_45_Type" -type "string" "float";
	setAttr -k on ".maskWeight_45" 0;
	setAttr ".maskWeight_46_Name" -type "string" "maskWeight_46";
	setAttr ".maskWeight_46_Type" -type "string" "float";
	setAttr -k on ".maskWeight_46" 0;
	setAttr ".maskWeight_47_Name" -type "string" "maskWeight_47";
	setAttr ".maskWeight_47_Type" -type "string" "float";
	setAttr -k on ".maskWeight_47" 0;
	setAttr ".maskWeight_48_Name" -type "string" "maskWeight_48";
	setAttr ".maskWeight_48_Type" -type "string" "float";
	setAttr -k on ".maskWeight_48" 0;
	setAttr ".maskWeight_49_Name" -type "string" "maskWeight_49";
	setAttr ".maskWeight_49_Type" -type "string" "float";
	setAttr -k on ".maskWeight_49" 0;
	setAttr ".maskWeight_50_Name" -type "string" "maskWeight_50";
	setAttr ".maskWeight_50_Type" -type "string" "float";
	setAttr -k on ".maskWeight_50" 0;
	setAttr ".maskWeight_51_Name" -type "string" "maskWeight_51";
	setAttr ".maskWeight_51_Type" -type "string" "float";
	setAttr -k on ".maskWeight_51" 0;
	setAttr ".maskWeight_52_Name" -type "string" "maskWeight_52";
	setAttr ".maskWeight_52_Type" -type "string" "float";
	setAttr -k on ".maskWeight_52" 0;
	setAttr ".maskWeight_53_Name" -type "string" "maskWeight_53";
	setAttr ".maskWeight_53_Type" -type "string" "float";
	setAttr -k on ".maskWeight_53" 0;
	setAttr ".maskWeight_54_Name" -type "string" "maskWeight_54";
	setAttr ".maskWeight_54_Type" -type "string" "float";
	setAttr -k on ".maskWeight_54" 0;
	setAttr ".maskWeight_55_Name" -type "string" "maskWeight_55";
	setAttr ".maskWeight_55_Type" -type "string" "float";
	setAttr -k on ".maskWeight_55" 0;
	setAttr ".maskWeight_56_Name" -type "string" "maskWeight_56";
	setAttr ".maskWeight_56_Type" -type "string" "float";
	setAttr -k on ".maskWeight_56" 0;
	setAttr ".maskWeight_57_Name" -type "string" "maskWeight_57";
	setAttr ".maskWeight_57_Type" -type "string" "float";
	setAttr -k on ".maskWeight_57" 0;
	setAttr ".maskWeight_58_Name" -type "string" "maskWeight_58";
	setAttr ".maskWeight_58_Type" -type "string" "float";
	setAttr -k on ".maskWeight_58" 0;
	setAttr ".maskWeight_59_Name" -type "string" "maskWeight_59";
	setAttr ".maskWeight_59_Type" -type "string" "float";
	setAttr -k on ".maskWeight_59" 0;
	setAttr ".maskWeight_60_Name" -type "string" "maskWeight_60";
	setAttr ".maskWeight_60_Type" -type "string" "float";
	setAttr -k on ".maskWeight_60" 0;
	setAttr ".maskWeight_61_Name" -type "string" "maskWeight_61";
	setAttr ".maskWeight_61_Type" -type "string" "float";
	setAttr -k on ".maskWeight_61" 0;
	setAttr ".maskWeight_62_Name" -type "string" "maskWeight_62";
	setAttr ".maskWeight_62_Type" -type "string" "float";
	setAttr -k on ".maskWeight_62" 0;
	setAttr ".maskWeight_63_Name" -type "string" "maskWeight_63";
	setAttr ".maskWeight_63_Type" -type "string" "float";
	setAttr -k on ".maskWeight_63" 0;
	setAttr ".maskWeight_64_Name" -type "string" "maskWeight_64";
	setAttr ".maskWeight_64_Type" -type "string" "float";
	setAttr -k on ".maskWeight_64" 0;
	setAttr ".maskWeight_65_Name" -type "string" "maskWeight_65";
	setAttr ".maskWeight_65_Type" -type "string" "float";
	setAttr -k on ".maskWeight_65" 0;
	setAttr ".maskWeight_66_Name" -type "string" "maskWeight_66";
	setAttr ".maskWeight_66_Type" -type "string" "float";
	setAttr -k on ".maskWeight_66" 0;
	setAttr ".maskWeight_67_Name" -type "string" "maskWeight_67";
	setAttr ".maskWeight_67_Type" -type "string" "float";
	setAttr -k on ".maskWeight_67" 0;
	setAttr ".maskWeight_68_Name" -type "string" "maskWeight_68";
	setAttr ".maskWeight_68_Type" -type "string" "float";
	setAttr -k on ".maskWeight_68" 0;
	setAttr ".maskWeight_69_Name" -type "string" "maskWeight_69";
	setAttr ".maskWeight_69_Type" -type "string" "float";
	setAttr -k on ".maskWeight_69" 0;
	setAttr ".maskWeight_70_Name" -type "string" "maskWeight_70";
	setAttr ".maskWeight_70_Type" -type "string" "float";
	setAttr -k on ".maskWeight_70" 0;
	setAttr ".maskWeight_71_Name" -type "string" "maskWeight_71";
	setAttr ".maskWeight_71_Type" -type "string" "float";
	setAttr -k on ".maskWeight_71" 0;
	setAttr ".maskWeight_72_Name" -type "string" "maskWeight_72";
	setAttr ".maskWeight_72_Type" -type "string" "float";
	setAttr -k on ".maskWeight_72" 0;
	setAttr ".maskWeight_73_Name" -type "string" "maskWeight_73";
	setAttr ".maskWeight_73_Type" -type "string" "float";
	setAttr -k on ".maskWeight_73" 0;
	setAttr ".maskWeight_74_Name" -type "string" "maskWeight_74";
	setAttr ".maskWeight_74_Type" -type "string" "float";
	setAttr -k on ".maskWeight_74" 0;
	setAttr ".maskWeight_75_Name" -type "string" "maskWeight_75";
	setAttr ".maskWeight_75_Type" -type "string" "float";
	setAttr -k on ".maskWeight_75" 0;
	setAttr ".maskWeight_76_Name" -type "string" "maskWeight_76";
	setAttr ".maskWeight_76_Type" -type "string" "float";
	setAttr -k on ".maskWeight_76" 0;
	setAttr ".maskWeight_77_Name" -type "string" "maskWeight_77";
	setAttr ".maskWeight_77_Type" -type "string" "float";
	setAttr -k on ".maskWeight_77" 0;
	setAttr ".maskWeight_78_Name" -type "string" "maskWeight_78";
	setAttr ".maskWeight_78_Type" -type "string" "float";
	setAttr -k on ".maskWeight_78" 0;
	setAttr ".maskWeight_79_Name" -type "string" "maskWeight_79";
	setAttr ".maskWeight_79_Type" -type "string" "float";
	setAttr -k on ".maskWeight_79" 0;
	setAttr ".maskWeight_80_Name" -type "string" "maskWeight_80";
	setAttr ".maskWeight_80_Type" -type "string" "float";
	setAttr -k on ".maskWeight_80" 0;
	setAttr ".maskWeight_81_Name" -type "string" "maskWeight_81";
	setAttr ".maskWeight_81_Type" -type "string" "float";
	setAttr -k on ".maskWeight_81" 0;
createNode shadingEngine -n "shader_head_shaderSG";
	rename -uid "7EF66A4A-4CF9-19EF-2CAE-43A66BD86450";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "666E56BA-4056-42F6-D724-6A82CF0141C9";
createNode dx11Shader -n "shader_teeth_shader";
	rename -uid "F3B6C2CC-43E7-F0F0-F0FB-DBA8CFF7413C";
	addAttr -s false -is true -ci true -k true -sn "te" -ln "techniqueEnum" -nn "Technique" 
		-ct "HW_shader_parameter" -min 0 -max 2 -en "TessellationOFF" -at "enum";
	addAttr -ci true -sn "Light_0_use_implicit_lighting" -ln "Light_0_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_0_connected_light" -ln "Light_0_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_1_use_implicit_lighting" -ln "Light_1_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_1_connected_light" -ln "Light_1_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_2_use_implicit_lighting" -ln "Light_2_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_2_connected_light" -ln "Light_2_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Name" -ln "SuperFilterTaps_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Type" -ln "SuperFilterTaps_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps" -ln "SuperFilterTaps" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "SuperFilterTapsX" -ln "SuperFilterTapsX" -ct "HW_shader_parameter" 
		-dv -0.84052002429962158 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -sn "SuperFilterTapsY" -ln "SuperFilterTapsY" -ct "HW_shader_parameter" 
		-dv -0.073954001069068909 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Name" -ln "shadowMapTexelSize_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Type" -ln "shadowMapTexelSize_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize" -ln "shadowMapTexelSize" 
		-ct "HW_shader_parameter" -dv 0.0019531298894435167 -smn 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Name" -ln "LinearSpaceLighting_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Type" -ln "LinearSpaceLighting_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "LinearSpaceLighting" -ln "LinearSpaceLighting" 
		-nn "Linear Space Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseShadows_Name" -ln "UseShadows_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "UseShadows_Type" -ln "UseShadows_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "UseShadows" -ln "UseShadows" -nn "Shadows" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Name" -ln "shadowMultiplier_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Type" -ln "shadowMultiplier_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowMultiplier" -ln "shadowMultiplier" 
		-nn "Shadow Strength" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Name" -ln "IsSwatchRender_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Type" -ln "IsSwatchRender_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender" -ln "IsSwatchRender" -ct "HW_shader_parameter" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Name" -ln "shadowDepthBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Type" -ln "shadowDepthBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDepthBias" -ln "shadowDepthBias" -nn "Shadow Bias" 
		-ct "HW_shader_parameter" -dv 0.0099999997764825821 -min 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Name" -ln "MayaFullScreenGamma_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Type" -ln "MayaFullScreenGamma_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma" -ln "MayaFullScreenGamma" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Name" -ln "flipBackfaceNormals_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Type" -ln "flipBackfaceNormals_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "flipBackfaceNormals" -ln "flipBackfaceNormals" 
		-nn "Double Sided Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Enable_Name" -ln "light0Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Enable_Type" -ln "light0Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Enable" -ln "light0Enable" -nn "Enable Light 0" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Type_Name" -ln "light0Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Type_Type" -ln "light0Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Type" -ln "light0Type" -nn "Light 0 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light0Pos_Name" -ln "light0Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Pos_Type" -ln "light0Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Pos" -ln "light0Pos" -nn "Light 0 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0Color_Name" -ln "light0Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Color_Type" -ln "light0Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light0Color" -ln "light0Color" -nn "Light 0 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ColorR" -ln "light0ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorG" -ln "light0ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorB" -ln "light0ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -h true -sn "light0Intensity_Name" -ln "light0Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Intensity_Type" -ln "light0Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Intensity" -ln "light0Intensity" -nn "Light 0 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0Dir_Name" -ln "light0Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Dir_Type" -ln "light0Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Dir" -ln "light0Dir" -nn "Light 0 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Name" -ln "light0ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Type" -ln "light0ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0ConeAngle" -ln "light0ConeAngle" -nn "Light 0 Cone Angle" 
		-ct "HW_shader_parameter" -dv 0.46000000834465027 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0FallOff_Name" -ln "light0FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0FallOff_Type" -ln "light0FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0FallOff" -ln "light0FallOff" -nn "Light 0 Penumbra Angle" 
		-ct "HW_shader_parameter" -dv 0.69999998807907104 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Name" -ln "light0AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Type" -ln "light0AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0AttenScale" -ln "light0AttenScale" 
		-nn "Light 0 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Name" -ln "light0ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Type" -ln "light0ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn" -ln "light0ShadowOn" -nn "Light 0 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Enable_Name" -ln "light1Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Enable_Type" -ln "light1Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Enable" -ln "light1Enable" -nn "Enable Light 1" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Type_Name" -ln "light1Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Type_Type" -ln "light1Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Type" -ln "light1Type" -nn "Light 1 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light1Pos_Name" -ln "light1Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Pos_Type" -ln "light1Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Pos" -ln "light1Pos" -nn "Light 1 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1Color_Name" -ln "light1Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Color_Type" -ln "light1Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light1Color" -ln "light1Color" -nn "Light 1 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ColorR" -ln "light1ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorG" -ln "light1ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorB" -ln "light1ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -h true -sn "light1Intensity_Name" -ln "light1Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Intensity_Type" -ln "light1Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Intensity" -ln "light1Intensity" -nn "Light 1 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1Dir_Name" -ln "light1Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Dir_Type" -ln "light1Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Dir" -ln "light1Dir" -nn "Light 1 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Name" -ln "light1ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Type" -ln "light1ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1ConeAngle" -ln "light1ConeAngle" -nn "Light 1 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1FallOff_Name" -ln "light1FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1FallOff_Type" -ln "light1FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1FallOff" -ln "light1FallOff" -nn "Light 1 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Name" -ln "light1AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Type" -ln "light1AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1AttenScale" -ln "light1AttenScale" 
		-nn "Light 1 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Name" -ln "light1ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Type" -ln "light1ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn" -ln "light1ShadowOn" -nn "Light 1 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Enable_Name" -ln "light2Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Enable_Type" -ln "light2Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Enable" -ln "light2Enable" -nn "Enable Light 2" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Type_Name" -ln "light2Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Type_Type" -ln "light2Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Type" -ln "light2Type" -nn "Light 2 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light2Pos_Name" -ln "light2Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Pos_Type" -ln "light2Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Pos" -ln "light2Pos" -nn "Light 2 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2Color_Name" -ln "light2Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Color_Type" -ln "light2Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light2Color" -ln "light2Color" -nn "Light 2 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ColorR" -ln "light2ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorG" -ln "light2ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorB" -ln "light2ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -h true -sn "light2Intensity_Name" -ln "light2Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Intensity_Type" -ln "light2Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Intensity" -ln "light2Intensity" -nn "Light 2 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2Dir_Name" -ln "light2Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Dir_Type" -ln "light2Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Dir" -ln "light2Dir" -nn "Light 2 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Name" -ln "light2ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Type" -ln "light2ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2ConeAngle" -ln "light2ConeAngle" -nn "Light 2 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2FallOff_Name" -ln "light2FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2FallOff_Type" -ln "light2FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2FallOff" -ln "light2FallOff" -nn "Light 2 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Name" -ln "light2AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Type" -ln "light2AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2AttenScale" -ln "light2AttenScale" 
		-nn "Light 2 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Name" -ln "light2ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Type" -ln "light2ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn" -ln "light2ShadowOn" -nn "Light 2 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Name" -ln "UseAmbientOcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Type" -ln "UseAmbientOcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseAmbientOcclusionTexture" -ln "UseAmbientOcclusionTexture" 
		-nn "Use Occlusion Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Name" -ln "transpDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Type" -ln "transpDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "transpDepthTexture" -ln "transpDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "transpDepthTextureR" -ln "transpDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureG" -ln "transpDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureB" -ln "transpDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Name" -ln "opaqueDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Type" -ln "opaqueDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "opaqueDepthTexture" -ln "opaqueDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "opaqueDepthTextureR" -ln "opaqueDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureG" -ln "opaqueDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureB" -ln "opaqueDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Name" -ln "UseDiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Type" -ln "UseDiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTexture" -ln "UseDiffuseTexture" 
		-nn "Use Diffuse Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Name" -ln "UseDiffuseTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Type" -ln "UseDiffuseTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTextureAlpha" -ln "UseDiffuseTextureAlpha" 
		-nn "Use Diffuse Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Name" -ln "DiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Type" -ln "DiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseTexture" -ln "DiffuseTexture" -nn "Diffuse Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseTextureR" -ln "DiffuseTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureG" -ln "DiffuseTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureB" -ln "DiffuseTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Name" -ln "DiffuseColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Type" -ln "DiffuseColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "DiffuseColor" -ln "DiffuseColor" -nn "Diffuse Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseColorR" -ln "DiffuseColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorG" -ln "DiffuseColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorB" -ln "DiffuseColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -h true -sn "Opacity_Name" -ln "Opacity_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Opacity_Type" -ln "Opacity_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Opacity" -ln "Opacity" -nn "Opacity" -ct "HW_shader_parameter" 
		-dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Name" -ln "UseOpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Type" -ln "UseOpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseOpacityMaskTexture" -ln "UseOpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Name" -ln "OpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Type" -ln "OpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OpacityMaskTexture" -ln "OpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OpacityMaskTextureR" -ln "OpacityMaskTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureG" -ln "OpacityMaskTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureB" -ln "OpacityMaskTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Name" -ln "OpacityMaskBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Type" -ln "OpacityMaskBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskBias" -ln "OpacityMaskBias" -nn "Opacity Mask Bias" 
		-ct "HW_shader_parameter" -dv 0.10000000149011612 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Name" -ln "UseSpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Type" -ln "UseSpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTexture" -ln "UseSpecularTexture" 
		-nn "Use Specular Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Name" -ln "SpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Type" -ln "SpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularTexture" -ln "SpecularTexture" -nn "Specular Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularTextureR" -ln "SpecularTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureG" -ln "SpecularTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureB" -ln "SpecularTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -h true -sn "SpecularColor_Name" -ln "SpecularColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularColor_Type" -ln "SpecularColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "SpecularColor" -ln "SpecularColor" -nn "Specular Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularColorR" -ln "SpecularColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorG" -ln "SpecularColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorB" -ln "SpecularColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Name" -ln "UseNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Type" -ln "UseNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseNormalTexture" -ln "UseNormalTexture" 
		-nn "Use Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalTexture_Name" -ln "NormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexture_Type" -ln "NormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "NormalTexture" -ln "NormalTexture" -nn "Normal Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "NormalTextureR" -ln "NormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureG" -ln "NormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureB" -ln "NormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -h true -sn "NormalHeight_Name" -ln "NormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalHeight_Type" -ln "NormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalHeight" -ln "NormalHeight" -nn "Normal Height" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 5 -at "float";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Name" -ln "SupportNonUniformScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Type" -ln "SupportNonUniformScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SupportNonUniformScale" -ln "SupportNonUniformScale" 
		-nn "Support Non-Uniform Scale" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Name" -ln "NormalCoordsysX_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Type" -ln "NormalCoordsysX_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysX" -ln "NormalCoordsysX" -nn "Normal X (Red)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Name" -ln "NormalCoordsysY_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Type" -ln "NormalCoordsysY_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysY" -ln "NormalCoordsysY" -nn "Normal Y (Green)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Name" -ln "DisplacementModel_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Type" -ln "DisplacementModel_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementModel" -ln "DisplacementModel" 
		-nn "Displacement Model" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en 
		"Grayscale:Tangent Vector" -at "enum";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Name" -ln "UseDisplacementMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Type" -ln "UseDisplacementMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDisplacementMap" -ln "UseDisplacementMap" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Name" -ln "DisplacementTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Type" -ln "DisplacementTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DisplacementTexture" -ln "DisplacementTexture" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DisplacementTextureR" -ln "DisplacementTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureG" -ln "DisplacementTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureB" -ln "DisplacementTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Name" -ln "VectorDisplacementCoordSys_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Type" -ln "VectorDisplacementCoordSys_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "VectorDisplacementCoordSys" -ln "VectorDisplacementCoordSys" 
		-nn "Displacement Coordsys" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 
		-en "Mudbox (XZY):Maya (XYZ)" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Name" -ln "DisplacementHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Type" -ln "DisplacementHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementHeight" -ln "DisplacementHeight" 
		-nn "Displacement Height" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Name" -ln "DisplacementOffset_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Type" -ln "DisplacementOffset_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementOffset" -ln "DisplacementOffset" 
		-nn "Displacement Offset" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn -1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Name" -ln "DisplacementClippingBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Type" -ln "DisplacementClippingBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementClippingBias" -ln "DisplacementClippingBias" 
		-nn "Displacement Clipping Bias" -ct "HW_shader_parameter" -dv 5 -min -99999 -max 
		99999 -smn 0 -smx 99 -at "float";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Name" -ln "BBoxExtraScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Type" -ln "BBoxExtraScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "BBoxExtraScale" -ln "BBoxExtraScale" -nn "Bounding Box Extra Scale" 
		-ct "HW_shader_parameter" -dv 1 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationRange_Name" -ln "TessellationRange_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationRange_Type" -ln "TessellationRange_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationRange" -ln "TessellationRange" 
		-nn "Tessellation Range" -ct "HW_shader_parameter" -min 0 -max 99999 -smx 999 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationMin_Name" -ln "TessellationMin_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationMin_Type" -ln "TessellationMin_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationMin" -ln "TessellationMin" -nn "Tessellation Minimum" 
		-ct "HW_shader_parameter" -dv 3 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Name" -ln "FlatTessellation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Type" -ln "FlatTessellation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "FlatTessellation" -ln "FlatTessellation" 
		-nn "Flat Tessellation" -ct "HW_shader_parameter" -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Name" -ln "UseTranslucency_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Type" -ln "UseTranslucency_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseTranslucency" -ln "UseTranslucency" -nn "Back Scattering" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Name" -ln "UseThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Type" -ln "UseThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseThicknessTexture" -ln "UseThicknessTexture" 
		-nn "Use Thickness Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Name" -ln "UseDiffuseIBLMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Type" -ln "UseDiffuseIBLMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseIBLMap" -ln "UseDiffuseIBLMap" 
		-nn "Use Diffuse Cubemap" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Name" -ln "DiffuseIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Type" -ln "DiffuseIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseIBLIntensity" -ln "DiffuseIBLIntensity" 
		-nn "Diffuse IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Name" -ln "DiffuseTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Type" -ln "DiffuseTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseTexcoord" -ln "DiffuseTexcoord" -nn "Diffuse Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Name" -ln "OpacityMaskTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Type" -ln "OpacityMaskTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskTexcoord" -ln "OpacityMaskTexcoord" 
		-nn "Opacity Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Name" -ln "SpecularTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Type" -ln "SpecularTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularTexcoord" -ln "SpecularTexcoord" 
		-nn "Specular Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Name" -ln "NormalTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Type" -ln "NormalTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalTexcoord" -ln "NormalTexcoord" -nn "Normal Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Name" -ln "DisplacementTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Type" -ln "DisplacementTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementTexcoord" -ln "DisplacementTexcoord" 
		-nn "Displacement Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en 
		"TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Name" -ln "ThicknessTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Type" -ln "ThicknessTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "ThicknessTexcoord" -ln "ThicknessTexcoord" 
		-nn "Translucency Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 
		-en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Name" -ln "light0ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Type" -ln "light0ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light0ShadowMap" -ln "light0ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ShadowMapR" -ln "light0ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapG" -ln "light0ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapB" -ln "light0ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Name" -ln "light1ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Type" -ln "light1ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light1ShadowMap" -ln "light1ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ShadowMapR" -ln "light1ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapG" -ln "light1ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapB" -ln "light1ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Name" -ln "light2ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Type" -ln "light2ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light2ShadowMap" -ln "light2ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ShadowMapR" -ln "light2ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapG" -ln "light2ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapB" -ln "light2ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -h true -sn "screenSize_Name" -ln "screenSize_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize_Type" -ln "screenSize_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize" -ln "screenSize" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "screenSizeX" -ln "screenSizeX" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -sn "screenSizeY" -ln "screenSizeY" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -h true -sn "SkyRotation_Name" -ln "SkyRotation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SkyRotation_Type" -ln "SkyRotation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SkyRotation" -ln "SkyRotation" -nn "Sky Rotation" 
		-ct "HW_shader_parameter" -min 0 -max 99999 -smn 0 -smx 360 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Name" -ln "DiffuseCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Type" -ln "DiffuseCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseCubeIBL" -ln "DiffuseCubeIBL" -nn "Diffuse Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseCubeIBLR" -ln "DiffuseCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLG" -ln "DiffuseCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLB" -ln "DiffuseCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Name" -ln "UseSpecCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Type" -ln "UseSpecCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecCubeIBL" -ln "UseSpecCubeIBL" -nn "Use Specular Cubemap" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Name" -ln "SpecularIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Type" -ln "SpecularIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularIBLIntensity" -ln "SpecularIBLIntensity" 
		-nn "Specular IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Name" -ln "SpecularCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Type" -ln "SpecularCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularCubeIBL" -ln "SpecularCubeIBL" -nn "Specular Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularCubeIBLR" -ln "SpecularCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLG" -ln "SpecularCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLB" -ln "SpecularCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -h true -sn "LutTexture_Name" -ln "LutTexture_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LutTexture_Type" -ln "LutTexture_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -uac -sn "LutTexture" -ln "LutTexture" -nn "SSS LUT Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "LutTextureR" -ln "LutTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureG" -ln "LutTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureB" -ln "LutTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -h true -sn "DitherTexture_Name" -ln "DitherTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DitherTexture_Type" -ln "DitherTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DitherTexture" -ln "DitherTexture" -nn "SSS Dither Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DitherTextureR" -ln "DitherTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureG" -ln "DitherTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureB" -ln "DitherTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Name" -ln "skinCoeffX_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Type" -ln "skinCoeffX_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffX" -ln "skinCoeffX" -nn "SSS Coeffient R" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Name" -ln "skinCoeffY_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Type" -ln "skinCoeffY_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffY" -ln "skinCoeffY" -nn "SSS Coeffient G" 
		-ct "HW_shader_parameter" -dv 0.5 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Name" -ln "skinCoeffZ_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Type" -ln "skinCoeffZ_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffZ" -ln "skinCoeffZ" -nn "SSS Coeffient B" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Name" -ln "NormalBlurring_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Type" -ln "NormalBlurring_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalBlurring" -ln "NormalBlurring" -nn "SSS Softness" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Name" -ln "ScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Type" -ln "ScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "ScatteringRadiusTexture" -ln "ScatteringRadiusTexture" 
		-nn "SSS Radius Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "ScatteringRadiusTextureR" -ln "ScatteringRadiusTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureG" -ln "ScatteringRadiusTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureB" -ln "ScatteringRadiusTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Name" -ln "UseScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Type" -ln "UseScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseScatteringRadiusTexture" -ln "UseScatteringRadiusTexture" 
		-nn "Use SSS Radius Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "skinScattering_Name" -ln "skinScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScattering_Type" -ln "skinScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScattering" -ln "skinScattering" -nn "SSS Radius" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowBlur_Name" -ln "shadowBlur_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "shadowBlur_Type" -ln "shadowBlur_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "shadowBlur" -ln "shadowBlur" -nn "SSS Shadow Blur" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowDither_Name" -ln "shadowDither_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDither_Type" -ln "shadowDither_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDither" -ln "shadowDither" -nn "SSS Shadow Dither" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowScattering_Name" -ln "shadowScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowScattering_Type" -ln "shadowScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowScattering" -ln "shadowScattering" 
		-nn "SSS Shadow Scattering" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Name" -ln "shadowSaturation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Type" -ln "shadowSaturation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowSaturation" -ln "shadowSaturation" 
		-nn "SSS Shadow Saturation" -ct "HW_shader_parameter" -dv 1 -min 0 -max 4 -smx 4 
		-at "float";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Name" -ln "BackScatteringThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Type" -ln "BackScatteringThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "BackScatteringThicknessTexture" -ln "BackScatteringThicknessTexture" 
		-nn "Thickness Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureR" -ln "BackScatteringThicknessTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureG" -ln "BackScatteringThicknessTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureB" -ln "BackScatteringThicknessTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Name" -ln "skinScatteringRoughness_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Type" -ln "skinScatteringRoughness_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringRoughness" -ln "skinScatteringRoughness" 
		-nn "Back Scattering Width" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Name" -ln "skinScatteringOuterColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Type" -ln "skinScatteringOuterColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "skinScatteringOuterColor" -ln "skinScatteringOuterColor" 
		-nn "Back Scattering Color" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "skinScatteringOuterColorR" -ln "skinScatteringOuterColorR" 
		-ct "HW_shader_parameter" -dv 0.25 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorG" -ln "skinScatteringOuterColorG" 
		-ct "HW_shader_parameter" -dv 0.05000000074505806 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorB" -ln "skinScatteringOuterColorB" 
		-ct "HW_shader_parameter" -dv 0.019999999552965164 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Name" -ln "skinScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Type" -ln "skinScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringAmount" -ln "skinScatteringAmount" 
		-nn "Back Scattering Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 6 -smx 6 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Name" -ln "skinAmbientScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Type" -ln "skinAmbientScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinAmbientScatteringAmount" -ln "skinAmbientScatteringAmount" 
		-nn "Back Scattering Ambient Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 
		6 -smx 6 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Name" -ln "UseSpecularTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Type" -ln "UseSpecularTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTextureAlpha" -ln "UseSpecularTextureAlpha" 
		-nn "Use Roughness Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "LobeMix_Name" -ln "LobeMix_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LobeMix_Type" -ln "LobeMix_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "LobeMix" -ln "LobeMix" -nn "Lobe Mixing" 
		-ct "HW_shader_parameter" -dv 0.75 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "Roughness_Name" -ln "Roughness_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Roughness_Type" -ln "Roughness_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Roughness" -ln "Roughness" -nn "Roughness multiplier" 
		-ct "HW_shader_parameter" -dv 0.20000000298023224 -min 0.0099999997764825821 -max 
		1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Name" -ln "OcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Type" -ln "OcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OcclusionTexture" -ln "OcclusionTexture" -nn "Ambient Occlusion Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OcclusionTextureR" -ln "OcclusionTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureG" -ln "OcclusionTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureB" -ln "OcclusionTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Name" -ln "OcclusionAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Type" -ln "OcclusionAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionAmount" -ln "OcclusionAmount" -nn "Occlusion Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Name" -ln "UseCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Type" -ln "UseCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseCavityTexture" -ln "UseCavityTexture" 
		-nn "Use Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "CavityTexture_Name" -ln "CavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityTexture_Type" -ln "CavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "CavityTexture" -ln "CavityTexture" -nn "Cavity Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "CavityTextureR" -ln "CavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureG" -ln "CavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureB" -ln "CavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -h true -sn "CavityAmount_Name" -ln "CavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityAmount_Type" -ln "CavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "CavityAmount" -ln "CavityAmount" -nn "Cavity Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Name" -ln "UseMicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Type" -ln "UseMicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroCavityTexture" -ln "UseMicroCavityTexture" 
		-nn "Use Micro Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Name" -ln "MicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Type" -ln "MicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroCavityTexture" -ln "MicroCavityTexture" 
		-nn "Micro Cavity Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroCavityTextureR" -ln "MicroCavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureG" -ln "MicroCavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureB" -ln "MicroCavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Name" -ln "MicroCavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Type" -ln "MicroCavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroCavityAmount" -ln "MicroCavityAmount" 
		-nn "Micro Cavity Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Name" -ln "UseMicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Type" -ln "UseMicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroNormalTexture" -ln "UseMicroNormalTexture" 
		-nn "Use Micro Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Name" -ln "MicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Type" -ln "MicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroNormalTexture" -ln "MicroNormalTexture" 
		-nn "Micro Normal Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroNormalTextureR" -ln "MicroNormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureG" -ln "MicroNormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureB" -ln "MicroNormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Name" -ln "MicroNormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Type" -ln "MicroNormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroNormalHeight" -ln "MicroNormalHeight" 
		-nn "Micro Normal Height" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		5 -at "float";
	addAttr -is true -ci true -h true -sn "MicroScale_Name" -ln "MicroScale_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "MicroScale_Type" -ln "MicroScale_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "MicroScale" -ln "MicroScale" -nn "Micro Scale" 
		-ct "HW_shader_parameter" -dv 32 -min 16 -max 99999 -smx 256 -at "float";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Name" -ln "UseBlendTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Type" -ln "UseBlendTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseBlendTexture" -ln "UseBlendTexture" -nn "Enable Wrinkle Mixing" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Name" -ln "OcclusionTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Type" -ln "OcclusionTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionTexcoord" -ln "OcclusionTexcoord" 
		-nn "Ambient Occlusion Map UV" -ct "HW_shader_parameter" -dv 1 -min 0 -max 2 -smn 
		0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -ci true -sn "Position" -ln "Position" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Position_Name" -ln "Position_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -h true -sn "Position_Source" -ln "Position_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -sn "Position_DefaultTexture" -ln "Position_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Position";
	addAttr -ci true -sn "TexCoord0" -ln "TexCoord0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord0_Name" -ln "TexCoord0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord0";
	addAttr -is true -ci true -h true -sn "TexCoord0_Source" -ln "TexCoord0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -is true -ci true -sn "TexCoord0_DefaultTexture" -ln "TexCoord0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -ci true -sn "TexCoord1" -ln "TexCoord1" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord1_Name" -ln "TexCoord1_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord1";
	addAttr -is true -ci true -h true -sn "TexCoord1_Source" -ln "TexCoord1_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -is true -ci true -sn "TexCoord1_DefaultTexture" -ln "TexCoord1_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -ci true -sn "TexCoord2" -ln "TexCoord2" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord2_Name" -ln "TexCoord2_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord2";
	addAttr -is true -ci true -h true -sn "TexCoord2_Source" -ln "TexCoord2_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -is true -ci true -sn "TexCoord2_DefaultTexture" -ln "TexCoord2_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -ci true -sn "Normal" -ln "Normal" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Normal_Name" -ln "Normal_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -h true -sn "Normal_Source" -ln "Normal_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -sn "Normal_DefaultTexture" -ln "Normal_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Normal";
	addAttr -ci true -sn "Binormal0" -ln "Binormal0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Binormal0_Name" -ln "Binormal0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Binormal0";
	addAttr -is true -ci true -h true -sn "Binormal0_Source" -ln "Binormal0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -is true -ci true -sn "Binormal0_DefaultTexture" -ln "Binormal0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -ci true -sn "Tangent0" -ln "Tangent0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Tangent0_Name" -ln "Tangent0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -h true -sn "Tangent0_Source" -ln "Tangent0_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -sn "Tangent0_DefaultTexture" -ln "Tangent0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Tangent0";
	setAttr ".vpar" -type "stringArray" 7 "Position" "TexCoord0" "TexCoord1" "TexCoord2" "Normal" "Binormal0" "Tangent0"  ;
	setAttr ".upar" -type "stringArray" 124 "SuperFilterTaps" "shadowMapTexelSize" "IsSwatchRender" "screenSize" "MayaFullScreenGamma" "light0Enable" "light0Type" "light0Pos" "light0Color" "light0Intensity" "light0Dir" "light0ConeAngle" "light0FallOff" "light0AttenScale" "light0ShadowOn" "light1Enable" "light1Type" "light1Pos" "light1Color" "light1Intensity" "light1Dir" "light1ConeAngle" "light1FallOff" "light1AttenScale" "light1ShadowOn" "light2Enable" "light2Type" "light2Pos" "light2Color" "light2Intensity" "light2Dir" "light2ConeAngle" "light2FallOff" "light2AttenScale" "light2ShadowOn" "LinearSpaceLighting" "UseShadows" "shadowMultiplier" "shadowDepthBias" "flipBackfaceNormals" "SkyRotation" "UseDiffuseIBLMap" "DiffuseIBLIntensity" "DiffuseCubeIBL" "UseSpecCubeIBL" "SpecularIBLIntensity" "SpecularCubeIBL" "transpDepthTexture" "opaqueDepthTexture" "UseDiffuseTexture" "UseDiffuseTextureAlpha" "DiffuseTexture" "DiffuseColor" "LutTexture" "DitherTexture" "skinCoeffX" "skinCoeffY" "skinCoeffZ" "NormalBlurring" "UseScatteringRadiusTexture" "ScatteringRadiusTexture" "skinScattering" "shadowBlur" "shadowDither" "shadowScattering" "shadowSaturation" "UseTranslucency" "BackScatteringThicknessTexture" "UseThicknessTexture" "skinScatteringRoughness" "skinScatteringOuterColor" "skinScatteringAmount" "skinAmbientScatteringAmount" "UseSpecularTextureAlpha" "UseSpecularTexture" "SpecularTexture" "SpecularColor" "LobeMix" "Roughness" "UseAmbientOcclusionTexture" "OcclusionTexture" "OcclusionAmount" "UseCavityTexture" "CavityTexture" "CavityAmount" "UseNormalTexture" "NormalTexture" "NormalHeight" "SupportNonUniformScale" "NormalCoordsysX" "NormalCoordsysY" "UseMicroCavityTexture" "MicroCavityTexture" "MicroCavityAmount" "UseMicroNormalTexture" "MicroNormalTexture" "MicroNormalHeight" "MicroScale" "OpacityMaskTexture" "Opacity" "UseOpacityMaskTexture" "OpacityMaskBias" "DisplacementModel" "UseDisplacementMap" "DisplacementTexture" "VectorDisplacementCoordSys" "DisplacementHeight" "DisplacementOffset" "DisplacementClippingBias" "BBoxExtraScale" "TessellationRange" "TessellationMin" "FlatTessellation" "UseBlendTexture" "DiffuseTexcoord" "OcclusionTexcoord" "OpacityMaskTexcoord" "SpecularTexcoord" "NormalTexcoord" "DisplacementTexcoord" "ThicknessTexcoord" "light0ShadowMap" "light1ShadowMap" "light2ShadowMap"  ;
	setAttr ".s" -type "string" "$PROJECT_ROOT/Common/SourceAssets/shaders/dx11_shd_teeth.fx";
	setAttr ".t" -type "string" "TessellationOFF";
	setAttr ".SuperFilterTaps_Name" -type "string" "SuperFilterTaps";
	setAttr ".SuperFilterTaps_Type" -type "string" "float1x2";
	setAttr ".SuperFilterTaps" -type "float2" -0.84052002 -0.073954001 ;
	setAttr ".shadowMapTexelSize_Name" -type "string" "shadowMapTexelSize";
	setAttr ".shadowMapTexelSize_Type" -type "string" "float";
	setAttr ".shadowMapTexelSize" 0.0019531298894435167;
	setAttr ".LinearSpaceLighting_Name" -type "string" "LinearSpaceLighting";
	setAttr ".LinearSpaceLighting_Type" -type "string" "bool";
	setAttr -k on ".LinearSpaceLighting" yes;
	setAttr ".UseShadows_Name" -type "string" "UseShadows";
	setAttr ".UseShadows_Type" -type "string" "bool";
	setAttr -k on ".UseShadows" yes;
	setAttr ".shadowMultiplier_Name" -type "string" "shadowMultiplier";
	setAttr ".shadowMultiplier_Type" -type "string" "float";
	setAttr -k on ".shadowMultiplier" 1;
	setAttr ".IsSwatchRender_Name" -type "string" "IsSwatchRender";
	setAttr ".IsSwatchRender_Type" -type "string" "bool";
	setAttr ".IsSwatchRender" no;
	setAttr ".shadowDepthBias_Name" -type "string" "shadowDepthBias";
	setAttr ".shadowDepthBias_Type" -type "string" "float";
	setAttr -k on ".shadowDepthBias" 0.0099999997764825821;
	setAttr ".MayaFullScreenGamma_Name" -type "string" "MayaFullScreenGamma";
	setAttr ".MayaFullScreenGamma_Type" -type "string" "bool";
	setAttr ".MayaFullScreenGamma" no;
	setAttr ".flipBackfaceNormals_Name" -type "string" "flipBackfaceNormals";
	setAttr ".flipBackfaceNormals_Type" -type "string" "bool";
	setAttr -k on ".flipBackfaceNormals" yes;
	setAttr ".light0Enable_Name" -type "string" "light0Enable";
	setAttr ".light0Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light0Enable" no;
	setAttr ".light0Type_Name" -type "string" "light0Type";
	setAttr ".light0Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light0Type" 2;
	setAttr ".light0Pos_Name" -type "string" "light0Pos";
	setAttr ".light0Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 100 1;
	setAttr ".light0Color_Name" -type "string" "light0Color";
	setAttr ".light0Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light0Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light0Color";
	setAttr ".light0Intensity_Name" -type "string" "light0Intensity";
	setAttr ".light0Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light0Intensity" 1;
	setAttr ".light0Dir_Name" -type "string" "light0Dir";
	setAttr ".light0Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light0ConeAngle_Name" -type "string" "light0ConeAngle";
	setAttr ".light0ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light0ConeAngle" 0.46000000834465027;
	setAttr ".light0FallOff_Name" -type "string" "light0FallOff";
	setAttr ".light0FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light0FallOff" 0.69999998807907104;
	setAttr ".light0AttenScale_Name" -type "string" "light0AttenScale";
	setAttr ".light0AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light0AttenScale" 0;
	setAttr ".light0ShadowOn_Name" -type "string" "light0ShadowOn";
	setAttr ".light0ShadowOn_Type" -type "string" "bool";
	setAttr ".light0ShadowOn" yes;
	setAttr ".light1Enable_Name" -type "string" "light1Enable";
	setAttr ".light1Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light1Enable" no;
	setAttr ".light1Type_Name" -type "string" "light1Type";
	setAttr ".light1Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light1Type" 2;
	setAttr ".light1Pos_Name" -type "string" "light1Pos";
	setAttr ".light1Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -100 100 100 1;
	setAttr ".light1Color_Name" -type "string" "light1Color";
	setAttr ".light1Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light1Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light1Color";
	setAttr ".light1Intensity_Name" -type "string" "light1Intensity";
	setAttr ".light1Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light1Intensity" 1;
	setAttr ".light1Dir_Name" -type "string" "light1Dir";
	setAttr ".light1Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light1ConeAngle_Name" -type "string" "light1ConeAngle";
	setAttr ".light1ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light1ConeAngle" 45;
	setAttr ".light1FallOff_Name" -type "string" "light1FallOff";
	setAttr ".light1FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light1FallOff" 0;
	setAttr ".light1AttenScale_Name" -type "string" "light1AttenScale";
	setAttr ".light1AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light1AttenScale" 0;
	setAttr ".light1ShadowOn_Name" -type "string" "light1ShadowOn";
	setAttr ".light1ShadowOn_Type" -type "string" "bool";
	setAttr ".light1ShadowOn" yes;
	setAttr ".light2Enable_Name" -type "string" "light2Enable";
	setAttr ".light2Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light2Enable" no;
	setAttr ".light2Type_Name" -type "string" "light2Type";
	setAttr ".light2Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light2Type" 2;
	setAttr ".light2Pos_Name" -type "string" "light2Pos";
	setAttr ".light2Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 -100 1;
	setAttr ".light2Color_Name" -type "string" "light2Color";
	setAttr ".light2Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light2Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light2Color";
	setAttr ".light2Intensity_Name" -type "string" "light2Intensity";
	setAttr ".light2Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light2Intensity" 1;
	setAttr ".light2Dir_Name" -type "string" "light2Dir";
	setAttr ".light2Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light2ConeAngle_Name" -type "string" "light2ConeAngle";
	setAttr ".light2ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light2ConeAngle" 45;
	setAttr ".light2FallOff_Name" -type "string" "light2FallOff";
	setAttr ".light2FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light2FallOff" 0;
	setAttr ".light2AttenScale_Name" -type "string" "light2AttenScale";
	setAttr ".light2AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light2AttenScale" 0;
	setAttr ".light2ShadowOn_Name" -type "string" "light2ShadowOn";
	setAttr ".light2ShadowOn_Type" -type "string" "bool";
	setAttr ".light2ShadowOn" yes;
	setAttr ".UseAmbientOcclusionTexture_Name" -type "string" "UseAmbientOcclusionTexture";
	setAttr ".UseAmbientOcclusionTexture_Type" -type "string" "bool";
	setAttr -k on ".UseAmbientOcclusionTexture" no;
	setAttr ".transpDepthTexture_Name" -type "string" "transpDepthTexture";
	setAttr ".transpDepthTexture_Type" -type "string" "texture";
	setAttr ".transpDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".opaqueDepthTexture_Name" -type "string" "opaqueDepthTexture";
	setAttr ".opaqueDepthTexture_Type" -type "string" "texture";
	setAttr ".opaqueDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".UseDiffuseTexture_Name" -type "string" "UseDiffuseTexture";
	setAttr ".UseDiffuseTexture_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTexture" yes;
	setAttr ".UseDiffuseTextureAlpha_Name" -type "string" "UseDiffuseTextureAlpha";
	setAttr ".UseDiffuseTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTextureAlpha" no;
	setAttr ".DiffuseTexture_Name" -type "string" "DiffuseTexture";
	setAttr ".DiffuseTexture_Type" -type "string" "texture";
	setAttr ".DiffuseTexture" -type "float3" 0 0 0 ;
	setAttr ".DiffuseColor_Name" -type "string" "DiffuseColor";
	setAttr ".DiffuseColor_Type" -type "string" "color1x3";
	setAttr -k on ".DiffuseColor" -type "float3" 1 1 1 ;
	setAttr ".Opacity_Name" -type "string" "Opacity";
	setAttr ".Opacity_Type" -type "string" "float";
	setAttr -k on ".Opacity" 1;
	setAttr ".UseOpacityMaskTexture_Name" -type "string" "UseOpacityMaskTexture";
	setAttr ".UseOpacityMaskTexture_Type" -type "string" "bool";
	setAttr -k on ".UseOpacityMaskTexture" no;
	setAttr ".OpacityMaskTexture_Name" -type "string" "OpacityMaskTexture";
	setAttr ".OpacityMaskTexture_Type" -type "string" "texture";
	setAttr ".OpacityMaskTexture" -type "float3" 0 0 0 ;
	setAttr ".OpacityMaskBias_Name" -type "string" "OpacityMaskBias";
	setAttr ".OpacityMaskBias_Type" -type "string" "float";
	setAttr -k on ".OpacityMaskBias" 0.10000000149011612;
	setAttr ".UseSpecularTexture_Name" -type "string" "UseSpecularTexture";
	setAttr ".UseSpecularTexture_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTexture" no;
	setAttr ".SpecularTexture_Name" -type "string" "SpecularTexture";
	setAttr ".SpecularTexture_Type" -type "string" "texture";
	setAttr ".SpecularTexture" -type "float3" 0 0 0 ;
	setAttr ".SpecularColor_Name" -type "string" "SpecularColor";
	setAttr ".SpecularColor_Type" -type "string" "color1x3";
	setAttr -k on ".SpecularColor" -type "float3" 0.31782946 0.31782946 0.31782946 ;
	setAttr ".UseNormalTexture_Name" -type "string" "UseNormalTexture";
	setAttr ".UseNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseNormalTexture" yes;
	setAttr ".NormalTexture_Name" -type "string" "NormalTexture";
	setAttr ".NormalTexture_Type" -type "string" "texture";
	setAttr ".NormalTexture" -type "float3" 0 0 0 ;
	setAttr ".NormalHeight_Name" -type "string" "NormalHeight";
	setAttr ".NormalHeight_Type" -type "string" "float";
	setAttr -k on ".NormalHeight" 1.1000000238418579;
	setAttr ".SupportNonUniformScale_Name" -type "string" "SupportNonUniformScale";
	setAttr ".SupportNonUniformScale_Type" -type "string" "bool";
	setAttr -k on ".SupportNonUniformScale" yes;
	setAttr ".NormalCoordsysX_Name" -type "string" "NormalCoordsysX";
	setAttr ".NormalCoordsysX_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysX" 0;
	setAttr ".NormalCoordsysY_Name" -type "string" "NormalCoordsysY";
	setAttr ".NormalCoordsysY_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysY" 0;
	setAttr ".DisplacementModel_Name" -type "string" "DisplacementModel";
	setAttr ".DisplacementModel_Type" -type "string" "enum";
	setAttr -k on ".DisplacementModel" 0;
	setAttr ".UseDisplacementMap_Name" -type "string" "UseDisplacementMap";
	setAttr ".UseDisplacementMap_Type" -type "string" "bool";
	setAttr -k on ".UseDisplacementMap" no;
	setAttr ".DisplacementTexture_Name" -type "string" "DisplacementTexture";
	setAttr ".DisplacementTexture_Type" -type "string" "texture";
	setAttr ".DisplacementTexture" -type "float3" 0 0 0 ;
	setAttr ".VectorDisplacementCoordSys_Name" -type "string" "VectorDisplacementCoordSys";
	setAttr ".VectorDisplacementCoordSys_Type" -type "string" "enum";
	setAttr -k on ".VectorDisplacementCoordSys" 0;
	setAttr ".DisplacementHeight_Name" -type "string" "DisplacementHeight";
	setAttr ".DisplacementHeight_Type" -type "string" "float";
	setAttr -k on ".DisplacementHeight" 0.5;
	setAttr ".DisplacementOffset_Name" -type "string" "DisplacementOffset";
	setAttr ".DisplacementOffset_Type" -type "string" "float";
	setAttr -k on ".DisplacementOffset" 0.5;
	setAttr ".DisplacementClippingBias_Name" -type "string" "DisplacementClippingBias";
	setAttr ".DisplacementClippingBias_Type" -type "string" "float";
	setAttr -k on ".DisplacementClippingBias" 5;
	setAttr ".BBoxExtraScale_Name" -type "string" "BBoxExtraScale";
	setAttr ".BBoxExtraScale_Type" -type "string" "float";
	setAttr -k on ".BBoxExtraScale" 1;
	setAttr ".TessellationRange_Name" -type "string" "TessellationRange";
	setAttr ".TessellationRange_Type" -type "string" "float";
	setAttr -k on ".TessellationRange" 0;
	setAttr ".TessellationMin_Name" -type "string" "TessellationMin";
	setAttr ".TessellationMin_Type" -type "string" "float";
	setAttr -k on ".TessellationMin" 3;
	setAttr ".FlatTessellation_Name" -type "string" "FlatTessellation";
	setAttr ".FlatTessellation_Type" -type "string" "float";
	setAttr -k on ".FlatTessellation" 0;
	setAttr ".UseTranslucency_Name" -type "string" "UseTranslucency";
	setAttr ".UseTranslucency_Type" -type "string" "bool";
	setAttr -k on ".UseTranslucency" no;
	setAttr ".UseThicknessTexture_Name" -type "string" "UseThicknessTexture";
	setAttr ".UseThicknessTexture_Type" -type "string" "bool";
	setAttr -k on ".UseThicknessTexture" no;
	setAttr ".UseDiffuseIBLMap_Name" -type "string" "UseDiffuseIBLMap";
	setAttr ".UseDiffuseIBLMap_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseIBLMap" yes;
	setAttr ".DiffuseIBLIntensity_Name" -type "string" "DiffuseIBLIntensity";
	setAttr ".DiffuseIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".DiffuseIBLIntensity" 0.60000002384185791;
	setAttr ".DiffuseTexcoord_Name" -type "string" "DiffuseTexcoord";
	setAttr ".DiffuseTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DiffuseTexcoord" 0;
	setAttr ".OpacityMaskTexcoord_Name" -type "string" "OpacityMaskTexcoord";
	setAttr ".OpacityMaskTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OpacityMaskTexcoord" 0;
	setAttr ".SpecularTexcoord_Name" -type "string" "SpecularTexcoord";
	setAttr ".SpecularTexcoord_Type" -type "string" "enum";
	setAttr -k on ".SpecularTexcoord" 0;
	setAttr ".NormalTexcoord_Name" -type "string" "NormalTexcoord";
	setAttr ".NormalTexcoord_Type" -type "string" "enum";
	setAttr -k on ".NormalTexcoord" 0;
	setAttr ".DisplacementTexcoord_Name" -type "string" "DisplacementTexcoord";
	setAttr ".DisplacementTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DisplacementTexcoord" 0;
	setAttr ".ThicknessTexcoord_Name" -type "string" "ThicknessTexcoord";
	setAttr ".ThicknessTexcoord_Type" -type "string" "enum";
	setAttr -k on ".ThicknessTexcoord" 0;
	setAttr ".light0ShadowMap_Name" -type "string" "light0ShadowMap";
	setAttr ".light0ShadowMap_Type" -type "string" "texture";
	setAttr ".light0ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light1ShadowMap_Name" -type "string" "light1ShadowMap";
	setAttr ".light1ShadowMap_Type" -type "string" "texture";
	setAttr ".light1ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light2ShadowMap_Name" -type "string" "light2ShadowMap";
	setAttr ".light2ShadowMap_Type" -type "string" "texture";
	setAttr ".light2ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".screenSize_Name" -type "string" "screenSize";
	setAttr ".screenSize_Type" -type "string" "float1x2";
	setAttr ".screenSize" -type "float2" 0 0 ;
	setAttr ".SkyRotation_Name" -type "string" "SkyRotation";
	setAttr ".SkyRotation_Type" -type "string" "float";
	setAttr -k on ".SkyRotation" 12.5;
	setAttr ".DiffuseCubeIBL_Name" -type "string" "DiffuseCubeIBL";
	setAttr ".DiffuseCubeIBL_Type" -type "string" "texture";
	setAttr ".DiffuseCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".UseSpecCubeIBL_Name" -type "string" "UseSpecCubeIBL";
	setAttr ".UseSpecCubeIBL_Type" -type "string" "bool";
	setAttr -k on ".UseSpecCubeIBL" yes;
	setAttr ".SpecularIBLIntensity_Name" -type "string" "SpecularIBLIntensity";
	setAttr ".SpecularIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".SpecularIBLIntensity" 0.28499999642372131;
	setAttr ".SpecularCubeIBL_Name" -type "string" "SpecularCubeIBL";
	setAttr ".SpecularCubeIBL_Type" -type "string" "texture";
	setAttr ".SpecularCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".LutTexture_Name" -type "string" "LutTexture";
	setAttr ".LutTexture_Type" -type "string" "texture";
	setAttr ".LutTexture" -type "float3" 0 0 0 ;
	setAttr ".DitherTexture_Name" -type "string" "DitherTexture";
	setAttr ".DitherTexture_Type" -type "string" "texture";
	setAttr ".DitherTexture" -type "float3" 0 0 0 ;
	setAttr ".skinCoeffX_Name" -type "string" "skinCoeffX";
	setAttr ".skinCoeffX_Type" -type "string" "float";
	setAttr -k on ".skinCoeffX" 0.82099997997283936;
	setAttr ".skinCoeffY_Name" -type "string" "skinCoeffY";
	setAttr ".skinCoeffY_Type" -type "string" "float";
	setAttr -k on ".skinCoeffY" 0.33199998736381531;
	setAttr ".skinCoeffZ_Name" -type "string" "skinCoeffZ";
	setAttr ".skinCoeffZ_Type" -type "string" "float";
	setAttr -k on ".skinCoeffZ" 0.030999999493360519;
	setAttr ".NormalBlurring_Name" -type "string" "NormalBlurring";
	setAttr ".NormalBlurring_Type" -type "string" "float";
	setAttr -k on ".NormalBlurring" 1;
	setAttr ".ScatteringRadiusTexture_Name" -type "string" "ScatteringRadiusTexture";
	setAttr ".ScatteringRadiusTexture_Type" -type "string" "texture";
	setAttr ".ScatteringRadiusTexture" -type "float3" 0 0 0 ;
	setAttr ".UseScatteringRadiusTexture_Name" -type "string" "UseScatteringRadiusTexture";
	setAttr ".UseScatteringRadiusTexture_Type" -type "string" "bool";
	setAttr -k on ".UseScatteringRadiusTexture" no;
	setAttr ".skinScattering_Name" -type "string" "skinScattering";
	setAttr ".skinScattering_Type" -type "string" "float";
	setAttr -k on ".skinScattering" 0.43700000643730164;
	setAttr ".shadowBlur_Name" -type "string" "shadowBlur";
	setAttr ".shadowBlur_Type" -type "string" "float";
	setAttr -k on ".shadowBlur" 1;
	setAttr ".shadowDither_Name" -type "string" "shadowDither";
	setAttr ".shadowDither_Type" -type "string" "float";
	setAttr -k on ".shadowDither" 0.086999997496604919;
	setAttr ".shadowScattering_Name" -type "string" "shadowScattering";
	setAttr ".shadowScattering_Type" -type "string" "float";
	setAttr -k on ".shadowScattering" 1;
	setAttr ".shadowSaturation_Name" -type "string" "shadowSaturation";
	setAttr ".shadowSaturation_Type" -type "string" "float";
	setAttr -k on ".shadowSaturation" 1.2740000486373901;
	setAttr ".BackScatteringThicknessTexture_Name" -type "string" "BackScatteringThicknessTexture";
	setAttr ".BackScatteringThicknessTexture_Type" -type "string" "texture";
	setAttr ".BackScatteringThicknessTexture" -type "float3" 0 0 0 ;
	setAttr ".skinScatteringRoughness_Name" -type "string" "skinScatteringRoughness";
	setAttr ".skinScatteringRoughness_Type" -type "string" "float";
	setAttr -k on ".skinScatteringRoughness" 1;
	setAttr ".skinScatteringOuterColor_Name" -type "string" "skinScatteringOuterColor";
	setAttr ".skinScatteringOuterColor_Type" -type "string" "color1x3";
	setAttr -k on ".skinScatteringOuterColor" -type "float3" 0.39607844 0.039215688 
		0 ;
	setAttr ".skinScatteringAmount_Name" -type "string" "skinScatteringAmount";
	setAttr ".skinScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinScatteringAmount" 0.57599997520446777;
	setAttr ".skinAmbientScatteringAmount_Name" -type "string" "skinAmbientScatteringAmount";
	setAttr ".skinAmbientScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinAmbientScatteringAmount" 2.1779999732971191;
	setAttr ".UseSpecularTextureAlpha_Name" -type "string" "UseSpecularTextureAlpha";
	setAttr ".UseSpecularTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTextureAlpha" no;
	setAttr ".LobeMix_Name" -type "string" "LobeMix";
	setAttr ".LobeMix_Type" -type "string" "float";
	setAttr -k on ".LobeMix" 0.6940000057220459;
	setAttr ".Roughness_Name" -type "string" "Roughness";
	setAttr ".Roughness_Type" -type "string" "float";
	setAttr -k on ".Roughness" 0.17000000178813934;
	setAttr ".OcclusionTexture_Name" -type "string" "OcclusionTexture";
	setAttr ".OcclusionTexture_Type" -type "string" "texture";
	setAttr ".OcclusionTexture" -type "float3" 0 0 0 ;
	setAttr ".OcclusionAmount_Name" -type "string" "OcclusionAmount";
	setAttr ".OcclusionAmount_Type" -type "string" "float";
	setAttr -k on ".OcclusionAmount" 0.5;
	setAttr ".UseCavityTexture_Name" -type "string" "UseCavityTexture";
	setAttr ".UseCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseCavityTexture" no;
	setAttr ".CavityTexture_Name" -type "string" "CavityTexture";
	setAttr ".CavityTexture_Type" -type "string" "texture";
	setAttr ".CavityTexture" -type "float3" 0 0 0 ;
	setAttr ".CavityAmount_Name" -type "string" "CavityAmount";
	setAttr ".CavityAmount_Type" -type "string" "float";
	setAttr -k on ".CavityAmount" 1;
	setAttr ".UseMicroCavityTexture_Name" -type "string" "UseMicroCavityTexture";
	setAttr ".UseMicroCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroCavityTexture" no;
	setAttr ".MicroCavityTexture_Name" -type "string" "MicroCavityTexture";
	setAttr ".MicroCavityTexture_Type" -type "string" "texture";
	setAttr ".MicroCavityTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroCavityAmount_Name" -type "string" "MicroCavityAmount";
	setAttr ".MicroCavityAmount_Type" -type "string" "float";
	setAttr -k on ".MicroCavityAmount" 1;
	setAttr ".UseMicroNormalTexture_Name" -type "string" "UseMicroNormalTexture";
	setAttr ".UseMicroNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroNormalTexture" no;
	setAttr ".MicroNormalTexture_Name" -type "string" "MicroNormalTexture";
	setAttr ".MicroNormalTexture_Type" -type "string" "texture";
	setAttr ".MicroNormalTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroNormalHeight_Name" -type "string" "MicroNormalHeight";
	setAttr ".MicroNormalHeight_Type" -type "string" "float";
	setAttr -k on ".MicroNormalHeight" 1;
	setAttr ".MicroScale_Name" -type "string" "MicroScale";
	setAttr ".MicroScale_Type" -type "string" "float";
	setAttr -k on ".MicroScale" 32;
	setAttr ".UseBlendTexture_Name" -type "string" "UseBlendTexture";
	setAttr ".UseBlendTexture_Type" -type "string" "bool";
	setAttr -k on ".UseBlendTexture" no;
	setAttr ".OcclusionTexcoord_Name" -type "string" "OcclusionTexcoord";
	setAttr ".OcclusionTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OcclusionTexcoord" 1;
	setAttr ".Position_Name" -type "string" "Position";
	setAttr ".Position_Source" -type "string" "position";
	setAttr ".TexCoord0_Name" -type "string" "TexCoord0";
	setAttr ".TexCoord0_Source" -type "string" "uv:map1";
	setAttr ".TexCoord0_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord1_Name" -type "string" "TexCoord1";
	setAttr ".TexCoord1_Source" -type "string" "uv:map2";
	setAttr ".TexCoord1_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord2_Name" -type "string" "TexCoord2";
	setAttr ".TexCoord2_Source" -type "string" "uv:map3";
	setAttr ".TexCoord2_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".Normal_Name" -type "string" "Normal";
	setAttr ".Normal_Source" -type "string" "normal";
	setAttr ".Binormal0_Name" -type "string" "Binormal0";
	setAttr ".Binormal0_Source" -type "string" "binormal:map1";
	setAttr ".Tangent0_Name" -type "string" "Tangent0";
	setAttr ".Tangent0_Source" -type "string" "tangent:map1";
createNode shadingEngine -n "shader_teeth_shaderSG";
	rename -uid "51CB22C4-43CA-9103-CBF3-74B388A08266";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "7ED32CAE-4E47-D908-0D6D-4A99A34A453F";
createNode blinn -n "shader_saliva_shader";
	rename -uid "F274448E-485C-FB4F-9DD5-6691A33FEB35";
	setAttr ".it" -type "float3" 0.89999998 0.89999998 0.89999998 ;
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".ec" 0.20000000298023224;
	setAttr ".sro" 0.20000000298023224;
createNode shadingEngine -n "shader_saliva_shaderSG";
	rename -uid "D419A0A6-42AE-5436-DC24-4AAE57B3B70A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "A49D0A41-46BA-F304-EFF0-88A96FA4DE2A";
createNode dx11Shader -n "shader_eyeLeft_shader";
	rename -uid "7E8AE3FD-4462-FB83-0A75-24A62904BD10";
	addAttr -s false -is true -ci true -k true -sn "te" -ln "techniqueEnum" -nn "Technique" 
		-ct "HW_shader_parameter" -min 0 -max 2 -en "TessellationOFF" -at "enum";
	addAttr -ci true -sn "Light_0_use_implicit_lighting" -ln "Light_0_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_0_connected_light" -ln "Light_0_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_1_use_implicit_lighting" -ln "Light_1_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_1_connected_light" -ln "Light_1_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_2_use_implicit_lighting" -ln "Light_2_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_2_connected_light" -ln "Light_2_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Name" -ln "SuperFilterTaps_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Type" -ln "SuperFilterTaps_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps" -ln "SuperFilterTaps" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "SuperFilterTapsX" -ln "SuperFilterTapsX" -ct "HW_shader_parameter" 
		-dv -0.84052002429962158 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -sn "SuperFilterTapsY" -ln "SuperFilterTapsY" -ct "HW_shader_parameter" 
		-dv -0.073954001069068909 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Name" -ln "shadowMapTexelSize_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Type" -ln "shadowMapTexelSize_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize" -ln "shadowMapTexelSize" 
		-ct "HW_shader_parameter" -dv 0.0019531298894435167 -smn 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Name" -ln "LinearSpaceLighting_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Type" -ln "LinearSpaceLighting_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "LinearSpaceLighting" -ln "LinearSpaceLighting" 
		-nn "Linear Space Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseShadows_Name" -ln "UseShadows_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "UseShadows_Type" -ln "UseShadows_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "UseShadows" -ln "UseShadows" -nn "Shadows" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Name" -ln "shadowMultiplier_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Type" -ln "shadowMultiplier_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowMultiplier" -ln "shadowMultiplier" 
		-nn "Shadow Strength" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Name" -ln "IsSwatchRender_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Type" -ln "IsSwatchRender_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender" -ln "IsSwatchRender" -ct "HW_shader_parameter" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Name" -ln "shadowDepthBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Type" -ln "shadowDepthBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDepthBias" -ln "shadowDepthBias" -nn "Shadow Bias" 
		-ct "HW_shader_parameter" -dv 0.0099999997764825821 -min 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Name" -ln "MayaFullScreenGamma_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Type" -ln "MayaFullScreenGamma_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma" -ln "MayaFullScreenGamma" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Name" -ln "flipBackfaceNormals_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Type" -ln "flipBackfaceNormals_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "flipBackfaceNormals" -ln "flipBackfaceNormals" 
		-nn "Double Sided Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Enable_Name" -ln "light0Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Enable_Type" -ln "light0Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Enable" -ln "light0Enable" -nn "Enable Light 0" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Type_Name" -ln "light0Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Type_Type" -ln "light0Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Type" -ln "light0Type" -nn "Light 0 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light0Pos_Name" -ln "light0Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Pos_Type" -ln "light0Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Pos" -ln "light0Pos" -nn "Light 0 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0Color_Name" -ln "light0Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Color_Type" -ln "light0Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light0Color" -ln "light0Color" -nn "Light 0 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ColorR" -ln "light0ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorG" -ln "light0ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorB" -ln "light0ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -h true -sn "light0Intensity_Name" -ln "light0Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Intensity_Type" -ln "light0Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Intensity" -ln "light0Intensity" -nn "Light 0 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0Dir_Name" -ln "light0Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Dir_Type" -ln "light0Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Dir" -ln "light0Dir" -nn "Light 0 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Name" -ln "light0ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Type" -ln "light0ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0ConeAngle" -ln "light0ConeAngle" -nn "Light 0 Cone Angle" 
		-ct "HW_shader_parameter" -dv 0.46000000834465027 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0FallOff_Name" -ln "light0FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0FallOff_Type" -ln "light0FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0FallOff" -ln "light0FallOff" -nn "Light 0 Penumbra Angle" 
		-ct "HW_shader_parameter" -dv 0.69999998807907104 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Name" -ln "light0AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Type" -ln "light0AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0AttenScale" -ln "light0AttenScale" 
		-nn "Light 0 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Name" -ln "light0ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Type" -ln "light0ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn" -ln "light0ShadowOn" -nn "Light 0 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Enable_Name" -ln "light1Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Enable_Type" -ln "light1Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Enable" -ln "light1Enable" -nn "Enable Light 1" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Type_Name" -ln "light1Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Type_Type" -ln "light1Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Type" -ln "light1Type" -nn "Light 1 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light1Pos_Name" -ln "light1Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Pos_Type" -ln "light1Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Pos" -ln "light1Pos" -nn "Light 1 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1Color_Name" -ln "light1Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Color_Type" -ln "light1Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light1Color" -ln "light1Color" -nn "Light 1 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ColorR" -ln "light1ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorG" -ln "light1ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorB" -ln "light1ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -h true -sn "light1Intensity_Name" -ln "light1Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Intensity_Type" -ln "light1Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Intensity" -ln "light1Intensity" -nn "Light 1 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1Dir_Name" -ln "light1Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Dir_Type" -ln "light1Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Dir" -ln "light1Dir" -nn "Light 1 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Name" -ln "light1ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Type" -ln "light1ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1ConeAngle" -ln "light1ConeAngle" -nn "Light 1 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1FallOff_Name" -ln "light1FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1FallOff_Type" -ln "light1FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1FallOff" -ln "light1FallOff" -nn "Light 1 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Name" -ln "light1AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Type" -ln "light1AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1AttenScale" -ln "light1AttenScale" 
		-nn "Light 1 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Name" -ln "light1ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Type" -ln "light1ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn" -ln "light1ShadowOn" -nn "Light 1 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Enable_Name" -ln "light2Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Enable_Type" -ln "light2Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Enable" -ln "light2Enable" -nn "Enable Light 2" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Type_Name" -ln "light2Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Type_Type" -ln "light2Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Type" -ln "light2Type" -nn "Light 2 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light2Pos_Name" -ln "light2Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Pos_Type" -ln "light2Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Pos" -ln "light2Pos" -nn "Light 2 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2Color_Name" -ln "light2Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Color_Type" -ln "light2Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light2Color" -ln "light2Color" -nn "Light 2 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ColorR" -ln "light2ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorG" -ln "light2ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorB" -ln "light2ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -h true -sn "light2Intensity_Name" -ln "light2Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Intensity_Type" -ln "light2Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Intensity" -ln "light2Intensity" -nn "Light 2 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2Dir_Name" -ln "light2Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Dir_Type" -ln "light2Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Dir" -ln "light2Dir" -nn "Light 2 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Name" -ln "light2ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Type" -ln "light2ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2ConeAngle" -ln "light2ConeAngle" -nn "Light 2 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2FallOff_Name" -ln "light2FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2FallOff_Type" -ln "light2FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2FallOff" -ln "light2FallOff" -nn "Light 2 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Name" -ln "light2AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Type" -ln "light2AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2AttenScale" -ln "light2AttenScale" 
		-nn "Light 2 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Name" -ln "light2ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Type" -ln "light2ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn" -ln "light2ShadowOn" -nn "Light 2 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Name" -ln "UseAmbientOcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Type" -ln "UseAmbientOcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseAmbientOcclusionTexture" -ln "UseAmbientOcclusionTexture" 
		-nn "Use Occlusion Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Name" -ln "transpDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Type" -ln "transpDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "transpDepthTexture" -ln "transpDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "transpDepthTextureR" -ln "transpDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureG" -ln "transpDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureB" -ln "transpDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Name" -ln "opaqueDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Type" -ln "opaqueDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "opaqueDepthTexture" -ln "opaqueDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "opaqueDepthTextureR" -ln "opaqueDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureG" -ln "opaqueDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureB" -ln "opaqueDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Name" -ln "UseDiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Type" -ln "UseDiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTexture" -ln "UseDiffuseTexture" 
		-nn "Use Diffuse Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Name" -ln "UseDiffuseTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Type" -ln "UseDiffuseTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTextureAlpha" -ln "UseDiffuseTextureAlpha" 
		-nn "Use Diffuse Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Name" -ln "DiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Type" -ln "DiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseTexture" -ln "DiffuseTexture" -nn "Diffuse Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseTextureR" -ln "DiffuseTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureG" -ln "DiffuseTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureB" -ln "DiffuseTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Name" -ln "DiffuseColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Type" -ln "DiffuseColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "DiffuseColor" -ln "DiffuseColor" -nn "Diffuse Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseColorR" -ln "DiffuseColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorG" -ln "DiffuseColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorB" -ln "DiffuseColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -h true -sn "Opacity_Name" -ln "Opacity_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Opacity_Type" -ln "Opacity_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Opacity" -ln "Opacity" -nn "Opacity" -ct "HW_shader_parameter" 
		-dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Name" -ln "UseOpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Type" -ln "UseOpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseOpacityMaskTexture" -ln "UseOpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Name" -ln "OpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Type" -ln "OpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OpacityMaskTexture" -ln "OpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OpacityMaskTextureR" -ln "OpacityMaskTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureG" -ln "OpacityMaskTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureB" -ln "OpacityMaskTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Name" -ln "OpacityMaskBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Type" -ln "OpacityMaskBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskBias" -ln "OpacityMaskBias" -nn "Opacity Mask Bias" 
		-ct "HW_shader_parameter" -dv 0.10000000149011612 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Name" -ln "UseSpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Type" -ln "UseSpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTexture" -ln "UseSpecularTexture" 
		-nn "Use Specular Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Name" -ln "SpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Type" -ln "SpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularTexture" -ln "SpecularTexture" -nn "Specular Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularTextureR" -ln "SpecularTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureG" -ln "SpecularTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureB" -ln "SpecularTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -h true -sn "SpecularColor_Name" -ln "SpecularColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularColor_Type" -ln "SpecularColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "SpecularColor" -ln "SpecularColor" -nn "Specular Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularColorR" -ln "SpecularColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorG" -ln "SpecularColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorB" -ln "SpecularColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Name" -ln "UseNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Type" -ln "UseNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseNormalTexture" -ln "UseNormalTexture" 
		-nn "Use Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalTexture_Name" -ln "NormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexture_Type" -ln "NormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "NormalTexture" -ln "NormalTexture" -nn "Normal Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "NormalTextureR" -ln "NormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureG" -ln "NormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureB" -ln "NormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -h true -sn "NormalHeight_Name" -ln "NormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalHeight_Type" -ln "NormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalHeight" -ln "NormalHeight" -nn "Normal Height" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 5 -at "float";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Name" -ln "SupportNonUniformScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Type" -ln "SupportNonUniformScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SupportNonUniformScale" -ln "SupportNonUniformScale" 
		-nn "Support Non-Uniform Scale" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Name" -ln "NormalCoordsysX_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Type" -ln "NormalCoordsysX_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysX" -ln "NormalCoordsysX" -nn "Normal X (Red)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Name" -ln "NormalCoordsysY_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Type" -ln "NormalCoordsysY_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysY" -ln "NormalCoordsysY" -nn "Normal Y (Green)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Name" -ln "DisplacementModel_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Type" -ln "DisplacementModel_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementModel" -ln "DisplacementModel" 
		-nn "Displacement Model" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en 
		"Grayscale:Tangent Vector" -at "enum";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Name" -ln "UseDisplacementMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Type" -ln "UseDisplacementMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDisplacementMap" -ln "UseDisplacementMap" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Name" -ln "DisplacementTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Type" -ln "DisplacementTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DisplacementTexture" -ln "DisplacementTexture" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DisplacementTextureR" -ln "DisplacementTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureG" -ln "DisplacementTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureB" -ln "DisplacementTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Name" -ln "VectorDisplacementCoordSys_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Type" -ln "VectorDisplacementCoordSys_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "VectorDisplacementCoordSys" -ln "VectorDisplacementCoordSys" 
		-nn "Displacement Coordsys" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 
		-en "Mudbox (XZY):Maya (XYZ)" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Name" -ln "DisplacementHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Type" -ln "DisplacementHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementHeight" -ln "DisplacementHeight" 
		-nn "Displacement Height" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Name" -ln "DisplacementOffset_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Type" -ln "DisplacementOffset_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementOffset" -ln "DisplacementOffset" 
		-nn "Displacement Offset" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn -1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Name" -ln "DisplacementClippingBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Type" -ln "DisplacementClippingBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementClippingBias" -ln "DisplacementClippingBias" 
		-nn "Displacement Clipping Bias" -ct "HW_shader_parameter" -dv 5 -min -99999 -max 
		99999 -smn 0 -smx 99 -at "float";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Name" -ln "BBoxExtraScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Type" -ln "BBoxExtraScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "BBoxExtraScale" -ln "BBoxExtraScale" -nn "Bounding Box Extra Scale" 
		-ct "HW_shader_parameter" -dv 1 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationRange_Name" -ln "TessellationRange_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationRange_Type" -ln "TessellationRange_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationRange" -ln "TessellationRange" 
		-nn "Tessellation Range" -ct "HW_shader_parameter" -min 0 -max 99999 -smx 999 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationMin_Name" -ln "TessellationMin_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationMin_Type" -ln "TessellationMin_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationMin" -ln "TessellationMin" -nn "Tessellation Minimum" 
		-ct "HW_shader_parameter" -dv 3 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Name" -ln "FlatTessellation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Type" -ln "FlatTessellation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "FlatTessellation" -ln "FlatTessellation" 
		-nn "Flat Tessellation" -ct "HW_shader_parameter" -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Name" -ln "UseTranslucency_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Type" -ln "UseTranslucency_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseTranslucency" -ln "UseTranslucency" -nn "Back Scattering" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Name" -ln "UseThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Type" -ln "UseThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseThicknessTexture" -ln "UseThicknessTexture" 
		-nn "Use Thickness Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Name" -ln "UseDiffuseIBLMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Type" -ln "UseDiffuseIBLMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseIBLMap" -ln "UseDiffuseIBLMap" 
		-nn "Use Diffuse Cubemap" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Name" -ln "DiffuseIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Type" -ln "DiffuseIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseIBLIntensity" -ln "DiffuseIBLIntensity" 
		-nn "Diffuse IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Name" -ln "DiffuseTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Type" -ln "DiffuseTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseTexcoord" -ln "DiffuseTexcoord" -nn "Diffuse Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Name" -ln "OpacityMaskTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Type" -ln "OpacityMaskTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskTexcoord" -ln "OpacityMaskTexcoord" 
		-nn "Opacity Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Name" -ln "SpecularTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Type" -ln "SpecularTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularTexcoord" -ln "SpecularTexcoord" 
		-nn "Specular Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Name" -ln "NormalTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Type" -ln "NormalTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalTexcoord" -ln "NormalTexcoord" -nn "Normal Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Name" -ln "DisplacementTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Type" -ln "DisplacementTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementTexcoord" -ln "DisplacementTexcoord" 
		-nn "Displacement Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en 
		"TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Name" -ln "ThicknessTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Type" -ln "ThicknessTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "ThicknessTexcoord" -ln "ThicknessTexcoord" 
		-nn "Translucency Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 
		-en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Name" -ln "light0ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Type" -ln "light0ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light0ShadowMap" -ln "light0ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ShadowMapR" -ln "light0ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapG" -ln "light0ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapB" -ln "light0ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Name" -ln "light1ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Type" -ln "light1ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light1ShadowMap" -ln "light1ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ShadowMapR" -ln "light1ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapG" -ln "light1ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapB" -ln "light1ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Name" -ln "light2ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Type" -ln "light2ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light2ShadowMap" -ln "light2ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ShadowMapR" -ln "light2ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapG" -ln "light2ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapB" -ln "light2ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -h true -sn "screenSize_Name" -ln "screenSize_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize_Type" -ln "screenSize_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize" -ln "screenSize" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "screenSizeX" -ln "screenSizeX" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -sn "screenSizeY" -ln "screenSizeY" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -h true -sn "SkyRotation_Name" -ln "SkyRotation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SkyRotation_Type" -ln "SkyRotation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SkyRotation" -ln "SkyRotation" -nn "Sky Rotation" 
		-ct "HW_shader_parameter" -min 0 -max 99999 -smn 0 -smx 360 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Name" -ln "DiffuseCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Type" -ln "DiffuseCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseCubeIBL" -ln "DiffuseCubeIBL" -nn "Diffuse Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseCubeIBLR" -ln "DiffuseCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLG" -ln "DiffuseCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLB" -ln "DiffuseCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Name" -ln "UseSpecCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Type" -ln "UseSpecCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecCubeIBL" -ln "UseSpecCubeIBL" -nn "Use Specular Cubemap" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Name" -ln "SpecularIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Type" -ln "SpecularIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularIBLIntensity" -ln "SpecularIBLIntensity" 
		-nn "Specular IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Name" -ln "SpecularCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Type" -ln "SpecularCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularCubeIBL" -ln "SpecularCubeIBL" -nn "Specular Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularCubeIBLR" -ln "SpecularCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLG" -ln "SpecularCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLB" -ln "SpecularCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -h true -sn "LutTexture_Name" -ln "LutTexture_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LutTexture_Type" -ln "LutTexture_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -uac -sn "LutTexture" -ln "LutTexture" -nn "SSS LUT Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "LutTextureR" -ln "LutTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureG" -ln "LutTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureB" -ln "LutTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -h true -sn "DitherTexture_Name" -ln "DitherTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DitherTexture_Type" -ln "DitherTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DitherTexture" -ln "DitherTexture" -nn "SSS Dither Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DitherTextureR" -ln "DitherTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureG" -ln "DitherTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureB" -ln "DitherTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Name" -ln "skinCoeffX_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Type" -ln "skinCoeffX_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffX" -ln "skinCoeffX" -nn "SSS Coeffient R" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Name" -ln "skinCoeffY_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Type" -ln "skinCoeffY_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffY" -ln "skinCoeffY" -nn "SSS Coeffient G" 
		-ct "HW_shader_parameter" -dv 0.5 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Name" -ln "skinCoeffZ_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Type" -ln "skinCoeffZ_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffZ" -ln "skinCoeffZ" -nn "SSS Coeffient B" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Name" -ln "NormalBlurring_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Type" -ln "NormalBlurring_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalBlurring" -ln "NormalBlurring" -nn "SSS Softness" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Name" -ln "ScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Type" -ln "ScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "ScatteringRadiusTexture" -ln "ScatteringRadiusTexture" 
		-nn "SSS Radius Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "ScatteringRadiusTextureR" -ln "ScatteringRadiusTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureG" -ln "ScatteringRadiusTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureB" -ln "ScatteringRadiusTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Name" -ln "UseScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Type" -ln "UseScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseScatteringRadiusTexture" -ln "UseScatteringRadiusTexture" 
		-nn "Use SSS Radius Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "skinScattering_Name" -ln "skinScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScattering_Type" -ln "skinScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScattering" -ln "skinScattering" -nn "SSS Radius" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowBlur_Name" -ln "shadowBlur_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "shadowBlur_Type" -ln "shadowBlur_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "shadowBlur" -ln "shadowBlur" -nn "SSS Shadow Blur" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowDither_Name" -ln "shadowDither_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDither_Type" -ln "shadowDither_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDither" -ln "shadowDither" -nn "SSS Shadow Dither" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowScattering_Name" -ln "shadowScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowScattering_Type" -ln "shadowScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowScattering" -ln "shadowScattering" 
		-nn "SSS Shadow Scattering" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Name" -ln "shadowSaturation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Type" -ln "shadowSaturation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowSaturation" -ln "shadowSaturation" 
		-nn "SSS Shadow Saturation" -ct "HW_shader_parameter" -dv 1 -min 0 -max 4 -smx 4 
		-at "float";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Name" -ln "BackScatteringThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Type" -ln "BackScatteringThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "BackScatteringThicknessTexture" -ln "BackScatteringThicknessTexture" 
		-nn "Thickness Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureR" -ln "BackScatteringThicknessTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureG" -ln "BackScatteringThicknessTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureB" -ln "BackScatteringThicknessTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Name" -ln "skinScatteringRoughness_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Type" -ln "skinScatteringRoughness_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringRoughness" -ln "skinScatteringRoughness" 
		-nn "Back Scattering Width" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Name" -ln "skinScatteringOuterColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Type" -ln "skinScatteringOuterColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "skinScatteringOuterColor" -ln "skinScatteringOuterColor" 
		-nn "Back Scattering Color" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "skinScatteringOuterColorR" -ln "skinScatteringOuterColorR" 
		-ct "HW_shader_parameter" -dv 0.25 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorG" -ln "skinScatteringOuterColorG" 
		-ct "HW_shader_parameter" -dv 0.05000000074505806 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorB" -ln "skinScatteringOuterColorB" 
		-ct "HW_shader_parameter" -dv 0.019999999552965164 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Name" -ln "skinScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Type" -ln "skinScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringAmount" -ln "skinScatteringAmount" 
		-nn "Back Scattering Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 6 -smx 6 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Name" -ln "skinAmbientScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Type" -ln "skinAmbientScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinAmbientScatteringAmount" -ln "skinAmbientScatteringAmount" 
		-nn "Back Scattering Ambient Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 
		6 -smx 6 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Name" -ln "UseSpecularTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Type" -ln "UseSpecularTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTextureAlpha" -ln "UseSpecularTextureAlpha" 
		-nn "Use Roughness Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "LobeMix_Name" -ln "LobeMix_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LobeMix_Type" -ln "LobeMix_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "LobeMix" -ln "LobeMix" -nn "Lobe Mixing" 
		-ct "HW_shader_parameter" -dv 0.75 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "Roughness_Name" -ln "Roughness_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Roughness_Type" -ln "Roughness_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Roughness" -ln "Roughness" -nn "Roughness multiplier" 
		-ct "HW_shader_parameter" -dv 0.20000000298023224 -min 0.0099999997764825821 -max 
		1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Name" -ln "OcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Type" -ln "OcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OcclusionTexture" -ln "OcclusionTexture" -nn "Ambient Occlusion Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OcclusionTextureR" -ln "OcclusionTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureG" -ln "OcclusionTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureB" -ln "OcclusionTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Name" -ln "OcclusionAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Type" -ln "OcclusionAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionAmount" -ln "OcclusionAmount" -nn "Occlusion Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Name" -ln "UseCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Type" -ln "UseCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseCavityTexture" -ln "UseCavityTexture" 
		-nn "Use Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "CavityTexture_Name" -ln "CavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityTexture_Type" -ln "CavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "CavityTexture" -ln "CavityTexture" -nn "Cavity Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "CavityTextureR" -ln "CavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureG" -ln "CavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureB" -ln "CavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -h true -sn "CavityAmount_Name" -ln "CavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityAmount_Type" -ln "CavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "CavityAmount" -ln "CavityAmount" -nn "Cavity Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Name" -ln "UseMicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Type" -ln "UseMicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroCavityTexture" -ln "UseMicroCavityTexture" 
		-nn "Use Micro Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Name" -ln "MicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Type" -ln "MicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroCavityTexture" -ln "MicroCavityTexture" 
		-nn "Micro Cavity Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroCavityTextureR" -ln "MicroCavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureG" -ln "MicroCavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureB" -ln "MicroCavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Name" -ln "MicroCavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Type" -ln "MicroCavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroCavityAmount" -ln "MicroCavityAmount" 
		-nn "Micro Cavity Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Name" -ln "UseMicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Type" -ln "UseMicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroNormalTexture" -ln "UseMicroNormalTexture" 
		-nn "Use Micro Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Name" -ln "MicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Type" -ln "MicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroNormalTexture" -ln "MicroNormalTexture" 
		-nn "Micro Normal Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroNormalTextureR" -ln "MicroNormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureG" -ln "MicroNormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureB" -ln "MicroNormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Name" -ln "MicroNormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Type" -ln "MicroNormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroNormalHeight" -ln "MicroNormalHeight" 
		-nn "Micro Normal Height" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		5 -at "float";
	addAttr -is true -ci true -h true -sn "MicroScale_Name" -ln "MicroScale_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "MicroScale_Type" -ln "MicroScale_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "MicroScale" -ln "MicroScale" -nn "Micro Scale" 
		-ct "HW_shader_parameter" -dv 32 -min 16 -max 99999 -smx 256 -at "float";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Name" -ln "UseBlendTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Type" -ln "UseBlendTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseBlendTexture" -ln "UseBlendTexture" -nn "Enable Wrinkle Mixing" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Name" -ln "OcclusionTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Type" -ln "OcclusionTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionTexcoord" -ln "OcclusionTexcoord" 
		-nn "Ambient Occlusion Map UV" -ct "HW_shader_parameter" -dv 1 -min 0 -max 2 -smn 
		0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -ci true -sn "Position" -ln "Position" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Position_Name" -ln "Position_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -h true -sn "Position_Source" -ln "Position_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -sn "Position_DefaultTexture" -ln "Position_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Position";
	addAttr -ci true -sn "TexCoord0" -ln "TexCoord0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord0_Name" -ln "TexCoord0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord0";
	addAttr -is true -ci true -h true -sn "TexCoord0_Source" -ln "TexCoord0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -is true -ci true -sn "TexCoord0_DefaultTexture" -ln "TexCoord0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -ci true -sn "TexCoord1" -ln "TexCoord1" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord1_Name" -ln "TexCoord1_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord1";
	addAttr -is true -ci true -h true -sn "TexCoord1_Source" -ln "TexCoord1_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -is true -ci true -sn "TexCoord1_DefaultTexture" -ln "TexCoord1_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -ci true -sn "TexCoord2" -ln "TexCoord2" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord2_Name" -ln "TexCoord2_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord2";
	addAttr -is true -ci true -h true -sn "TexCoord2_Source" -ln "TexCoord2_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -is true -ci true -sn "TexCoord2_DefaultTexture" -ln "TexCoord2_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -ci true -sn "Normal" -ln "Normal" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Normal_Name" -ln "Normal_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -h true -sn "Normal_Source" -ln "Normal_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -sn "Normal_DefaultTexture" -ln "Normal_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Normal";
	addAttr -ci true -sn "Binormal0" -ln "Binormal0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Binormal0_Name" -ln "Binormal0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Binormal0";
	addAttr -is true -ci true -h true -sn "Binormal0_Source" -ln "Binormal0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -is true -ci true -sn "Binormal0_DefaultTexture" -ln "Binormal0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -ci true -sn "Tangent0" -ln "Tangent0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Tangent0_Name" -ln "Tangent0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -h true -sn "Tangent0_Source" -ln "Tangent0_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -sn "Tangent0_DefaultTexture" -ln "Tangent0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Tangent0";
	setAttr ".vpar" -type "stringArray" 7 "Position" "TexCoord0" "TexCoord1" "TexCoord2" "Normal" "Binormal0" "Tangent0"  ;
	setAttr ".upar" -type "stringArray" 124 "SuperFilterTaps" "shadowMapTexelSize" "IsSwatchRender" "screenSize" "MayaFullScreenGamma" "light0Enable" "light0Type" "light0Pos" "light0Color" "light0Intensity" "light0Dir" "light0ConeAngle" "light0FallOff" "light0AttenScale" "light0ShadowOn" "light1Enable" "light1Type" "light1Pos" "light1Color" "light1Intensity" "light1Dir" "light1ConeAngle" "light1FallOff" "light1AttenScale" "light1ShadowOn" "light2Enable" "light2Type" "light2Pos" "light2Color" "light2Intensity" "light2Dir" "light2ConeAngle" "light2FallOff" "light2AttenScale" "light2ShadowOn" "LinearSpaceLighting" "UseShadows" "shadowMultiplier" "shadowDepthBias" "flipBackfaceNormals" "SkyRotation" "UseDiffuseIBLMap" "DiffuseIBLIntensity" "DiffuseCubeIBL" "UseSpecCubeIBL" "SpecularIBLIntensity" "SpecularCubeIBL" "transpDepthTexture" "opaqueDepthTexture" "UseDiffuseTexture" "UseDiffuseTextureAlpha" "DiffuseTexture" "DiffuseColor" "LutTexture" "DitherTexture" "skinCoeffX" "skinCoeffY" "skinCoeffZ" "NormalBlurring" "UseScatteringRadiusTexture" "ScatteringRadiusTexture" "skinScattering" "shadowBlur" "shadowDither" "shadowScattering" "shadowSaturation" "UseTranslucency" "BackScatteringThicknessTexture" "UseThicknessTexture" "skinScatteringRoughness" "skinScatteringOuterColor" "skinScatteringAmount" "skinAmbientScatteringAmount" "UseSpecularTextureAlpha" "UseSpecularTexture" "SpecularTexture" "SpecularColor" "LobeMix" "Roughness" "UseAmbientOcclusionTexture" "OcclusionTexture" "OcclusionAmount" "UseCavityTexture" "CavityTexture" "CavityAmount" "UseNormalTexture" "NormalTexture" "NormalHeight" "SupportNonUniformScale" "NormalCoordsysX" "NormalCoordsysY" "UseMicroCavityTexture" "MicroCavityTexture" "MicroCavityAmount" "UseMicroNormalTexture" "MicroNormalTexture" "MicroNormalHeight" "MicroScale" "OpacityMaskTexture" "Opacity" "UseOpacityMaskTexture" "OpacityMaskBias" "DisplacementModel" "UseDisplacementMap" "DisplacementTexture" "VectorDisplacementCoordSys" "DisplacementHeight" "DisplacementOffset" "DisplacementClippingBias" "BBoxExtraScale" "TessellationRange" "TessellationMin" "FlatTessellation" "UseBlendTexture" "DiffuseTexcoord" "OcclusionTexcoord" "OpacityMaskTexcoord" "SpecularTexcoord" "NormalTexcoord" "DisplacementTexcoord" "ThicknessTexcoord" "light0ShadowMap" "light1ShadowMap" "light2ShadowMap"  ;
	setAttr ".s" -type "string" "$PROJECT_ROOT/Common/SourceAssets/shaders/dx11_shd_eyeLeft.fx";
	setAttr ".t" -type "string" "TessellationOFF";
	setAttr ".SuperFilterTaps_Name" -type "string" "SuperFilterTaps";
	setAttr ".SuperFilterTaps_Type" -type "string" "float1x2";
	setAttr ".SuperFilterTaps" -type "float2" -0.84052002 -0.073954001 ;
	setAttr ".shadowMapTexelSize_Name" -type "string" "shadowMapTexelSize";
	setAttr ".shadowMapTexelSize_Type" -type "string" "float";
	setAttr ".shadowMapTexelSize" 0.0019531298894435167;
	setAttr ".LinearSpaceLighting_Name" -type "string" "LinearSpaceLighting";
	setAttr ".LinearSpaceLighting_Type" -type "string" "bool";
	setAttr -k on ".LinearSpaceLighting" yes;
	setAttr ".UseShadows_Name" -type "string" "UseShadows";
	setAttr ".UseShadows_Type" -type "string" "bool";
	setAttr -k on ".UseShadows" yes;
	setAttr ".shadowMultiplier_Name" -type "string" "shadowMultiplier";
	setAttr ".shadowMultiplier_Type" -type "string" "float";
	setAttr -k on ".shadowMultiplier" 1;
	setAttr ".IsSwatchRender_Name" -type "string" "IsSwatchRender";
	setAttr ".IsSwatchRender_Type" -type "string" "bool";
	setAttr ".IsSwatchRender" no;
	setAttr ".shadowDepthBias_Name" -type "string" "shadowDepthBias";
	setAttr ".shadowDepthBias_Type" -type "string" "float";
	setAttr -k on ".shadowDepthBias" 0.0099999997764825821;
	setAttr ".MayaFullScreenGamma_Name" -type "string" "MayaFullScreenGamma";
	setAttr ".MayaFullScreenGamma_Type" -type "string" "bool";
	setAttr ".MayaFullScreenGamma" no;
	setAttr ".flipBackfaceNormals_Name" -type "string" "flipBackfaceNormals";
	setAttr ".flipBackfaceNormals_Type" -type "string" "bool";
	setAttr -k on ".flipBackfaceNormals" yes;
	setAttr ".light0Enable_Name" -type "string" "light0Enable";
	setAttr ".light0Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light0Enable" no;
	setAttr ".light0Type_Name" -type "string" "light0Type";
	setAttr ".light0Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light0Type" 2;
	setAttr ".light0Pos_Name" -type "string" "light0Pos";
	setAttr ".light0Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 100 1;
	setAttr ".light0Color_Name" -type "string" "light0Color";
	setAttr ".light0Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light0Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light0Color";
	setAttr ".light0Intensity_Name" -type "string" "light0Intensity";
	setAttr ".light0Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light0Intensity" 1;
	setAttr ".light0Dir_Name" -type "string" "light0Dir";
	setAttr ".light0Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light0ConeAngle_Name" -type "string" "light0ConeAngle";
	setAttr ".light0ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light0ConeAngle" 0.46000000834465027;
	setAttr ".light0FallOff_Name" -type "string" "light0FallOff";
	setAttr ".light0FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light0FallOff" 0.69999998807907104;
	setAttr ".light0AttenScale_Name" -type "string" "light0AttenScale";
	setAttr ".light0AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light0AttenScale" 0;
	setAttr ".light0ShadowOn_Name" -type "string" "light0ShadowOn";
	setAttr ".light0ShadowOn_Type" -type "string" "bool";
	setAttr ".light0ShadowOn" yes;
	setAttr ".light1Enable_Name" -type "string" "light1Enable";
	setAttr ".light1Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light1Enable" no;
	setAttr ".light1Type_Name" -type "string" "light1Type";
	setAttr ".light1Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light1Type" 2;
	setAttr ".light1Pos_Name" -type "string" "light1Pos";
	setAttr ".light1Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -100 100 100 1;
	setAttr ".light1Color_Name" -type "string" "light1Color";
	setAttr ".light1Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light1Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light1Color";
	setAttr ".light1Intensity_Name" -type "string" "light1Intensity";
	setAttr ".light1Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light1Intensity" 1;
	setAttr ".light1Dir_Name" -type "string" "light1Dir";
	setAttr ".light1Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light1ConeAngle_Name" -type "string" "light1ConeAngle";
	setAttr ".light1ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light1ConeAngle" 45;
	setAttr ".light1FallOff_Name" -type "string" "light1FallOff";
	setAttr ".light1FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light1FallOff" 0;
	setAttr ".light1AttenScale_Name" -type "string" "light1AttenScale";
	setAttr ".light1AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light1AttenScale" 0;
	setAttr ".light1ShadowOn_Name" -type "string" "light1ShadowOn";
	setAttr ".light1ShadowOn_Type" -type "string" "bool";
	setAttr ".light1ShadowOn" yes;
	setAttr ".light2Enable_Name" -type "string" "light2Enable";
	setAttr ".light2Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light2Enable" no;
	setAttr ".light2Type_Name" -type "string" "light2Type";
	setAttr ".light2Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light2Type" 2;
	setAttr ".light2Pos_Name" -type "string" "light2Pos";
	setAttr ".light2Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 -100 1;
	setAttr ".light2Color_Name" -type "string" "light2Color";
	setAttr ".light2Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light2Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light2Color";
	setAttr ".light2Intensity_Name" -type "string" "light2Intensity";
	setAttr ".light2Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light2Intensity" 1;
	setAttr ".light2Dir_Name" -type "string" "light2Dir";
	setAttr ".light2Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light2ConeAngle_Name" -type "string" "light2ConeAngle";
	setAttr ".light2ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light2ConeAngle" 45;
	setAttr ".light2FallOff_Name" -type "string" "light2FallOff";
	setAttr ".light2FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light2FallOff" 0;
	setAttr ".light2AttenScale_Name" -type "string" "light2AttenScale";
	setAttr ".light2AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light2AttenScale" 0;
	setAttr ".light2ShadowOn_Name" -type "string" "light2ShadowOn";
	setAttr ".light2ShadowOn_Type" -type "string" "bool";
	setAttr ".light2ShadowOn" yes;
	setAttr ".UseAmbientOcclusionTexture_Name" -type "string" "UseAmbientOcclusionTexture";
	setAttr ".UseAmbientOcclusionTexture_Type" -type "string" "bool";
	setAttr -k on ".UseAmbientOcclusionTexture" no;
	setAttr ".transpDepthTexture_Name" -type "string" "transpDepthTexture";
	setAttr ".transpDepthTexture_Type" -type "string" "texture";
	setAttr ".transpDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".opaqueDepthTexture_Name" -type "string" "opaqueDepthTexture";
	setAttr ".opaqueDepthTexture_Type" -type "string" "texture";
	setAttr ".opaqueDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".UseDiffuseTexture_Name" -type "string" "UseDiffuseTexture";
	setAttr ".UseDiffuseTexture_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTexture" yes;
	setAttr ".UseDiffuseTextureAlpha_Name" -type "string" "UseDiffuseTextureAlpha";
	setAttr ".UseDiffuseTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTextureAlpha" no;
	setAttr ".DiffuseTexture_Name" -type "string" "DiffuseTexture";
	setAttr ".DiffuseTexture_Type" -type "string" "texture";
	setAttr ".DiffuseTexture" -type "float3" 0 0 0 ;
	setAttr ".DiffuseColor_Name" -type "string" "DiffuseColor";
	setAttr ".DiffuseColor_Type" -type "string" "color1x3";
	setAttr -k on ".DiffuseColor" -type "float3" 1 1 1 ;
	setAttr ".Opacity_Name" -type "string" "Opacity";
	setAttr ".Opacity_Type" -type "string" "float";
	setAttr -k on ".Opacity" 1;
	setAttr ".UseOpacityMaskTexture_Name" -type "string" "UseOpacityMaskTexture";
	setAttr ".UseOpacityMaskTexture_Type" -type "string" "bool";
	setAttr -k on ".UseOpacityMaskTexture" no;
	setAttr ".OpacityMaskTexture_Name" -type "string" "OpacityMaskTexture";
	setAttr ".OpacityMaskTexture_Type" -type "string" "texture";
	setAttr ".OpacityMaskTexture" -type "float3" 0 0 0 ;
	setAttr ".OpacityMaskBias_Name" -type "string" "OpacityMaskBias";
	setAttr ".OpacityMaskBias_Type" -type "string" "float";
	setAttr -k on ".OpacityMaskBias" 0.10000000149011612;
	setAttr ".UseSpecularTexture_Name" -type "string" "UseSpecularTexture";
	setAttr ".UseSpecularTexture_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTexture" no;
	setAttr ".SpecularTexture_Name" -type "string" "SpecularTexture";
	setAttr ".SpecularTexture_Type" -type "string" "texture";
	setAttr ".SpecularTexture" -type "float3" 0 0 0 ;
	setAttr ".SpecularColor_Name" -type "string" "SpecularColor";
	setAttr ".SpecularColor_Type" -type "string" "color1x3";
	setAttr -k on ".SpecularColor" -type "float3" 1 1 1 ;
	setAttr ".UseNormalTexture_Name" -type "string" "UseNormalTexture";
	setAttr ".UseNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseNormalTexture" yes;
	setAttr ".NormalTexture_Name" -type "string" "NormalTexture";
	setAttr ".NormalTexture_Type" -type "string" "texture";
	setAttr ".NormalTexture" -type "float3" 0 0 0 ;
	setAttr ".NormalHeight_Name" -type "string" "NormalHeight";
	setAttr ".NormalHeight_Type" -type "string" "float";
	setAttr -k on ".NormalHeight" 0.5;
	setAttr ".SupportNonUniformScale_Name" -type "string" "SupportNonUniformScale";
	setAttr ".SupportNonUniformScale_Type" -type "string" "bool";
	setAttr -k on ".SupportNonUniformScale" yes;
	setAttr ".NormalCoordsysX_Name" -type "string" "NormalCoordsysX";
	setAttr ".NormalCoordsysX_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysX" 0;
	setAttr ".NormalCoordsysY_Name" -type "string" "NormalCoordsysY";
	setAttr ".NormalCoordsysY_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysY" 0;
	setAttr ".DisplacementModel_Name" -type "string" "DisplacementModel";
	setAttr ".DisplacementModel_Type" -type "string" "enum";
	setAttr -k on ".DisplacementModel" 0;
	setAttr ".UseDisplacementMap_Name" -type "string" "UseDisplacementMap";
	setAttr ".UseDisplacementMap_Type" -type "string" "bool";
	setAttr -k on ".UseDisplacementMap" no;
	setAttr ".DisplacementTexture_Name" -type "string" "DisplacementTexture";
	setAttr ".DisplacementTexture_Type" -type "string" "texture";
	setAttr ".DisplacementTexture" -type "float3" 0 0 0 ;
	setAttr ".VectorDisplacementCoordSys_Name" -type "string" "VectorDisplacementCoordSys";
	setAttr ".VectorDisplacementCoordSys_Type" -type "string" "enum";
	setAttr -k on ".VectorDisplacementCoordSys" 0;
	setAttr ".DisplacementHeight_Name" -type "string" "DisplacementHeight";
	setAttr ".DisplacementHeight_Type" -type "string" "float";
	setAttr -k on ".DisplacementHeight" 0.5;
	setAttr ".DisplacementOffset_Name" -type "string" "DisplacementOffset";
	setAttr ".DisplacementOffset_Type" -type "string" "float";
	setAttr -k on ".DisplacementOffset" 0.5;
	setAttr ".DisplacementClippingBias_Name" -type "string" "DisplacementClippingBias";
	setAttr ".DisplacementClippingBias_Type" -type "string" "float";
	setAttr -k on ".DisplacementClippingBias" 5;
	setAttr ".BBoxExtraScale_Name" -type "string" "BBoxExtraScale";
	setAttr ".BBoxExtraScale_Type" -type "string" "float";
	setAttr -k on ".BBoxExtraScale" 1;
	setAttr ".TessellationRange_Name" -type "string" "TessellationRange";
	setAttr ".TessellationRange_Type" -type "string" "float";
	setAttr -k on ".TessellationRange" 0;
	setAttr ".TessellationMin_Name" -type "string" "TessellationMin";
	setAttr ".TessellationMin_Type" -type "string" "float";
	setAttr -k on ".TessellationMin" 3;
	setAttr ".FlatTessellation_Name" -type "string" "FlatTessellation";
	setAttr ".FlatTessellation_Type" -type "string" "float";
	setAttr -k on ".FlatTessellation" 0;
	setAttr ".UseTranslucency_Name" -type "string" "UseTranslucency";
	setAttr ".UseTranslucency_Type" -type "string" "bool";
	setAttr -k on ".UseTranslucency" no;
	setAttr ".UseThicknessTexture_Name" -type "string" "UseThicknessTexture";
	setAttr ".UseThicknessTexture_Type" -type "string" "bool";
	setAttr -k on ".UseThicknessTexture" no;
	setAttr ".UseDiffuseIBLMap_Name" -type "string" "UseDiffuseIBLMap";
	setAttr ".UseDiffuseIBLMap_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseIBLMap" yes;
	setAttr ".DiffuseIBLIntensity_Name" -type "string" "DiffuseIBLIntensity";
	setAttr ".DiffuseIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".DiffuseIBLIntensity" 0.65499997138977051;
	setAttr ".DiffuseTexcoord_Name" -type "string" "DiffuseTexcoord";
	setAttr ".DiffuseTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DiffuseTexcoord" 0;
	setAttr ".OpacityMaskTexcoord_Name" -type "string" "OpacityMaskTexcoord";
	setAttr ".OpacityMaskTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OpacityMaskTexcoord" 0;
	setAttr ".SpecularTexcoord_Name" -type "string" "SpecularTexcoord";
	setAttr ".SpecularTexcoord_Type" -type "string" "enum";
	setAttr -k on ".SpecularTexcoord" 0;
	setAttr ".NormalTexcoord_Name" -type "string" "NormalTexcoord";
	setAttr ".NormalTexcoord_Type" -type "string" "enum";
	setAttr -k on ".NormalTexcoord" 0;
	setAttr ".DisplacementTexcoord_Name" -type "string" "DisplacementTexcoord";
	setAttr ".DisplacementTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DisplacementTexcoord" 0;
	setAttr ".ThicknessTexcoord_Name" -type "string" "ThicknessTexcoord";
	setAttr ".ThicknessTexcoord_Type" -type "string" "enum";
	setAttr -k on ".ThicknessTexcoord" 0;
	setAttr ".light0ShadowMap_Name" -type "string" "light0ShadowMap";
	setAttr ".light0ShadowMap_Type" -type "string" "texture";
	setAttr ".light0ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light1ShadowMap_Name" -type "string" "light1ShadowMap";
	setAttr ".light1ShadowMap_Type" -type "string" "texture";
	setAttr ".light1ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light2ShadowMap_Name" -type "string" "light2ShadowMap";
	setAttr ".light2ShadowMap_Type" -type "string" "texture";
	setAttr ".light2ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".screenSize_Name" -type "string" "screenSize";
	setAttr ".screenSize_Type" -type "string" "float1x2";
	setAttr ".screenSize" -type "float2" 0 0 ;
	setAttr ".SkyRotation_Name" -type "string" "SkyRotation";
	setAttr ".SkyRotation_Type" -type "string" "float";
	setAttr -k on ".SkyRotation" 12.5;
	setAttr ".DiffuseCubeIBL_Name" -type "string" "DiffuseCubeIBL";
	setAttr ".DiffuseCubeIBL_Type" -type "string" "texture";
	setAttr ".DiffuseCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".UseSpecCubeIBL_Name" -type "string" "UseSpecCubeIBL";
	setAttr ".UseSpecCubeIBL_Type" -type "string" "bool";
	setAttr -k on ".UseSpecCubeIBL" yes;
	setAttr ".SpecularIBLIntensity_Name" -type "string" "SpecularIBLIntensity";
	setAttr ".SpecularIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".SpecularIBLIntensity" 0.020999999716877937;
	setAttr ".SpecularCubeIBL_Name" -type "string" "SpecularCubeIBL";
	setAttr ".SpecularCubeIBL_Type" -type "string" "texture";
	setAttr ".SpecularCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".LutTexture_Name" -type "string" "LutTexture";
	setAttr ".LutTexture_Type" -type "string" "texture";
	setAttr ".LutTexture" -type "float3" 0 0 0 ;
	setAttr ".DitherTexture_Name" -type "string" "DitherTexture";
	setAttr ".DitherTexture_Type" -type "string" "texture";
	setAttr ".DitherTexture" -type "float3" 0 0 0 ;
	setAttr ".skinCoeffX_Name" -type "string" "skinCoeffX";
	setAttr ".skinCoeffX_Type" -type "string" "float";
	setAttr -k on ".skinCoeffX" 0.79500001668930054;
	setAttr ".skinCoeffY_Name" -type "string" "skinCoeffY";
	setAttr ".skinCoeffY_Type" -type "string" "float";
	setAttr -k on ".skinCoeffY" 0.28799998760223389;
	setAttr ".skinCoeffZ_Name" -type "string" "skinCoeffZ";
	setAttr ".skinCoeffZ_Type" -type "string" "float";
	setAttr -k on ".skinCoeffZ" 0.030999999493360519;
	setAttr ".NormalBlurring_Name" -type "string" "NormalBlurring";
	setAttr ".NormalBlurring_Type" -type "string" "float";
	setAttr -k on ".NormalBlurring" 1;
	setAttr ".ScatteringRadiusTexture_Name" -type "string" "ScatteringRadiusTexture";
	setAttr ".ScatteringRadiusTexture_Type" -type "string" "texture";
	setAttr ".ScatteringRadiusTexture" -type "float3" 0 0 0 ;
	setAttr ".UseScatteringRadiusTexture_Name" -type "string" "UseScatteringRadiusTexture";
	setAttr ".UseScatteringRadiusTexture_Type" -type "string" "bool";
	setAttr -k on ".UseScatteringRadiusTexture" no;
	setAttr ".skinScattering_Name" -type "string" "skinScattering";
	setAttr ".skinScattering_Type" -type "string" "float";
	setAttr -k on ".skinScattering" 0.43700000643730164;
	setAttr ".shadowBlur_Name" -type "string" "shadowBlur";
	setAttr ".shadowBlur_Type" -type "string" "float";
	setAttr -k on ".shadowBlur" 1;
	setAttr ".shadowDither_Name" -type "string" "shadowDither";
	setAttr ".shadowDither_Type" -type "string" "float";
	setAttr -k on ".shadowDither" 0.086999997496604919;
	setAttr ".shadowScattering_Name" -type "string" "shadowScattering";
	setAttr ".shadowScattering_Type" -type "string" "float";
	setAttr -k on ".shadowScattering" 1;
	setAttr ".shadowSaturation_Name" -type "string" "shadowSaturation";
	setAttr ".shadowSaturation_Type" -type "string" "float";
	setAttr -k on ".shadowSaturation" 1.2740000486373901;
	setAttr ".BackScatteringThicknessTexture_Name" -type "string" "BackScatteringThicknessTexture";
	setAttr ".BackScatteringThicknessTexture_Type" -type "string" "texture";
	setAttr ".BackScatteringThicknessTexture" -type "float3" 0 0 0 ;
	setAttr ".skinScatteringRoughness_Name" -type "string" "skinScatteringRoughness";
	setAttr ".skinScatteringRoughness_Type" -type "string" "float";
	setAttr -k on ".skinScatteringRoughness" 1;
	setAttr ".skinScatteringOuterColor_Name" -type "string" "skinScatteringOuterColor";
	setAttr ".skinScatteringOuterColor_Type" -type "string" "color1x3";
	setAttr -k on ".skinScatteringOuterColor" -type "float3" 0.39607844 0.039215688 
		0 ;
	setAttr ".skinScatteringAmount_Name" -type "string" "skinScatteringAmount";
	setAttr ".skinScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinScatteringAmount" 0.57599997520446777;
	setAttr ".skinAmbientScatteringAmount_Name" -type "string" "skinAmbientScatteringAmount";
	setAttr ".skinAmbientScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinAmbientScatteringAmount" 2.1779999732971191;
	setAttr ".UseSpecularTextureAlpha_Name" -type "string" "UseSpecularTextureAlpha";
	setAttr ".UseSpecularTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTextureAlpha" no;
	setAttr ".LobeMix_Name" -type "string" "LobeMix";
	setAttr ".LobeMix_Type" -type "string" "float";
	setAttr -k on ".LobeMix" 0.77100002765655518;
	setAttr ".Roughness_Name" -type "string" "Roughness";
	setAttr ".Roughness_Type" -type "string" "float";
	setAttr -k on ".Roughness" 0.31000000238418579;
	setAttr ".OcclusionTexture_Name" -type "string" "OcclusionTexture";
	setAttr ".OcclusionTexture_Type" -type "string" "texture";
	setAttr ".OcclusionTexture" -type "float3" 0 0 0 ;
	setAttr ".OcclusionAmount_Name" -type "string" "OcclusionAmount";
	setAttr ".OcclusionAmount_Type" -type "string" "float";
	setAttr -k on ".OcclusionAmount" 0.5;
	setAttr ".UseCavityTexture_Name" -type "string" "UseCavityTexture";
	setAttr ".UseCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseCavityTexture" no;
	setAttr ".CavityTexture_Name" -type "string" "CavityTexture";
	setAttr ".CavityTexture_Type" -type "string" "texture";
	setAttr ".CavityTexture" -type "float3" 0 0 0 ;
	setAttr ".CavityAmount_Name" -type "string" "CavityAmount";
	setAttr ".CavityAmount_Type" -type "string" "float";
	setAttr -k on ".CavityAmount" 1;
	setAttr ".UseMicroCavityTexture_Name" -type "string" "UseMicroCavityTexture";
	setAttr ".UseMicroCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroCavityTexture" no;
	setAttr ".MicroCavityTexture_Name" -type "string" "MicroCavityTexture";
	setAttr ".MicroCavityTexture_Type" -type "string" "texture";
	setAttr ".MicroCavityTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroCavityAmount_Name" -type "string" "MicroCavityAmount";
	setAttr ".MicroCavityAmount_Type" -type "string" "float";
	setAttr -k on ".MicroCavityAmount" 1;
	setAttr ".UseMicroNormalTexture_Name" -type "string" "UseMicroNormalTexture";
	setAttr ".UseMicroNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroNormalTexture" no;
	setAttr ".MicroNormalTexture_Name" -type "string" "MicroNormalTexture";
	setAttr ".MicroNormalTexture_Type" -type "string" "texture";
	setAttr ".MicroNormalTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroNormalHeight_Name" -type "string" "MicroNormalHeight";
	setAttr ".MicroNormalHeight_Type" -type "string" "float";
	setAttr -k on ".MicroNormalHeight" 1;
	setAttr ".MicroScale_Name" -type "string" "MicroScale";
	setAttr ".MicroScale_Type" -type "string" "float";
	setAttr -k on ".MicroScale" 32;
	setAttr ".UseBlendTexture_Name" -type "string" "UseBlendTexture";
	setAttr ".UseBlendTexture_Type" -type "string" "bool";
	setAttr -k on ".UseBlendTexture" no;
	setAttr ".OcclusionTexcoord_Name" -type "string" "OcclusionTexcoord";
	setAttr ".OcclusionTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OcclusionTexcoord" 1;
	setAttr ".Position_Name" -type "string" "Position";
	setAttr ".Position_Source" -type "string" "position";
	setAttr ".TexCoord0_Name" -type "string" "TexCoord0";
	setAttr ".TexCoord0_Source" -type "string" "uv:map1";
	setAttr ".TexCoord0_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord1_Name" -type "string" "TexCoord1";
	setAttr ".TexCoord1_Source" -type "string" "uv:map2";
	setAttr ".TexCoord1_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord2_Name" -type "string" "TexCoord2";
	setAttr ".TexCoord2_Source" -type "string" "uv:map3";
	setAttr ".TexCoord2_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".Normal_Name" -type "string" "Normal";
	setAttr ".Normal_Source" -type "string" "normal";
	setAttr ".Binormal0_Name" -type "string" "Binormal0";
	setAttr ".Binormal0_Source" -type "string" "binormal:map1";
	setAttr ".Tangent0_Name" -type "string" "Tangent0";
	setAttr ".Tangent0_Source" -type "string" "tangent:map1";
createNode shadingEngine -n "shader_eyeLeft_shaderSG";
	rename -uid "C17F754C-45B3-2D7A-7542-938BA5AA9017";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "86646D32-4A5C-56E1-D79F-6D9F200810B3";
createNode dx11Shader -n "shader_eyeRight_shader";
	rename -uid "64831609-470E-C199-3F95-E78023FAB92B";
	addAttr -s false -is true -ci true -k true -sn "te" -ln "techniqueEnum" -nn "Technique" 
		-ct "HW_shader_parameter" -min 0 -max 2 -en "TessellationOFF" -at "enum";
	addAttr -ci true -sn "Light_0_use_implicit_lighting" -ln "Light_0_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_0_connected_light" -ln "Light_0_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_1_use_implicit_lighting" -ln "Light_1_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_1_connected_light" -ln "Light_1_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -ci true -sn "Light_2_use_implicit_lighting" -ln "Light_2_use_implicit_lighting" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "Light_2_connected_light" -ln "Light_2_connected_light" 
		-ct "HW_shader_parameter" -at "message";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Name" -ln "SuperFilterTaps_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps_Type" -ln "SuperFilterTaps_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SuperFilterTaps" -ln "SuperFilterTaps" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "SuperFilterTapsX" -ln "SuperFilterTapsX" -ct "HW_shader_parameter" 
		-dv -0.84052002429962158 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -sn "SuperFilterTapsY" -ln "SuperFilterTapsY" -ct "HW_shader_parameter" 
		-dv -0.073954001069068909 -smn 0 -smx 1 -at "float" -p "SuperFilterTaps";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Name" -ln "shadowMapTexelSize_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize_Type" -ln "shadowMapTexelSize_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMapTexelSize" -ln "shadowMapTexelSize" 
		-ct "HW_shader_parameter" -dv 0.0019531298894435167 -smn 0 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Name" -ln "LinearSpaceLighting_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "LinearSpaceLighting_Type" -ln "LinearSpaceLighting_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "LinearSpaceLighting" -ln "LinearSpaceLighting" 
		-nn "Linear Space Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseShadows_Name" -ln "UseShadows_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "UseShadows_Type" -ln "UseShadows_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "UseShadows" -ln "UseShadows" -nn "Shadows" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Name" -ln "shadowMultiplier_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowMultiplier_Type" -ln "shadowMultiplier_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowMultiplier" -ln "shadowMultiplier" 
		-nn "Shadow Strength" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Name" -ln "IsSwatchRender_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender_Type" -ln "IsSwatchRender_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "IsSwatchRender" -ln "IsSwatchRender" -ct "HW_shader_parameter" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Name" -ln "shadowDepthBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDepthBias_Type" -ln "shadowDepthBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDepthBias" -ln "shadowDepthBias" -nn "Shadow Bias" 
		-ct "HW_shader_parameter" -dv 0.0099999997764825821 -min 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Name" -ln "MayaFullScreenGamma_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma_Type" -ln "MayaFullScreenGamma_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MayaFullScreenGamma" -ln "MayaFullScreenGamma" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Name" -ln "flipBackfaceNormals_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "flipBackfaceNormals_Type" -ln "flipBackfaceNormals_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "flipBackfaceNormals" -ln "flipBackfaceNormals" 
		-nn "Double Sided Lighting" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Enable_Name" -ln "light0Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Enable_Type" -ln "light0Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Enable" -ln "light0Enable" -nn "Enable Light 0" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light0Type_Name" -ln "light0Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Type_Type" -ln "light0Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Type" -ln "light0Type" -nn "Light 0 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light0Pos_Name" -ln "light0Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Pos_Type" -ln "light0Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Pos" -ln "light0Pos" -nn "Light 0 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0Color_Name" -ln "light0Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Color_Type" -ln "light0Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light0Color" -ln "light0Color" -nn "Light 0 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ColorR" -ln "light0ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorG" -ln "light0ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -sn "light0ColorB" -ln "light0ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light0Color";
	addAttr -is true -ci true -h true -sn "light0Intensity_Name" -ln "light0Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0Intensity_Type" -ln "light0Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0Intensity" -ln "light0Intensity" -nn "Light 0 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0Dir_Name" -ln "light0Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light0Dir_Type" -ln "light0Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light0Dir" -ln "light0Dir" -nn "Light 0 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Name" -ln "light0ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ConeAngle_Type" -ln "light0ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0ConeAngle" -ln "light0ConeAngle" -nn "Light 0 Cone Angle" 
		-ct "HW_shader_parameter" -dv 0.46000000834465027 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0FallOff_Name" -ln "light0FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0FallOff_Type" -ln "light0FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0FallOff" -ln "light0FallOff" -nn "Light 0 Penumbra Angle" 
		-ct "HW_shader_parameter" -dv 0.69999998807907104 -min 0 -max 1.5707962512969971 
		-at "float";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Name" -ln "light0AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0AttenScale_Type" -ln "light0AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light0AttenScale" -ln "light0AttenScale" 
		-nn "Light 0 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Name" -ln "light0ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn_Type" -ln "light0ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowOn" -ln "light0ShadowOn" -nn "Light 0 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Enable_Name" -ln "light1Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Enable_Type" -ln "light1Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Enable" -ln "light1Enable" -nn "Enable Light 1" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light1Type_Name" -ln "light1Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Type_Type" -ln "light1Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Type" -ln "light1Type" -nn "Light 1 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light1Pos_Name" -ln "light1Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Pos_Type" -ln "light1Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Pos" -ln "light1Pos" -nn "Light 1 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1Color_Name" -ln "light1Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Color_Type" -ln "light1Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light1Color" -ln "light1Color" -nn "Light 1 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ColorR" -ln "light1ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorG" -ln "light1ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -sn "light1ColorB" -ln "light1ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light1Color";
	addAttr -is true -ci true -h true -sn "light1Intensity_Name" -ln "light1Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1Intensity_Type" -ln "light1Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1Intensity" -ln "light1Intensity" -nn "Light 1 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1Dir_Name" -ln "light1Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light1Dir_Type" -ln "light1Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light1Dir" -ln "light1Dir" -nn "Light 1 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Name" -ln "light1ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ConeAngle_Type" -ln "light1ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1ConeAngle" -ln "light1ConeAngle" -nn "Light 1 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1FallOff_Name" -ln "light1FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1FallOff_Type" -ln "light1FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1FallOff" -ln "light1FallOff" -nn "Light 1 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Name" -ln "light1AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1AttenScale_Type" -ln "light1AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light1AttenScale" -ln "light1AttenScale" 
		-nn "Light 1 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Name" -ln "light1ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn_Type" -ln "light1ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowOn" -ln "light1ShadowOn" -nn "Light 1 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Enable_Name" -ln "light2Enable_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Enable_Type" -ln "light2Enable_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Enable" -ln "light2Enable" -nn "Enable Light 2" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "light2Type_Name" -ln "light2Type_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Type_Type" -ln "light2Type_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Type" -ln "light2Type" -nn "Light 2 Type" 
		-ct "HW_shader_parameter" -dv 2 -min 0 -max 5 -smn 0 -smx 1 -en "None:Default:Spot:Point:Directional:Ambient" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "light2Pos_Name" -ln "light2Pos_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Pos_Type" -ln "light2Pos_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Pos" -ln "light2Pos" -nn "Light 2 Position" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2Color_Name" -ln "light2Color_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Color_Type" -ln "light2Color_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "light2Color" -ln "light2Color" -nn "Light 2 Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ColorR" -ln "light2ColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorG" -ln "light2ColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -sn "light2ColorB" -ln "light2ColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "light2Color";
	addAttr -is true -ci true -h true -sn "light2Intensity_Name" -ln "light2Intensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2Intensity_Type" -ln "light2Intensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2Intensity" -ln "light2Intensity" -nn "Light 2 Intensity" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2Dir_Name" -ln "light2Dir_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "light2Dir_Type" -ln "light2Dir_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "light2Dir" -ln "light2Dir" -nn "Light 2 Direction" 
		-ct "HW_shader_parameter" -at "matrix";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Name" -ln "light2ConeAngle_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ConeAngle_Type" -ln "light2ConeAngle_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2ConeAngle" -ln "light2ConeAngle" -nn "Light 2 Cone Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2FallOff_Name" -ln "light2FallOff_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2FallOff_Type" -ln "light2FallOff_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2FallOff" -ln "light2FallOff" -nn "Light 2 Penumbra Angle" 
		-ct "HW_shader_parameter" -min 0 -max 1.5707962512969971 -at "float";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Name" -ln "light2AttenScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2AttenScale_Type" -ln "light2AttenScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "light2AttenScale" -ln "light2AttenScale" 
		-nn "Light 2 Decay" -ct "HW_shader_parameter" -min 0 -max 99999 -at "float";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Name" -ln "light2ShadowOn_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn_Type" -ln "light2ShadowOn_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowOn" -ln "light2ShadowOn" -nn "Light 2 Casts Shadow" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Name" -ln "UseAmbientOcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseAmbientOcclusionTexture_Type" -ln "UseAmbientOcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseAmbientOcclusionTexture" -ln "UseAmbientOcclusionTexture" 
		-nn "Use Occlusion Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Name" -ln "transpDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "transpDepthTexture_Type" -ln "transpDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "transpDepthTexture" -ln "transpDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "transpDepthTextureR" -ln "transpDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureG" -ln "transpDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -sn "transpDepthTextureB" -ln "transpDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "transpDepthTexture";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Name" -ln "opaqueDepthTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "opaqueDepthTexture_Type" -ln "opaqueDepthTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "opaqueDepthTexture" -ln "opaqueDepthTexture" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "opaqueDepthTextureR" -ln "opaqueDepthTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureG" -ln "opaqueDepthTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -sn "opaqueDepthTextureB" -ln "opaqueDepthTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "opaqueDepthTexture";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Name" -ln "UseDiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTexture_Type" -ln "UseDiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTexture" -ln "UseDiffuseTexture" 
		-nn "Use Diffuse Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Name" -ln "UseDiffuseTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseTextureAlpha_Type" -ln "UseDiffuseTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseTextureAlpha" -ln "UseDiffuseTextureAlpha" 
		-nn "Use Diffuse Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Name" -ln "DiffuseTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexture_Type" -ln "DiffuseTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseTexture" -ln "DiffuseTexture" -nn "Diffuse Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseTextureR" -ln "DiffuseTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureG" -ln "DiffuseTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -sn "DiffuseTextureB" -ln "DiffuseTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseTexture";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Name" -ln "DiffuseColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseColor_Type" -ln "DiffuseColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "DiffuseColor" -ln "DiffuseColor" -nn "Diffuse Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseColorR" -ln "DiffuseColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorG" -ln "DiffuseColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -sn "DiffuseColorB" -ln "DiffuseColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "DiffuseColor";
	addAttr -is true -ci true -h true -sn "Opacity_Name" -ln "Opacity_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Opacity_Type" -ln "Opacity_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Opacity" -ln "Opacity" -nn "Opacity" -ct "HW_shader_parameter" 
		-dv 1 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Name" -ln "UseOpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseOpacityMaskTexture_Type" -ln "UseOpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseOpacityMaskTexture" -ln "UseOpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Name" -ln "OpacityMaskTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexture_Type" -ln "OpacityMaskTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OpacityMaskTexture" -ln "OpacityMaskTexture" 
		-nn "Opacity Mask" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OpacityMaskTextureR" -ln "OpacityMaskTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureG" -ln "OpacityMaskTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -sn "OpacityMaskTextureB" -ln "OpacityMaskTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OpacityMaskTexture";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Name" -ln "OpacityMaskBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskBias_Type" -ln "OpacityMaskBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskBias" -ln "OpacityMaskBias" -nn "Opacity Mask Bias" 
		-ct "HW_shader_parameter" -dv 0.10000000149011612 -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Name" -ln "UseSpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTexture_Type" -ln "UseSpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTexture" -ln "UseSpecularTexture" 
		-nn "Use Specular Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Name" -ln "SpecularTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexture_Type" -ln "SpecularTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularTexture" -ln "SpecularTexture" -nn "Specular Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularTextureR" -ln "SpecularTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureG" -ln "SpecularTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -sn "SpecularTextureB" -ln "SpecularTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularTexture";
	addAttr -is true -ci true -h true -sn "SpecularColor_Name" -ln "SpecularColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularColor_Type" -ln "SpecularColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "SpecularColor" -ln "SpecularColor" -nn "Specular Color" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularColorR" -ln "SpecularColorR" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorG" -ln "SpecularColorG" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -sn "SpecularColorB" -ln "SpecularColorB" -ct "HW_shader_parameter" 
		-dv 1 -smn 0 -smx 1 -at "float" -p "SpecularColor";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Name" -ln "UseNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseNormalTexture_Type" -ln "UseNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseNormalTexture" -ln "UseNormalTexture" 
		-nn "Use Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalTexture_Name" -ln "NormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexture_Type" -ln "NormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "NormalTexture" -ln "NormalTexture" -nn "Normal Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "NormalTextureR" -ln "NormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureG" -ln "NormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -sn "NormalTextureB" -ln "NormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "NormalTexture";
	addAttr -is true -ci true -h true -sn "NormalHeight_Name" -ln "NormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalHeight_Type" -ln "NormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalHeight" -ln "NormalHeight" -nn "Normal Height" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 5 -at "float";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Name" -ln "SupportNonUniformScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SupportNonUniformScale_Type" -ln "SupportNonUniformScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SupportNonUniformScale" -ln "SupportNonUniformScale" 
		-nn "Support Non-Uniform Scale" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Name" -ln "NormalCoordsysX_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysX_Type" -ln "NormalCoordsysX_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysX" -ln "NormalCoordsysX" -nn "Normal X (Red)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Name" -ln "NormalCoordsysY_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalCoordsysY_Type" -ln "NormalCoordsysY_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalCoordsysY" -ln "NormalCoordsysY" -nn "Normal Y (Green)" 
		-ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en "Positive:Negative" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Name" -ln "DisplacementModel_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementModel_Type" -ln "DisplacementModel_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementModel" -ln "DisplacementModel" 
		-nn "Displacement Model" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 -en 
		"Grayscale:Tangent Vector" -at "enum";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Name" -ln "UseDisplacementMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDisplacementMap_Type" -ln "UseDisplacementMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDisplacementMap" -ln "UseDisplacementMap" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Name" -ln "DisplacementTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexture_Type" -ln "DisplacementTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DisplacementTexture" -ln "DisplacementTexture" 
		-nn "Displacement Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DisplacementTextureR" -ln "DisplacementTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureG" -ln "DisplacementTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -sn "DisplacementTextureB" -ln "DisplacementTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "DisplacementTexture";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Name" -ln "VectorDisplacementCoordSys_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "VectorDisplacementCoordSys_Type" -ln "VectorDisplacementCoordSys_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "VectorDisplacementCoordSys" -ln "VectorDisplacementCoordSys" 
		-nn "Displacement Coordsys" -ct "HW_shader_parameter" -min 0 -max 1 -smn 0 -smx 1 
		-en "Mudbox (XZY):Maya (XYZ)" -at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Name" -ln "DisplacementHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementHeight_Type" -ln "DisplacementHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementHeight" -ln "DisplacementHeight" 
		-nn "Displacement Height" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn 0 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Name" -ln "DisplacementOffset_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementOffset_Type" -ln "DisplacementOffset_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementOffset" -ln "DisplacementOffset" 
		-nn "Displacement Offset" -ct "HW_shader_parameter" -dv 0.5 -min -99999 -max 99999 
		-smn -1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Name" -ln "DisplacementClippingBias_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementClippingBias_Type" -ln "DisplacementClippingBias_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementClippingBias" -ln "DisplacementClippingBias" 
		-nn "Displacement Clipping Bias" -ct "HW_shader_parameter" -dv 5 -min -99999 -max 
		99999 -smn 0 -smx 99 -at "float";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Name" -ln "BBoxExtraScale_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BBoxExtraScale_Type" -ln "BBoxExtraScale_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "BBoxExtraScale" -ln "BBoxExtraScale" -nn "Bounding Box Extra Scale" 
		-ct "HW_shader_parameter" -dv 1 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationRange_Name" -ln "TessellationRange_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationRange_Type" -ln "TessellationRange_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationRange" -ln "TessellationRange" 
		-nn "Tessellation Range" -ct "HW_shader_parameter" -min 0 -max 99999 -smx 999 -at "float";
	addAttr -is true -ci true -h true -sn "TessellationMin_Name" -ln "TessellationMin_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "TessellationMin_Type" -ln "TessellationMin_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "TessellationMin" -ln "TessellationMin" -nn "Tessellation Minimum" 
		-ct "HW_shader_parameter" -dv 3 -min 1 -max 99999 -smx 10 -at "float";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Name" -ln "FlatTessellation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "FlatTessellation_Type" -ln "FlatTessellation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "FlatTessellation" -ln "FlatTessellation" 
		-nn "Flat Tessellation" -ct "HW_shader_parameter" -min 0 -max 1 -at "float";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Name" -ln "UseTranslucency_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseTranslucency_Type" -ln "UseTranslucency_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseTranslucency" -ln "UseTranslucency" -nn "Back Scattering" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Name" -ln "UseThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseThicknessTexture_Type" -ln "UseThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseThicknessTexture" -ln "UseThicknessTexture" 
		-nn "Use Thickness Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Name" -ln "UseDiffuseIBLMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseDiffuseIBLMap_Type" -ln "UseDiffuseIBLMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseDiffuseIBLMap" -ln "UseDiffuseIBLMap" 
		-nn "Use Diffuse Cubemap" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Name" -ln "DiffuseIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseIBLIntensity_Type" -ln "DiffuseIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseIBLIntensity" -ln "DiffuseIBLIntensity" 
		-nn "Diffuse IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Name" -ln "DiffuseTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseTexcoord_Type" -ln "DiffuseTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DiffuseTexcoord" -ln "DiffuseTexcoord" -nn "Diffuse Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Name" -ln "OpacityMaskTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OpacityMaskTexcoord_Type" -ln "OpacityMaskTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OpacityMaskTexcoord" -ln "OpacityMaskTexcoord" 
		-nn "Opacity Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Name" -ln "SpecularTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularTexcoord_Type" -ln "SpecularTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularTexcoord" -ln "SpecularTexcoord" 
		-nn "Specular Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Name" -ln "NormalTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalTexcoord_Type" -ln "NormalTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalTexcoord" -ln "NormalTexcoord" -nn "Normal Map UV" 
		-ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" 
		-at "enum";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Name" -ln "DisplacementTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DisplacementTexcoord_Type" -ln "DisplacementTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "DisplacementTexcoord" -ln "DisplacementTexcoord" 
		-nn "Displacement Map UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 -en 
		"TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Name" -ln "ThicknessTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ThicknessTexcoord_Type" -ln "ThicknessTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "ThicknessTexcoord" -ln "ThicknessTexcoord" 
		-nn "Translucency Mask UV" -ct "HW_shader_parameter" -min 0 -max 2 -smn 0 -smx 1 
		-en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Name" -ln "light0ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light0ShadowMap_Type" -ln "light0ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light0ShadowMap" -ln "light0ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light0ShadowMapR" -ln "light0ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapG" -ln "light0ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -sn "light0ShadowMapB" -ln "light0ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light0ShadowMap";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Name" -ln "light1ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light1ShadowMap_Type" -ln "light1ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light1ShadowMap" -ln "light1ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light1ShadowMapR" -ln "light1ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapG" -ln "light1ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -sn "light1ShadowMapB" -ln "light1ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light1ShadowMap";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Name" -ln "light2ShadowMap_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "light2ShadowMap_Type" -ln "light2ShadowMap_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -h true -sn "light2ShadowMap" -ln "light2ShadowMap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "light2ShadowMapR" -ln "light2ShadowMapR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapG" -ln "light2ShadowMapG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -sn "light2ShadowMapB" -ln "light2ShadowMapB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "light2ShadowMap";
	addAttr -is true -ci true -h true -sn "screenSize_Name" -ln "screenSize_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize_Type" -ln "screenSize_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "screenSize" -ln "screenSize" -ct "HW_shader_parameter" 
		-at "float2" -nc 2;
	addAttr -is true -ci true -sn "screenSizeX" -ln "screenSizeX" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -sn "screenSizeY" -ln "screenSizeY" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "screenSize";
	addAttr -is true -ci true -h true -sn "SkyRotation_Name" -ln "SkyRotation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SkyRotation_Type" -ln "SkyRotation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SkyRotation" -ln "SkyRotation" -nn "Sky Rotation" 
		-ct "HW_shader_parameter" -min 0 -max 99999 -smn 0 -smx 360 -at "float";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Name" -ln "DiffuseCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DiffuseCubeIBL_Type" -ln "DiffuseCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DiffuseCubeIBL" -ln "DiffuseCubeIBL" -nn "Diffuse Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DiffuseCubeIBLR" -ln "DiffuseCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLG" -ln "DiffuseCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -sn "DiffuseCubeIBLB" -ln "DiffuseCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DiffuseCubeIBL";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Name" -ln "UseSpecCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecCubeIBL_Type" -ln "UseSpecCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecCubeIBL" -ln "UseSpecCubeIBL" -nn "Use Specular Cubemap" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Name" -ln "SpecularIBLIntensity_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularIBLIntensity_Type" -ln "SpecularIBLIntensity_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "SpecularIBLIntensity" -ln "SpecularIBLIntensity" 
		-nn "Specular IBL Intensity" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Name" -ln "SpecularCubeIBL_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "SpecularCubeIBL_Type" -ln "SpecularCubeIBL_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "SpecularCubeIBL" -ln "SpecularCubeIBL" -nn "Specular Cubemap" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "SpecularCubeIBLR" -ln "SpecularCubeIBLR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLG" -ln "SpecularCubeIBLG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -sn "SpecularCubeIBLB" -ln "SpecularCubeIBLB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "SpecularCubeIBL";
	addAttr -is true -ci true -h true -sn "LutTexture_Name" -ln "LutTexture_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LutTexture_Type" -ln "LutTexture_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -uac -sn "LutTexture" -ln "LutTexture" -nn "SSS LUT Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "LutTextureR" -ln "LutTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureG" -ln "LutTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -sn "LutTextureB" -ln "LutTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "LutTexture";
	addAttr -is true -ci true -h true -sn "DitherTexture_Name" -ln "DitherTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "DitherTexture_Type" -ln "DitherTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "DitherTexture" -ln "DitherTexture" -nn "SSS Dither Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "DitherTextureR" -ln "DitherTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureG" -ln "DitherTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -sn "DitherTextureB" -ln "DitherTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "DitherTexture";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Name" -ln "skinCoeffX_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffX_Type" -ln "skinCoeffX_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffX" -ln "skinCoeffX" -nn "SSS Coeffient R" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Name" -ln "skinCoeffY_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffY_Type" -ln "skinCoeffY_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffY" -ln "skinCoeffY" -nn "SSS Coeffient G" 
		-ct "HW_shader_parameter" -dv 0.5 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Name" -ln "skinCoeffZ_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "skinCoeffZ_Type" -ln "skinCoeffZ_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "skinCoeffZ" -ln "skinCoeffZ" -nn "SSS Coeffient B" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Name" -ln "NormalBlurring_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "NormalBlurring_Type" -ln "NormalBlurring_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "NormalBlurring" -ln "NormalBlurring" -nn "SSS Softness" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Name" -ln "ScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "ScatteringRadiusTexture_Type" -ln "ScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "ScatteringRadiusTexture" -ln "ScatteringRadiusTexture" 
		-nn "SSS Radius Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "ScatteringRadiusTextureR" -ln "ScatteringRadiusTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureG" -ln "ScatteringRadiusTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -sn "ScatteringRadiusTextureB" -ln "ScatteringRadiusTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "ScatteringRadiusTexture";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Name" -ln "UseScatteringRadiusTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseScatteringRadiusTexture_Type" -ln "UseScatteringRadiusTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseScatteringRadiusTexture" -ln "UseScatteringRadiusTexture" 
		-nn "Use SSS Radius Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "skinScattering_Name" -ln "skinScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScattering_Type" -ln "skinScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScattering" -ln "skinScattering" -nn "SSS Radius" 
		-ct "HW_shader_parameter" -dv 0.25 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowBlur_Name" -ln "shadowBlur_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "shadowBlur_Type" -ln "shadowBlur_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "shadowBlur" -ln "shadowBlur" -nn "SSS Shadow Blur" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowDither_Name" -ln "shadowDither_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowDither_Type" -ln "shadowDither_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowDither" -ln "shadowDither" -nn "SSS Shadow Dither" 
		-ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "shadowScattering_Name" -ln "shadowScattering_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowScattering_Type" -ln "shadowScattering_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowScattering" -ln "shadowScattering" 
		-nn "SSS Shadow Scattering" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Name" -ln "shadowSaturation_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "shadowSaturation_Type" -ln "shadowSaturation_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "shadowSaturation" -ln "shadowSaturation" 
		-nn "SSS Shadow Saturation" -ct "HW_shader_parameter" -dv 1 -min 0 -max 4 -smx 4 
		-at "float";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Name" -ln "BackScatteringThicknessTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "BackScatteringThicknessTexture_Type" -ln "BackScatteringThicknessTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "BackScatteringThicknessTexture" -ln "BackScatteringThicknessTexture" 
		-nn "Thickness Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureR" -ln "BackScatteringThicknessTextureR" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureG" -ln "BackScatteringThicknessTextureG" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -sn "BackScatteringThicknessTextureB" -ln "BackScatteringThicknessTextureB" 
		-ct "HW_shader_parameter" -smn 0 -smx 1 -at "float" -p "BackScatteringThicknessTexture";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Name" -ln "skinScatteringRoughness_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringRoughness_Type" -ln "skinScatteringRoughness_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringRoughness" -ln "skinScatteringRoughness" 
		-nn "Back Scattering Width" -ct "HW_shader_parameter" -dv 1 -min 0 -max 1 -smx 1 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Name" -ln "skinScatteringOuterColor_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringOuterColor_Type" -ln "skinScatteringOuterColor_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -k true -sn "skinScatteringOuterColor" -ln "skinScatteringOuterColor" 
		-nn "Back Scattering Color" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "skinScatteringOuterColorR" -ln "skinScatteringOuterColorR" 
		-ct "HW_shader_parameter" -dv 0.25 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorG" -ln "skinScatteringOuterColorG" 
		-ct "HW_shader_parameter" -dv 0.05000000074505806 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -sn "skinScatteringOuterColorB" -ln "skinScatteringOuterColorB" 
		-ct "HW_shader_parameter" -dv 0.019999999552965164 -smn 0 -smx 1 -at "float" -p "skinScatteringOuterColor";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Name" -ln "skinScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinScatteringAmount_Type" -ln "skinScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinScatteringAmount" -ln "skinScatteringAmount" 
		-nn "Back Scattering Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 6 -smx 6 
		-at "float";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Name" -ln "skinAmbientScatteringAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "skinAmbientScatteringAmount_Type" -ln "skinAmbientScatteringAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "skinAmbientScatteringAmount" -ln "skinAmbientScatteringAmount" 
		-nn "Back Scattering Ambient Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 
		6 -smx 6 -at "float";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Name" -ln "UseSpecularTextureAlpha_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseSpecularTextureAlpha_Type" -ln "UseSpecularTextureAlpha_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseSpecularTextureAlpha" -ln "UseSpecularTextureAlpha" 
		-nn "Use Roughness Map Alpha" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "LobeMix_Name" -ln "LobeMix_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "LobeMix_Type" -ln "LobeMix_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "LobeMix" -ln "LobeMix" -nn "Lobe Mixing" 
		-ct "HW_shader_parameter" -dv 0.75 -min 0 -max 1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "Roughness_Name" -ln "Roughness_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "Roughness_Type" -ln "Roughness_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "Roughness" -ln "Roughness" -nn "Roughness multiplier" 
		-ct "HW_shader_parameter" -dv 0.20000000298023224 -min 0.0099999997764825821 -max 
		1 -smx 1 -at "float";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Name" -ln "OcclusionTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexture_Type" -ln "OcclusionTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "OcclusionTexture" -ln "OcclusionTexture" -nn "Ambient Occlusion Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "OcclusionTextureR" -ln "OcclusionTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureG" -ln "OcclusionTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -sn "OcclusionTextureB" -ln "OcclusionTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "OcclusionTexture";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Name" -ln "OcclusionAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionAmount_Type" -ln "OcclusionAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionAmount" -ln "OcclusionAmount" -nn "Occlusion Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Name" -ln "UseCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseCavityTexture_Type" -ln "UseCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseCavityTexture" -ln "UseCavityTexture" 
		-nn "Use Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "CavityTexture_Name" -ln "CavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityTexture_Type" -ln "CavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "CavityTexture" -ln "CavityTexture" -nn "Cavity Map" 
		-ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "CavityTextureR" -ln "CavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureG" -ln "CavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -sn "CavityTextureB" -ln "CavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "CavityTexture";
	addAttr -is true -ci true -h true -sn "CavityAmount_Name" -ln "CavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "CavityAmount_Type" -ln "CavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "CavityAmount" -ln "CavityAmount" -nn "Cavity Amount" 
		-ct "HW_shader_parameter" -dv 1 -min 0.0099999997764825821 -max 2 -smx 2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Name" -ln "UseMicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroCavityTexture_Type" -ln "UseMicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroCavityTexture" -ln "UseMicroCavityTexture" 
		-nn "Use Micro Cavity Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Name" -ln "MicroCavityTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityTexture_Type" -ln "MicroCavityTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroCavityTexture" -ln "MicroCavityTexture" 
		-nn "Micro Cavity Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroCavityTextureR" -ln "MicroCavityTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureG" -ln "MicroCavityTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -sn "MicroCavityTextureB" -ln "MicroCavityTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroCavityTexture";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Name" -ln "MicroCavityAmount_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroCavityAmount_Type" -ln "MicroCavityAmount_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroCavityAmount" -ln "MicroCavityAmount" 
		-nn "Micro Cavity Amount" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		2 -at "float";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Name" -ln "UseMicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseMicroNormalTexture_Type" -ln "UseMicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseMicroNormalTexture" -ln "UseMicroNormalTexture" 
		-nn "Use Micro Normal Map" -ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Name" -ln "MicroNormalTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalTexture_Type" -ln "MicroNormalTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -uac -sn "MicroNormalTexture" -ln "MicroNormalTexture" 
		-nn "Micro Normal Map" -ct "HW_shader_parameter" -at "float3" -nc 3;
	addAttr -is true -ci true -sn "MicroNormalTextureR" -ln "MicroNormalTextureR" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureG" -ln "MicroNormalTextureG" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -sn "MicroNormalTextureB" -ln "MicroNormalTextureB" -ct "HW_shader_parameter" 
		-smn 0 -smx 1 -at "float" -p "MicroNormalTexture";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Name" -ln "MicroNormalHeight_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "MicroNormalHeight_Type" -ln "MicroNormalHeight_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "MicroNormalHeight" -ln "MicroNormalHeight" 
		-nn "Micro Normal Height" -ct "HW_shader_parameter" -dv 1 -min 0 -max 99999 -smx 
		5 -at "float";
	addAttr -is true -ci true -h true -sn "MicroScale_Name" -ln "MicroScale_Name" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -h true -sn "MicroScale_Type" -ln "MicroScale_Type" -ct "HW_shader_parameter" 
		-dt "string";
	addAttr -is true -ci true -k true -sn "MicroScale" -ln "MicroScale" -nn "Micro Scale" 
		-ct "HW_shader_parameter" -dv 32 -min 16 -max 99999 -smx 256 -at "float";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Name" -ln "UseBlendTexture_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "UseBlendTexture_Type" -ln "UseBlendTexture_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "UseBlendTexture" -ln "UseBlendTexture" -nn "Enable Wrinkle Mixing" 
		-ct "HW_shader_parameter" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Name" -ln "OcclusionTexcoord_Name" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -h true -sn "OcclusionTexcoord_Type" -ln "OcclusionTexcoord_Type" 
		-ct "HW_shader_parameter" -dt "string";
	addAttr -is true -ci true -k true -sn "OcclusionTexcoord" -ln "OcclusionTexcoord" 
		-nn "Ambient Occlusion Map UV" -ct "HW_shader_parameter" -dv 1 -min 0 -max 2 -smn 
		0 -smx 1 -en "TexCoord0:TexCoord1:TexCoord2" -at "enum";
	addAttr -ci true -sn "Position" -ln "Position" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Position_Name" -ln "Position_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -h true -sn "Position_Source" -ln "Position_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Position";
	addAttr -is true -ci true -sn "Position_DefaultTexture" -ln "Position_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Position";
	addAttr -ci true -sn "TexCoord0" -ln "TexCoord0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord0_Name" -ln "TexCoord0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord0";
	addAttr -is true -ci true -h true -sn "TexCoord0_Source" -ln "TexCoord0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -is true -ci true -sn "TexCoord0_DefaultTexture" -ln "TexCoord0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord0";
	addAttr -ci true -sn "TexCoord1" -ln "TexCoord1" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord1_Name" -ln "TexCoord1_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord1";
	addAttr -is true -ci true -h true -sn "TexCoord1_Source" -ln "TexCoord1_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -is true -ci true -sn "TexCoord1_DefaultTexture" -ln "TexCoord1_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord1";
	addAttr -ci true -sn "TexCoord2" -ln "TexCoord2" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "TexCoord2_Name" -ln "TexCoord2_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "TexCoord2";
	addAttr -is true -ci true -h true -sn "TexCoord2_Source" -ln "TexCoord2_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -is true -ci true -sn "TexCoord2_DefaultTexture" -ln "TexCoord2_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "TexCoord2";
	addAttr -ci true -sn "Normal" -ln "Normal" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Normal_Name" -ln "Normal_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -h true -sn "Normal_Source" -ln "Normal_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Normal";
	addAttr -is true -ci true -sn "Normal_DefaultTexture" -ln "Normal_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Normal";
	addAttr -ci true -sn "Binormal0" -ln "Binormal0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Binormal0_Name" -ln "Binormal0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Binormal0";
	addAttr -is true -ci true -h true -sn "Binormal0_Source" -ln "Binormal0_Source" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -is true -ci true -sn "Binormal0_DefaultTexture" -ln "Binormal0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Binormal0";
	addAttr -ci true -sn "Tangent0" -ln "Tangent0" -at "compound" -nc 3;
	addAttr -is true -ci true -h true -sn "Tangent0_Name" -ln "Tangent0_Name" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -h true -sn "Tangent0_Source" -ln "Tangent0_Source" -ct "HW_shader_parameter" 
		-dt "string" -p "Tangent0";
	addAttr -is true -ci true -sn "Tangent0_DefaultTexture" -ln "Tangent0_DefaultTexture" 
		-ct "HW_shader_parameter" -dt "string" -p "Tangent0";
	setAttr ".vpar" -type "stringArray" 7 "Position" "TexCoord0" "TexCoord1" "TexCoord2" "Normal" "Binormal0" "Tangent0"  ;
	setAttr ".upar" -type "stringArray" 124 "SuperFilterTaps" "shadowMapTexelSize" "IsSwatchRender" "screenSize" "MayaFullScreenGamma" "light0Enable" "light0Type" "light0Pos" "light0Color" "light0Intensity" "light0Dir" "light0ConeAngle" "light0FallOff" "light0AttenScale" "light0ShadowOn" "light1Enable" "light1Type" "light1Pos" "light1Color" "light1Intensity" "light1Dir" "light1ConeAngle" "light1FallOff" "light1AttenScale" "light1ShadowOn" "light2Enable" "light2Type" "light2Pos" "light2Color" "light2Intensity" "light2Dir" "light2ConeAngle" "light2FallOff" "light2AttenScale" "light2ShadowOn" "LinearSpaceLighting" "UseShadows" "shadowMultiplier" "shadowDepthBias" "flipBackfaceNormals" "SkyRotation" "UseDiffuseIBLMap" "DiffuseIBLIntensity" "DiffuseCubeIBL" "UseSpecCubeIBL" "SpecularIBLIntensity" "SpecularCubeIBL" "transpDepthTexture" "opaqueDepthTexture" "UseDiffuseTexture" "UseDiffuseTextureAlpha" "DiffuseTexture" "DiffuseColor" "LutTexture" "DitherTexture" "skinCoeffX" "skinCoeffY" "skinCoeffZ" "NormalBlurring" "UseScatteringRadiusTexture" "ScatteringRadiusTexture" "skinScattering" "shadowBlur" "shadowDither" "shadowScattering" "shadowSaturation" "UseTranslucency" "BackScatteringThicknessTexture" "UseThicknessTexture" "skinScatteringRoughness" "skinScatteringOuterColor" "skinScatteringAmount" "skinAmbientScatteringAmount" "UseSpecularTextureAlpha" "UseSpecularTexture" "SpecularTexture" "SpecularColor" "LobeMix" "Roughness" "UseAmbientOcclusionTexture" "OcclusionTexture" "OcclusionAmount" "UseCavityTexture" "CavityTexture" "CavityAmount" "UseNormalTexture" "NormalTexture" "NormalHeight" "SupportNonUniformScale" "NormalCoordsysX" "NormalCoordsysY" "UseMicroCavityTexture" "MicroCavityTexture" "MicroCavityAmount" "UseMicroNormalTexture" "MicroNormalTexture" "MicroNormalHeight" "MicroScale" "OpacityMaskTexture" "Opacity" "UseOpacityMaskTexture" "OpacityMaskBias" "DisplacementModel" "UseDisplacementMap" "DisplacementTexture" "VectorDisplacementCoordSys" "DisplacementHeight" "DisplacementOffset" "DisplacementClippingBias" "BBoxExtraScale" "TessellationRange" "TessellationMin" "FlatTessellation" "UseBlendTexture" "DiffuseTexcoord" "OcclusionTexcoord" "OpacityMaskTexcoord" "SpecularTexcoord" "NormalTexcoord" "DisplacementTexcoord" "ThicknessTexcoord" "light0ShadowMap" "light1ShadowMap" "light2ShadowMap"  ;
	setAttr ".s" -type "string" "$PROJECT_ROOT/Common/SourceAssets/shaders/dx11_shd_eyeRight.fx";
	setAttr ".t" -type "string" "TessellationOFF";
	setAttr ".SuperFilterTaps_Name" -type "string" "SuperFilterTaps";
	setAttr ".SuperFilterTaps_Type" -type "string" "float1x2";
	setAttr ".SuperFilterTaps" -type "float2" -0.84052002 -0.073954001 ;
	setAttr ".shadowMapTexelSize_Name" -type "string" "shadowMapTexelSize";
	setAttr ".shadowMapTexelSize_Type" -type "string" "float";
	setAttr ".shadowMapTexelSize" 0.0019531298894435167;
	setAttr ".LinearSpaceLighting_Name" -type "string" "LinearSpaceLighting";
	setAttr ".LinearSpaceLighting_Type" -type "string" "bool";
	setAttr -k on ".LinearSpaceLighting" yes;
	setAttr ".UseShadows_Name" -type "string" "UseShadows";
	setAttr ".UseShadows_Type" -type "string" "bool";
	setAttr -k on ".UseShadows" yes;
	setAttr ".shadowMultiplier_Name" -type "string" "shadowMultiplier";
	setAttr ".shadowMultiplier_Type" -type "string" "float";
	setAttr -k on ".shadowMultiplier" 1;
	setAttr ".IsSwatchRender_Name" -type "string" "IsSwatchRender";
	setAttr ".IsSwatchRender_Type" -type "string" "bool";
	setAttr ".IsSwatchRender" no;
	setAttr ".shadowDepthBias_Name" -type "string" "shadowDepthBias";
	setAttr ".shadowDepthBias_Type" -type "string" "float";
	setAttr -k on ".shadowDepthBias" 0.0099999997764825821;
	setAttr ".MayaFullScreenGamma_Name" -type "string" "MayaFullScreenGamma";
	setAttr ".MayaFullScreenGamma_Type" -type "string" "bool";
	setAttr ".MayaFullScreenGamma" no;
	setAttr ".flipBackfaceNormals_Name" -type "string" "flipBackfaceNormals";
	setAttr ".flipBackfaceNormals_Type" -type "string" "bool";
	setAttr -k on ".flipBackfaceNormals" yes;
	setAttr ".light0Enable_Name" -type "string" "light0Enable";
	setAttr ".light0Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light0Enable" no;
	setAttr ".light0Type_Name" -type "string" "light0Type";
	setAttr ".light0Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light0Type" 2;
	setAttr ".light0Pos_Name" -type "string" "light0Pos";
	setAttr ".light0Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 100 1;
	setAttr ".light0Color_Name" -type "string" "light0Color";
	setAttr ".light0Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light0Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light0Color";
	setAttr ".light0Intensity_Name" -type "string" "light0Intensity";
	setAttr ".light0Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light0Intensity" 1;
	setAttr ".light0Dir_Name" -type "string" "light0Dir";
	setAttr ".light0Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light0Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light0ConeAngle_Name" -type "string" "light0ConeAngle";
	setAttr ".light0ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light0ConeAngle" 0.46000000834465027;
	setAttr ".light0FallOff_Name" -type "string" "light0FallOff";
	setAttr ".light0FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light0FallOff" 0.69999998807907104;
	setAttr ".light0AttenScale_Name" -type "string" "light0AttenScale";
	setAttr ".light0AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light0AttenScale" 0;
	setAttr ".light0ShadowOn_Name" -type "string" "light0ShadowOn";
	setAttr ".light0ShadowOn_Type" -type "string" "bool";
	setAttr ".light0ShadowOn" yes;
	setAttr ".light1Enable_Name" -type "string" "light1Enable";
	setAttr ".light1Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light1Enable" no;
	setAttr ".light1Type_Name" -type "string" "light1Type";
	setAttr ".light1Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light1Type" 2;
	setAttr ".light1Pos_Name" -type "string" "light1Pos";
	setAttr ".light1Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -100 100 100 1;
	setAttr ".light1Color_Name" -type "string" "light1Color";
	setAttr ".light1Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light1Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light1Color";
	setAttr ".light1Intensity_Name" -type "string" "light1Intensity";
	setAttr ".light1Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light1Intensity" 1;
	setAttr ".light1Dir_Name" -type "string" "light1Dir";
	setAttr ".light1Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light1Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light1ConeAngle_Name" -type "string" "light1ConeAngle";
	setAttr ".light1ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light1ConeAngle" 45;
	setAttr ".light1FallOff_Name" -type "string" "light1FallOff";
	setAttr ".light1FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light1FallOff" 0;
	setAttr ".light1AttenScale_Name" -type "string" "light1AttenScale";
	setAttr ".light1AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light1AttenScale" 0;
	setAttr ".light1ShadowOn_Name" -type "string" "light1ShadowOn";
	setAttr ".light1ShadowOn_Type" -type "string" "bool";
	setAttr ".light1ShadowOn" yes;
	setAttr ".light2Enable_Name" -type "string" "light2Enable";
	setAttr ".light2Enable_Type" -type "string" "bool";
	setAttr -l on -k on ".light2Enable" no;
	setAttr ".light2Type_Name" -type "string" "light2Type";
	setAttr ".light2Type_Type" -type "string" "enum";
	setAttr -l on -k on ".light2Type" 2;
	setAttr ".light2Pos_Name" -type "string" "light2Pos";
	setAttr ".light2Pos_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Pos" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 100 100 -100 1;
	setAttr ".light2Color_Name" -type "string" "light2Color";
	setAttr ".light2Color_Type" -type "string" "color1x3";
	setAttr -l on -k on ".light2Color" -type "float3" 1 1 1 ;
	setAttr -l on -k on ".light2Color";
	setAttr ".light2Intensity_Name" -type "string" "light2Intensity";
	setAttr ".light2Intensity_Type" -type "string" "float";
	setAttr -l on -k on ".light2Intensity" 1;
	setAttr ".light2Dir_Name" -type "string" "light2Dir";
	setAttr ".light2Dir_Type" -type "string" "matrix1x3";
	setAttr -l on -k on ".light2Dir" -type "matrix" 1 0 0 0 0 1 0 0 -100 -100 -100 0
		 0 0 0 1;
	setAttr ".light2ConeAngle_Name" -type "string" "light2ConeAngle";
	setAttr ".light2ConeAngle_Type" -type "string" "float";
	setAttr -l on -k on ".light2ConeAngle" 45;
	setAttr ".light2FallOff_Name" -type "string" "light2FallOff";
	setAttr ".light2FallOff_Type" -type "string" "float";
	setAttr -l on -k on ".light2FallOff" 0;
	setAttr ".light2AttenScale_Name" -type "string" "light2AttenScale";
	setAttr ".light2AttenScale_Type" -type "string" "float";
	setAttr -l on -k on ".light2AttenScale" 0;
	setAttr ".light2ShadowOn_Name" -type "string" "light2ShadowOn";
	setAttr ".light2ShadowOn_Type" -type "string" "bool";
	setAttr ".light2ShadowOn" yes;
	setAttr ".UseAmbientOcclusionTexture_Name" -type "string" "UseAmbientOcclusionTexture";
	setAttr ".UseAmbientOcclusionTexture_Type" -type "string" "bool";
	setAttr -k on ".UseAmbientOcclusionTexture" no;
	setAttr ".transpDepthTexture_Name" -type "string" "transpDepthTexture";
	setAttr ".transpDepthTexture_Type" -type "string" "texture";
	setAttr ".transpDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".opaqueDepthTexture_Name" -type "string" "opaqueDepthTexture";
	setAttr ".opaqueDepthTexture_Type" -type "string" "texture";
	setAttr ".opaqueDepthTexture" -type "float3" 0 0 0 ;
	setAttr ".UseDiffuseTexture_Name" -type "string" "UseDiffuseTexture";
	setAttr ".UseDiffuseTexture_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTexture" yes;
	setAttr ".UseDiffuseTextureAlpha_Name" -type "string" "UseDiffuseTextureAlpha";
	setAttr ".UseDiffuseTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseTextureAlpha" no;
	setAttr ".DiffuseTexture_Name" -type "string" "DiffuseTexture";
	setAttr ".DiffuseTexture_Type" -type "string" "texture";
	setAttr ".DiffuseTexture" -type "float3" 0 0 0 ;
	setAttr ".DiffuseColor_Name" -type "string" "DiffuseColor";
	setAttr ".DiffuseColor_Type" -type "string" "color1x3";
	setAttr -k on ".DiffuseColor" -type "float3" 1 1 1 ;
	setAttr ".Opacity_Name" -type "string" "Opacity";
	setAttr ".Opacity_Type" -type "string" "float";
	setAttr -k on ".Opacity" 1;
	setAttr ".UseOpacityMaskTexture_Name" -type "string" "UseOpacityMaskTexture";
	setAttr ".UseOpacityMaskTexture_Type" -type "string" "bool";
	setAttr -k on ".UseOpacityMaskTexture" no;
	setAttr ".OpacityMaskTexture_Name" -type "string" "OpacityMaskTexture";
	setAttr ".OpacityMaskTexture_Type" -type "string" "texture";
	setAttr ".OpacityMaskTexture" -type "float3" 0 0 0 ;
	setAttr ".OpacityMaskBias_Name" -type "string" "OpacityMaskBias";
	setAttr ".OpacityMaskBias_Type" -type "string" "float";
	setAttr -k on ".OpacityMaskBias" 0.10000000149011612;
	setAttr ".UseSpecularTexture_Name" -type "string" "UseSpecularTexture";
	setAttr ".UseSpecularTexture_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTexture" no;
	setAttr ".SpecularTexture_Name" -type "string" "SpecularTexture";
	setAttr ".SpecularTexture_Type" -type "string" "texture";
	setAttr ".SpecularTexture" -type "float3" 0 0 0 ;
	setAttr ".SpecularColor_Name" -type "string" "SpecularColor";
	setAttr ".SpecularColor_Type" -type "string" "color1x3";
	setAttr -k on ".SpecularColor" -type "float3" 1 1 1 ;
	setAttr ".UseNormalTexture_Name" -type "string" "UseNormalTexture";
	setAttr ".UseNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseNormalTexture" yes;
	setAttr ".NormalTexture_Name" -type "string" "NormalTexture";
	setAttr ".NormalTexture_Type" -type "string" "texture";
	setAttr ".NormalTexture" -type "float3" 0 0 0 ;
	setAttr ".NormalHeight_Name" -type "string" "NormalHeight";
	setAttr ".NormalHeight_Type" -type "string" "float";
	setAttr -k on ".NormalHeight" 0.5;
	setAttr ".SupportNonUniformScale_Name" -type "string" "SupportNonUniformScale";
	setAttr ".SupportNonUniformScale_Type" -type "string" "bool";
	setAttr -k on ".SupportNonUniformScale" yes;
	setAttr ".NormalCoordsysX_Name" -type "string" "NormalCoordsysX";
	setAttr ".NormalCoordsysX_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysX" 0;
	setAttr ".NormalCoordsysY_Name" -type "string" "NormalCoordsysY";
	setAttr ".NormalCoordsysY_Type" -type "string" "enum";
	setAttr -k on ".NormalCoordsysY" 0;
	setAttr ".DisplacementModel_Name" -type "string" "DisplacementModel";
	setAttr ".DisplacementModel_Type" -type "string" "enum";
	setAttr -k on ".DisplacementModel" 0;
	setAttr ".UseDisplacementMap_Name" -type "string" "UseDisplacementMap";
	setAttr ".UseDisplacementMap_Type" -type "string" "bool";
	setAttr -k on ".UseDisplacementMap" no;
	setAttr ".DisplacementTexture_Name" -type "string" "DisplacementTexture";
	setAttr ".DisplacementTexture_Type" -type "string" "texture";
	setAttr ".DisplacementTexture" -type "float3" 0 0 0 ;
	setAttr ".VectorDisplacementCoordSys_Name" -type "string" "VectorDisplacementCoordSys";
	setAttr ".VectorDisplacementCoordSys_Type" -type "string" "enum";
	setAttr -k on ".VectorDisplacementCoordSys" 0;
	setAttr ".DisplacementHeight_Name" -type "string" "DisplacementHeight";
	setAttr ".DisplacementHeight_Type" -type "string" "float";
	setAttr -k on ".DisplacementHeight" 0.5;
	setAttr ".DisplacementOffset_Name" -type "string" "DisplacementOffset";
	setAttr ".DisplacementOffset_Type" -type "string" "float";
	setAttr -k on ".DisplacementOffset" 0.5;
	setAttr ".DisplacementClippingBias_Name" -type "string" "DisplacementClippingBias";
	setAttr ".DisplacementClippingBias_Type" -type "string" "float";
	setAttr -k on ".DisplacementClippingBias" 5;
	setAttr ".BBoxExtraScale_Name" -type "string" "BBoxExtraScale";
	setAttr ".BBoxExtraScale_Type" -type "string" "float";
	setAttr -k on ".BBoxExtraScale" 1;
	setAttr ".TessellationRange_Name" -type "string" "TessellationRange";
	setAttr ".TessellationRange_Type" -type "string" "float";
	setAttr -k on ".TessellationRange" 0;
	setAttr ".TessellationMin_Name" -type "string" "TessellationMin";
	setAttr ".TessellationMin_Type" -type "string" "float";
	setAttr -k on ".TessellationMin" 3;
	setAttr ".FlatTessellation_Name" -type "string" "FlatTessellation";
	setAttr ".FlatTessellation_Type" -type "string" "float";
	setAttr -k on ".FlatTessellation" 0;
	setAttr ".UseTranslucency_Name" -type "string" "UseTranslucency";
	setAttr ".UseTranslucency_Type" -type "string" "bool";
	setAttr -k on ".UseTranslucency" no;
	setAttr ".UseThicknessTexture_Name" -type "string" "UseThicknessTexture";
	setAttr ".UseThicknessTexture_Type" -type "string" "bool";
	setAttr -k on ".UseThicknessTexture" no;
	setAttr ".UseDiffuseIBLMap_Name" -type "string" "UseDiffuseIBLMap";
	setAttr ".UseDiffuseIBLMap_Type" -type "string" "bool";
	setAttr -k on ".UseDiffuseIBLMap" yes;
	setAttr ".DiffuseIBLIntensity_Name" -type "string" "DiffuseIBLIntensity";
	setAttr ".DiffuseIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".DiffuseIBLIntensity" 0.65499997138977051;
	setAttr ".DiffuseTexcoord_Name" -type "string" "DiffuseTexcoord";
	setAttr ".DiffuseTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DiffuseTexcoord" 0;
	setAttr ".OpacityMaskTexcoord_Name" -type "string" "OpacityMaskTexcoord";
	setAttr ".OpacityMaskTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OpacityMaskTexcoord" 0;
	setAttr ".SpecularTexcoord_Name" -type "string" "SpecularTexcoord";
	setAttr ".SpecularTexcoord_Type" -type "string" "enum";
	setAttr -k on ".SpecularTexcoord" 0;
	setAttr ".NormalTexcoord_Name" -type "string" "NormalTexcoord";
	setAttr ".NormalTexcoord_Type" -type "string" "enum";
	setAttr -k on ".NormalTexcoord" 0;
	setAttr ".DisplacementTexcoord_Name" -type "string" "DisplacementTexcoord";
	setAttr ".DisplacementTexcoord_Type" -type "string" "enum";
	setAttr -k on ".DisplacementTexcoord" 0;
	setAttr ".ThicknessTexcoord_Name" -type "string" "ThicknessTexcoord";
	setAttr ".ThicknessTexcoord_Type" -type "string" "enum";
	setAttr -k on ".ThicknessTexcoord" 0;
	setAttr ".light0ShadowMap_Name" -type "string" "light0ShadowMap";
	setAttr ".light0ShadowMap_Type" -type "string" "texture";
	setAttr ".light0ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light1ShadowMap_Name" -type "string" "light1ShadowMap";
	setAttr ".light1ShadowMap_Type" -type "string" "texture";
	setAttr ".light1ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".light2ShadowMap_Name" -type "string" "light2ShadowMap";
	setAttr ".light2ShadowMap_Type" -type "string" "texture";
	setAttr ".light2ShadowMap" -type "float3" 0 0 0 ;
	setAttr ".screenSize_Name" -type "string" "screenSize";
	setAttr ".screenSize_Type" -type "string" "float1x2";
	setAttr ".screenSize" -type "float2" 0 0 ;
	setAttr ".SkyRotation_Name" -type "string" "SkyRotation";
	setAttr ".SkyRotation_Type" -type "string" "float";
	setAttr -k on ".SkyRotation" 12.5;
	setAttr ".DiffuseCubeIBL_Name" -type "string" "DiffuseCubeIBL";
	setAttr ".DiffuseCubeIBL_Type" -type "string" "texture";
	setAttr ".DiffuseCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".UseSpecCubeIBL_Name" -type "string" "UseSpecCubeIBL";
	setAttr ".UseSpecCubeIBL_Type" -type "string" "bool";
	setAttr -k on ".UseSpecCubeIBL" yes;
	setAttr ".SpecularIBLIntensity_Name" -type "string" "SpecularIBLIntensity";
	setAttr ".SpecularIBLIntensity_Type" -type "string" "float";
	setAttr -k on ".SpecularIBLIntensity" 0.020999999716877937;
	setAttr ".SpecularCubeIBL_Name" -type "string" "SpecularCubeIBL";
	setAttr ".SpecularCubeIBL_Type" -type "string" "texture";
	setAttr ".SpecularCubeIBL" -type "float3" 0 0 0 ;
	setAttr ".LutTexture_Name" -type "string" "LutTexture";
	setAttr ".LutTexture_Type" -type "string" "texture";
	setAttr ".LutTexture" -type "float3" 0 0 0 ;
	setAttr ".DitherTexture_Name" -type "string" "DitherTexture";
	setAttr ".DitherTexture_Type" -type "string" "texture";
	setAttr ".DitherTexture" -type "float3" 0 0 0 ;
	setAttr ".skinCoeffX_Name" -type "string" "skinCoeffX";
	setAttr ".skinCoeffX_Type" -type "string" "float";
	setAttr -k on ".skinCoeffX" 0.79500001668930054;
	setAttr ".skinCoeffY_Name" -type "string" "skinCoeffY";
	setAttr ".skinCoeffY_Type" -type "string" "float";
	setAttr -k on ".skinCoeffY" 0.28799998760223389;
	setAttr ".skinCoeffZ_Name" -type "string" "skinCoeffZ";
	setAttr ".skinCoeffZ_Type" -type "string" "float";
	setAttr -k on ".skinCoeffZ" 0.030999999493360519;
	setAttr ".NormalBlurring_Name" -type "string" "NormalBlurring";
	setAttr ".NormalBlurring_Type" -type "string" "float";
	setAttr -k on ".NormalBlurring" 1;
	setAttr ".ScatteringRadiusTexture_Name" -type "string" "ScatteringRadiusTexture";
	setAttr ".ScatteringRadiusTexture_Type" -type "string" "texture";
	setAttr ".ScatteringRadiusTexture" -type "float3" 0 0 0 ;
	setAttr ".UseScatteringRadiusTexture_Name" -type "string" "UseScatteringRadiusTexture";
	setAttr ".UseScatteringRadiusTexture_Type" -type "string" "bool";
	setAttr -k on ".UseScatteringRadiusTexture" no;
	setAttr ".skinScattering_Name" -type "string" "skinScattering";
	setAttr ".skinScattering_Type" -type "string" "float";
	setAttr -k on ".skinScattering" 0.43700000643730164;
	setAttr ".shadowBlur_Name" -type "string" "shadowBlur";
	setAttr ".shadowBlur_Type" -type "string" "float";
	setAttr -k on ".shadowBlur" 1;
	setAttr ".shadowDither_Name" -type "string" "shadowDither";
	setAttr ".shadowDither_Type" -type "string" "float";
	setAttr -k on ".shadowDither" 0.086999997496604919;
	setAttr ".shadowScattering_Name" -type "string" "shadowScattering";
	setAttr ".shadowScattering_Type" -type "string" "float";
	setAttr -k on ".shadowScattering" 1;
	setAttr ".shadowSaturation_Name" -type "string" "shadowSaturation";
	setAttr ".shadowSaturation_Type" -type "string" "float";
	setAttr -k on ".shadowSaturation" 1.2740000486373901;
	setAttr ".BackScatteringThicknessTexture_Name" -type "string" "BackScatteringThicknessTexture";
	setAttr ".BackScatteringThicknessTexture_Type" -type "string" "texture";
	setAttr ".BackScatteringThicknessTexture" -type "float3" 0 0 0 ;
	setAttr ".skinScatteringRoughness_Name" -type "string" "skinScatteringRoughness";
	setAttr ".skinScatteringRoughness_Type" -type "string" "float";
	setAttr -k on ".skinScatteringRoughness" 1;
	setAttr ".skinScatteringOuterColor_Name" -type "string" "skinScatteringOuterColor";
	setAttr ".skinScatteringOuterColor_Type" -type "string" "color1x3";
	setAttr -k on ".skinScatteringOuterColor" -type "float3" 0.39607844 0.039215688 
		0 ;
	setAttr ".skinScatteringAmount_Name" -type "string" "skinScatteringAmount";
	setAttr ".skinScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinScatteringAmount" 0.57599997520446777;
	setAttr ".skinAmbientScatteringAmount_Name" -type "string" "skinAmbientScatteringAmount";
	setAttr ".skinAmbientScatteringAmount_Type" -type "string" "float";
	setAttr -k on ".skinAmbientScatteringAmount" 2.1779999732971191;
	setAttr ".UseSpecularTextureAlpha_Name" -type "string" "UseSpecularTextureAlpha";
	setAttr ".UseSpecularTextureAlpha_Type" -type "string" "bool";
	setAttr -k on ".UseSpecularTextureAlpha" no;
	setAttr ".LobeMix_Name" -type "string" "LobeMix";
	setAttr ".LobeMix_Type" -type "string" "float";
	setAttr -k on ".LobeMix" 0.77100002765655518;
	setAttr ".Roughness_Name" -type "string" "Roughness";
	setAttr ".Roughness_Type" -type "string" "float";
	setAttr -k on ".Roughness" 0.31000000238418579;
	setAttr ".OcclusionTexture_Name" -type "string" "OcclusionTexture";
	setAttr ".OcclusionTexture_Type" -type "string" "texture";
	setAttr ".OcclusionTexture" -type "float3" 0 0 0 ;
	setAttr ".OcclusionAmount_Name" -type "string" "OcclusionAmount";
	setAttr ".OcclusionAmount_Type" -type "string" "float";
	setAttr -k on ".OcclusionAmount" 0.5;
	setAttr ".UseCavityTexture_Name" -type "string" "UseCavityTexture";
	setAttr ".UseCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseCavityTexture" no;
	setAttr ".CavityTexture_Name" -type "string" "CavityTexture";
	setAttr ".CavityTexture_Type" -type "string" "texture";
	setAttr ".CavityTexture" -type "float3" 0 0 0 ;
	setAttr ".CavityAmount_Name" -type "string" "CavityAmount";
	setAttr ".CavityAmount_Type" -type "string" "float";
	setAttr -k on ".CavityAmount" 1;
	setAttr ".UseMicroCavityTexture_Name" -type "string" "UseMicroCavityTexture";
	setAttr ".UseMicroCavityTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroCavityTexture" no;
	setAttr ".MicroCavityTexture_Name" -type "string" "MicroCavityTexture";
	setAttr ".MicroCavityTexture_Type" -type "string" "texture";
	setAttr ".MicroCavityTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroCavityAmount_Name" -type "string" "MicroCavityAmount";
	setAttr ".MicroCavityAmount_Type" -type "string" "float";
	setAttr -k on ".MicroCavityAmount" 1;
	setAttr ".UseMicroNormalTexture_Name" -type "string" "UseMicroNormalTexture";
	setAttr ".UseMicroNormalTexture_Type" -type "string" "bool";
	setAttr -k on ".UseMicroNormalTexture" no;
	setAttr ".MicroNormalTexture_Name" -type "string" "MicroNormalTexture";
	setAttr ".MicroNormalTexture_Type" -type "string" "texture";
	setAttr ".MicroNormalTexture" -type "float3" 0 0 0 ;
	setAttr ".MicroNormalHeight_Name" -type "string" "MicroNormalHeight";
	setAttr ".MicroNormalHeight_Type" -type "string" "float";
	setAttr -k on ".MicroNormalHeight" 1;
	setAttr ".MicroScale_Name" -type "string" "MicroScale";
	setAttr ".MicroScale_Type" -type "string" "float";
	setAttr -k on ".MicroScale" 32;
	setAttr ".UseBlendTexture_Name" -type "string" "UseBlendTexture";
	setAttr ".UseBlendTexture_Type" -type "string" "bool";
	setAttr -k on ".UseBlendTexture" no;
	setAttr ".OcclusionTexcoord_Name" -type "string" "OcclusionTexcoord";
	setAttr ".OcclusionTexcoord_Type" -type "string" "enum";
	setAttr -k on ".OcclusionTexcoord" 1;
	setAttr ".Position_Name" -type "string" "Position";
	setAttr ".Position_Source" -type "string" "position";
	setAttr ".TexCoord0_Name" -type "string" "TexCoord0";
	setAttr ".TexCoord0_Source" -type "string" "uv:map1";
	setAttr ".TexCoord0_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord1_Name" -type "string" "TexCoord1";
	setAttr ".TexCoord1_Source" -type "string" "uv:map2";
	setAttr ".TexCoord1_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".TexCoord2_Name" -type "string" "TexCoord2";
	setAttr ".TexCoord2_Source" -type "string" "uv:map3";
	setAttr ".TexCoord2_DefaultTexture" -type "string" "DiffuseTexture";
	setAttr ".Normal_Name" -type "string" "Normal";
	setAttr ".Normal_Source" -type "string" "normal";
	setAttr ".Binormal0_Name" -type "string" "Binormal0";
	setAttr ".Binormal0_Source" -type "string" "binormal:map1";
	setAttr ".Tangent0_Name" -type "string" "Tangent0";
	setAttr ".Tangent0_Source" -type "string" "tangent:map1";
createNode shadingEngine -n "shader_eyeRight_shaderSG";
	rename -uid "08DB0D16-457D-7243-3E69-0798544194EB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
	rename -uid "A70EE1B4-4586-A185-7842-5DB58FCBFC41";
createNode blinn -n "shader_eyeshell_shader";
	rename -uid "3E72F4E7-4540-EFD6-90B8-3D99D80B4B35";
	setAttr ".it" -type "float3" 0.97000003 0.97000003 0.97000003 ;
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".ec" 0.20000000298023224;
	setAttr ".sro" 0.20000000298023224;
createNode shadingEngine -n "shader_eyeshell_shaderSG";
	rename -uid "4132A590-46B4-5FFE-17AF-FD8910E2169C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "BA30FFE2-490D-49F7-DF36-9FA95F3F231E";
createNode blinn -n "shader_eyelashes_shader";
	rename -uid "CDFC281A-42C5-CEEF-15C1-2A95DD22968F";
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".ec" 0.20000000298023224;
	setAttr ".sro" 0.20000000298023224;
createNode shadingEngine -n "shader_eyelashes_shaderSG";
	rename -uid "0EDFA50A-4708-7F7E-4BD3-5AADADC4C8BC";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
	rename -uid "35015A5B-481E-09FF-020E-9282579A0328";
createNode blinn -n "shader_eyelashesShadow_shader";
	rename -uid "29FDA1D0-4827-4715-B5FF-0A90C10EA067";
	setAttr ".it" -type "float3" 1 1 1 ;
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".ec" 0.20000000298023224;
	setAttr ".sro" 0.20000000298023224;
createNode shadingEngine -n "shader_eyelashesShadow_shaderSG";
	rename -uid "4A350F6C-4197-6714-EAD8-079EB9404285";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
	rename -uid "0DABDD32-478C-CB30-2B38-2CB15CD03FCA";
createNode blinn -n "shader_eyeEdge_shader";
	rename -uid "0F029626-4DD0-1000-A2F4-57834E9B2456";
	setAttr ".it" -type "float3" 0.89999998 0.89999998 0.89999998 ;
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".ec" 0.20000000298023224;
	setAttr ".sro" 0.20000000298023224;
createNode shadingEngine -n "shader_eyeEdge_shaderSG";
	rename -uid "A6868C2B-4DAA-C33C-8598-E4B2CD78F53E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
	rename -uid "0C4D46BA-4695-DB5B-25B7-1C97AA87D7E9";
createNode file -n "baseMapFile_dx11_diffuseIrradiance";
	rename -uid "23F1BF79-4B31-3F7D-B2FA-36ABECFBB427";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/maps/dx11_diffuseIrradiance_map.dds";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_dx11_specularIrradiance";
	rename -uid "F5E75DA3-4947-2290-AFE5-96A845991E8C";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/maps/dx11_specularIrradiance_map.dds";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_dx11_jitter";
	rename -uid "8409A0AC-49BC-1ACC-8ECF-4FAE1A1FA1D1";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/maps/dx11_jitter_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_dx11_skinLUT";
	rename -uid "B4922940-4205-4CA2-458A-4C96D8C8461B";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/maps/dx11_skinLUT_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_head_color";
	rename -uid "722F9311-4BBA-D218-B589-17B6D45D5075";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_cm1_color";
	rename -uid "A679444E-4346-772D-769B-CC81935051BA";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_cm1_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_cm2_color";
	rename -uid "0E1F7B77-40A0-5F0B-7F47-4098DC7D262C";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_cm2_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_cm3_color";
	rename -uid "85C975E2-43D9-2625-AE7E-1D935C067AC6";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_cm3_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_head_normal";
	rename -uid "25C0C890-4B78-B420-6EB1-F08AE9263FC1";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_wm1_normal";
	rename -uid "B5289838-43D7-B9DA-38D0-8C83ADAB1E11";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_wm2_normal";
	rename -uid "D9D451EE-4485-EB2D-2E36-E2A9BE18D1E3";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "mapFile_head_wm3_normal";
	rename -uid "26D9019B-4B20-C6AF-C99C-2CB82044CAA1";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_head_cavity";
	rename -uid "BE857633-40BA-F4A9-BB1A-F6B78137E888";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_cavity_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_blink_L";
	rename -uid "91361518-445B-4451-2E3B-8A9BE930F9E2";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_blink_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_blink_R";
	rename -uid "A7235AE1-421E-EF06-B887-D09927A803E2";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_blink_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_browsRaiseInner_L";
	rename -uid "C834CE2A-43A0-F39F-F702-B6A4078F9C0A";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_browsRaiseInner_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_browsRaiseInner_R";
	rename -uid "DC02C7E0-486C-F927-2EC2-21884539BB15";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_browsRaiseInner_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_browsRaiseOuter_L";
	rename -uid "21CACE3C-4209-4F2B-0D98-C28757094B0B";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_browsRaiseOuter_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_browsRaiseOuter_R";
	rename -uid "FBA67835-447F-ECB7-F2B7-13B461D9380C";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_browsRaiseOuter_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_chinRaise_L";
	rename -uid "2DFBCA2D-4C7D-4E5A-B39E-1B91329DE3F8";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_chinRaise_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_chinRaise_R";
	rename -uid "777AE005-4E77-C9B8-FC9F-5B88534111DB";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_chinRaise_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_jawOpen";
	rename -uid "9E74927E-471B-3704-4C30-4C94358F0EAA";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_jawOpen_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_purse_DL";
	rename -uid "EB62726E-4FEC-356E-2EEF-21A2C367AB56";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_purse_DL_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_purse_DR";
	rename -uid "3C996D8C-4082-8ABF-D1D3-C0A52E92A23E";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_purse_DR_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_purse_UL";
	rename -uid "7CE84665-4D42-FFD0-A79C-38B3390E7BAF";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_purse_UL_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_purse_UR";
	rename -uid "50C3047A-4E58-5CA1-9E4C-81B5AA8FF5CD";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_purse_UR_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_squintInner_L";
	rename -uid "073CC0B7-4868-AC36-4915-5BA7A1C25A2D";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_squintInner_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm1_squintInner_R";
	rename -uid "42D2A40D-4121-CC7B-E50E-F1835FF6BA65";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm1_squintInner_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_browsDown_L";
	rename -uid "4B9D557E-4A01-0C9A-2698-0C98A77E66E2";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_browsDown_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_browsDown_R";
	rename -uid "BAD4D122-4C88-263B-5CCA-52AEBE8965A5";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_browsDown_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_browsLateral_L";
	rename -uid "960C388E-4130-A4FF-32F6-DC89E94553A2";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_browsLateral_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_browsLateral_R";
	rename -uid "CB0E5006-4858-283A-8ED4-C2B8E91BDA58";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_browsLateral_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_mouthStretch_L";
	rename -uid "11F7806B-48CD-E6E6-D626-B59450BEB900";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_mouthStretch_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_mouthStretch_R";
	rename -uid "4E3CE38C-48FA-4393-0062-50A86B60F43D";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_mouthStretch_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_neckStretch_L";
	rename -uid "34C32F57-4F18-5DBE-D17F-C0B61EFE8F85";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_neckStretch_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_neckStretch_R";
	rename -uid "F7B7CE3A-45A4-F62F-C3E4-1B98812DC10D";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_neckStretch_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_noseWrinkler_L";
	rename -uid "B3B2708D-4505-429B-AEBE-6681412675F5";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_noseWrinkler_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm2_noseWrinkler_R";
	rename -uid "A2D212EB-4F4E-8400-1BDB-298467CA65E1";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm2_noseWrinkler_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseInner_L";
	rename -uid "F2BA15F1-4DE9-AADE-F965-9F931B9A3AA4";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseInner_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseInner_R";
	rename -uid "5F0AFDFF-40CE-DBE5-DBAE-03B0F29E8334";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseInner_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseOuter_L";
	rename -uid "F60460E9-477A-7673-06A3-AD972C0C2D62";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseOuter_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseOuter_R";
	rename -uid "6B562DFD-424A-874F-ED6C-798A825DC890";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseOuter_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseUpper_L";
	rename -uid "A2BDE9B1-45B0-0F46-B936-E2AFB02AB7B6";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseUpper_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_cheekRaiseUpper_R";
	rename -uid "87411C60-4DF3-E7EA-6D78-0E84496A30F3";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_cheekRaiseUpper_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_smile_L";
	rename -uid "1E9D65BD-4458-BBDE-ED6A-4A8E6BEB8AB1";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_smile_L_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm3_smile_R";
	rename -uid "45A29737-4B56-A3CD-1B3B-F787C59947EC";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm3_smile_R_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm13_lips_DL";
	rename -uid "7F5949B2-4183-64CF-E628-F8A4A8081BA8";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm13_lips_DL_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm13_lips_DR";
	rename -uid "38EF5569-4CC9-A9CB-14FA-CB8F3BD5173A";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm13_lips_DR_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm13_lips_UL";
	rename -uid "0F981403-487C-D2C8-80FC-4D8F2C430A53";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm13_lips_UL_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "maskFile_head_wm13_lips_UR";
	rename -uid "2472A5AF-4EE9-748C-9F81-CDB66B647AA0";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/head_wm13_lips_UR_msk.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_teeth_color";
	rename -uid "06DE46C6-4DEE-80C4-4F56-A1B2AFE2C9CC";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/teeth_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_teeth_normal";
	rename -uid "37ABA80D-483E-C1F4-3743-5782F241352E";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/teeth_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_eyes_color";
	rename -uid "2C5CE88F-4100-916C-F571-C9B4FF3E4464";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/eyes_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_eyes_normal";
	rename -uid "76113BEE-474E-BF46-2F98-C98AAB36C098";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/eyes_normal_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode file -n "baseMapFile_eyelashes_color";
	rename -uid "4BBAA10E-4FC9-326C-CABF-C38F37ECEE20";
	setAttr ".ftn" -type "string" "$PROJECT_ROOT/Common/SourceAssets/masks/eyelashes_color_map.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo1";
	rename -uid "14159383-4987-9C61-EACB-32895CF4C8BE";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo2";
	rename -uid "782A145D-4DB8-5E8D-F4BC-83AFB5738FF1";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo1";
	rename -uid "14132E49-44D5-D6FB-9AFF-01BBFBBD79FA";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo4";
	rename -uid "C618C44F-42E2-1860-509D-98B02734C109";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "01654B32-41C8-7686-6EC9-FC96D34D05D2";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "skeleton_015_hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "749886FE-4137-2C09-9FD0-6FB9DA7E946B";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "01B83B1A-4A70-70DD-9752-6DBD68D9C095";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -330.95236780151544 -323.80951094248991 ;
	setAttr ".tgi[0].vh" -type "double2" 317.85713022663526 338.09522466054096 ;
	setAttr -s 32 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1517.142822265625;
	setAttr ".tgi[0].ni[0].y" 838.5714111328125;
	setAttr ".tgi[0].ni[0].nvs" 1922;
	setAttr ".tgi[0].ni[1].x" -1502.857177734375;
	setAttr ".tgi[0].ni[1].y" 798.5714111328125;
	setAttr ".tgi[0].ni[1].nvs" 1922;
	setAttr ".tgi[0].ni[2].x" 1320;
	setAttr ".tgi[0].ni[2].y" 850;
	setAttr ".tgi[0].ni[2].nvs" 1922;
	setAttr ".tgi[0].ni[3].x" 998.5714111328125;
	setAttr ".tgi[0].ni[3].y" 955.71429443359375;
	setAttr ".tgi[0].ni[3].nvs" 1922;
	setAttr ".tgi[0].ni[4].x" 998.5714111328125;
	setAttr ".tgi[0].ni[4].y" 771.4285888671875;
	setAttr ".tgi[0].ni[4].nvs" 1922;
	setAttr ".tgi[0].ni[5].x" 1320;
	setAttr ".tgi[0].ni[5].y" 665.71429443359375;
	setAttr ".tgi[0].ni[5].nvs" 1922;
	setAttr ".tgi[0].ni[6].x" 647.14288330078125;
	setAttr ".tgi[0].ni[6].y" 950;
	setAttr ".tgi[0].ni[6].nvs" 1922;
	setAttr ".tgi[0].ni[7].x" 1320;
	setAttr ".tgi[0].ni[7].y" 1218.5714111328125;
	setAttr ".tgi[0].ni[7].nvs" 1922;
	setAttr ".tgi[0].ni[8].x" 998.5714111328125;
	setAttr ".tgi[0].ni[8].y" 1174.2857666015625;
	setAttr ".tgi[0].ni[8].nvs" 1922;
	setAttr ".tgi[0].ni[9].x" -1195.7142333984375;
	setAttr ".tgi[0].ni[9].y" 817.14288330078125;
	setAttr ".tgi[0].ni[9].nvs" 1922;
	setAttr ".tgi[0].ni[10].x" 1320;
	setAttr ".tgi[0].ni[10].y" 504.28570556640625;
	setAttr ".tgi[0].ni[10].nvs" 1922;
	setAttr ".tgi[0].ni[11].x" -888.5714111328125;
	setAttr ".tgi[0].ni[11].y" 841.4285888671875;
	setAttr ".tgi[0].ni[11].nvs" 1922;
	setAttr ".tgi[0].ni[12].x" -581.4285888671875;
	setAttr ".tgi[0].ni[12].y" 597.14288330078125;
	setAttr ".tgi[0].ni[12].nvs" 1922;
	setAttr ".tgi[0].ni[13].x" 1320;
	setAttr ".tgi[0].ni[13].y" -237.14285278320313;
	setAttr ".tgi[0].ni[13].nvs" 1922;
	setAttr ".tgi[0].ni[14].x" -274.28570556640625;
	setAttr ".tgi[0].ni[14].y" 512.85711669921875;
	setAttr ".tgi[0].ni[14].nvs" 1922;
	setAttr ".tgi[0].ni[15].x" 1320;
	setAttr ".tgi[0].ni[15].y" -505.71429443359375;
	setAttr ".tgi[0].ni[15].nvs" 1922;
	setAttr ".tgi[0].ni[16].x" 1320;
	setAttr ".tgi[0].ni[16].y" -690;
	setAttr ".tgi[0].ni[16].nvs" 1922;
	setAttr ".tgi[0].ni[17].x" 32.857143402099609;
	setAttr ".tgi[0].ni[17].y" 342.85714721679688;
	setAttr ".tgi[0].ni[17].nvs" 1922;
	setAttr ".tgi[0].ni[18].x" 1320;
	setAttr ".tgi[0].ni[18].y" -874.28570556640625;
	setAttr ".tgi[0].ni[18].nvs" 1922;
	setAttr ".tgi[0].ni[19].x" 340;
	setAttr ".tgi[0].ni[19].y" 760;
	setAttr ".tgi[0].ni[19].nvs" 1922;
	setAttr ".tgi[0].ni[20].x" 1320;
	setAttr ".tgi[0].ni[20].y" 85.714286804199219;
	setAttr ".tgi[0].ni[20].nvs" 1922;
	setAttr ".tgi[0].ni[21].x" 647.14288330078125;
	setAttr ".tgi[0].ni[21].y" 288.57144165039063;
	setAttr ".tgi[0].ni[21].nvs" 1922;
	setAttr ".tgi[0].ni[22].x" 1320;
	setAttr ".tgi[0].ni[22].y" -75.714286804199219;
	setAttr ".tgi[0].ni[22].nvs" 1922;
	setAttr ".tgi[0].ni[23].x" 998.5714111328125;
	setAttr ".tgi[0].ni[23].y" 552.85711669921875;
	setAttr ".tgi[0].ni[23].nvs" 1922;
	setAttr ".tgi[0].ni[24].x" 998.5714111328125;
	setAttr ".tgi[0].ni[24].y" -1078.5714111328125;
	setAttr ".tgi[0].ni[24].nvs" 1922;
	setAttr ".tgi[0].ni[25].x" 998.5714111328125;
	setAttr ".tgi[0].ni[25].y" -470;
	setAttr ".tgi[0].ni[25].nvs" 1922;
	setAttr ".tgi[0].ni[26].x" 1320;
	setAttr ".tgi[0].ni[26].y" 320;
	setAttr ".tgi[0].ni[26].nvs" 1922;
	setAttr ".tgi[0].ni[27].x" 998.5714111328125;
	setAttr ".tgi[0].ni[27].y" 254.28572082519531;
	setAttr ".tgi[0].ni[27].nvs" 1922;
	setAttr ".tgi[0].ni[28].x" 1320;
	setAttr ".tgi[0].ni[28].y" 1034.2857666015625;
	setAttr ".tgi[0].ni[28].nvs" 1922;
	setAttr ".tgi[0].ni[29].x" 998.5714111328125;
	setAttr ".tgi[0].ni[29].y" 70;
	setAttr ".tgi[0].ni[29].nvs" 1922;
	setAttr ".tgi[0].ni[30].x" 998.5714111328125;
	setAttr ".tgi[0].ni[30].y" -745.71429443359375;
	setAttr ".tgi[0].ni[30].nvs" 1922;
	setAttr ".tgi[0].ni[31].x" 998.5714111328125;
	setAttr ".tgi[0].ni[31].y" -285.71429443359375;
	setAttr ".tgi[0].ni[31].nvs" 1922;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo2";
	rename -uid "145CD280-44CE-FF7C-7C2F-598EC8F48331";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -323.80951094248991 -330.95236780151544 ;
	setAttr ".tgi[0].vh" -type "double2" 324.99998708566085 330.95236780151544 ;
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo8";
	rename -uid "9EBCA29C-4F60-25C7-4118-4CAC6076DB71";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo9";
	rename -uid "429B6F17-4581-4067-D58E-1EA927B2D0C0";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo3";
	rename -uid "732C00B2-40E6-2CDC-49FE-B28F30B26910";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo10";
	rename -uid "4F62F2A2-4464-D344-9715-9B94864A5AD7";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo2";
	rename -uid "3B92B95D-4607-5563-0814-42A1F236D2FA";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo5";
	rename -uid "4DA4A39C-401D-1AAD-CF07-97A0F0B87BC0";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo5";
	rename -uid "9A668D43-435A-752C-1A98-FA803F2CE156";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo6";
	rename -uid "06966ECE-4A8C-7682-EC3E-349577584C96";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo2";
	rename -uid "8C2DFF99-4AC5-B2EF-2F27-EC87F4E17A51";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo7";
	rename -uid "0EB083BC-4177-F1E8-3F03-B9B6F28E3F49";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "1708B0C5-46E0-2DAA-DDFE-08B7E8E66635";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo3";
	rename -uid "CE8F8401-49D3-4676-219C-8BA4EA6C683A";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode animLayer -n "BaseAnimation";
	rename -uid "39AE5AE3-4966-E594-40C2-6EAE4E4C2BA7";
	setAttr ".pref" yes;
	setAttr ".slct" yes;
	setAttr ".ovrd" yes;
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo11";
	rename -uid "73362A08-48E6-F375-BAFB-8BB9A656AC43";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo12";
	rename -uid "B6EA4974-4D18-AE12-6E54-8F9F56547531";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo4";
	rename -uid "59C6FF06-421A-5DE1-B933-DBAFF2C5D5CD";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo13";
	rename -uid "4762D3DC-46A4-556D-CA59-6CBB04B7988A";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo3";
	rename -uid "AE1FD8F1-482C-36F9-3A8C-CFA961DD54CB";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo6";
	rename -uid "8ED089A1-484D-8821-BFA9-18A9A243F1DB";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo7";
	rename -uid "80BC8964-478B-615A-1589-0D918B4AC09C";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -330.95236780151544 -323.80951094248991 ;
	setAttr ".tgi[0].vh" -type "double2" 317.85713022663526 338.09522466054096 ;
	setAttr -s 32 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1517.142822265625;
	setAttr ".tgi[0].ni[0].y" 838.5714111328125;
	setAttr ".tgi[0].ni[0].nvs" 1922;
	setAttr ".tgi[0].ni[1].x" -1502.857177734375;
	setAttr ".tgi[0].ni[1].y" 798.5714111328125;
	setAttr ".tgi[0].ni[1].nvs" 1922;
	setAttr ".tgi[0].ni[2].x" 1320;
	setAttr ".tgi[0].ni[2].y" 850;
	setAttr ".tgi[0].ni[2].nvs" 1922;
	setAttr ".tgi[0].ni[3].x" 998.5714111328125;
	setAttr ".tgi[0].ni[3].y" 955.71429443359375;
	setAttr ".tgi[0].ni[3].nvs" 1922;
	setAttr ".tgi[0].ni[4].x" 998.5714111328125;
	setAttr ".tgi[0].ni[4].y" 771.4285888671875;
	setAttr ".tgi[0].ni[4].nvs" 1922;
	setAttr ".tgi[0].ni[5].x" 1320;
	setAttr ".tgi[0].ni[5].y" 665.71429443359375;
	setAttr ".tgi[0].ni[5].nvs" 1922;
	setAttr ".tgi[0].ni[6].x" 647.14288330078125;
	setAttr ".tgi[0].ni[6].y" 950;
	setAttr ".tgi[0].ni[6].nvs" 1922;
	setAttr ".tgi[0].ni[7].x" 1320;
	setAttr ".tgi[0].ni[7].y" 1218.5714111328125;
	setAttr ".tgi[0].ni[7].nvs" 1922;
	setAttr ".tgi[0].ni[8].x" 998.5714111328125;
	setAttr ".tgi[0].ni[8].y" 1174.2857666015625;
	setAttr ".tgi[0].ni[8].nvs" 1922;
	setAttr ".tgi[0].ni[9].x" -1195.7142333984375;
	setAttr ".tgi[0].ni[9].y" 817.14288330078125;
	setAttr ".tgi[0].ni[9].nvs" 1922;
	setAttr ".tgi[0].ni[10].x" 1320;
	setAttr ".tgi[0].ni[10].y" 504.28570556640625;
	setAttr ".tgi[0].ni[10].nvs" 1922;
	setAttr ".tgi[0].ni[11].x" -888.5714111328125;
	setAttr ".tgi[0].ni[11].y" 841.4285888671875;
	setAttr ".tgi[0].ni[11].nvs" 1922;
	setAttr ".tgi[0].ni[12].x" -581.4285888671875;
	setAttr ".tgi[0].ni[12].y" 597.14288330078125;
	setAttr ".tgi[0].ni[12].nvs" 1922;
	setAttr ".tgi[0].ni[13].x" 1320;
	setAttr ".tgi[0].ni[13].y" -237.14285278320313;
	setAttr ".tgi[0].ni[13].nvs" 1922;
	setAttr ".tgi[0].ni[14].x" -274.28570556640625;
	setAttr ".tgi[0].ni[14].y" 512.85711669921875;
	setAttr ".tgi[0].ni[14].nvs" 1922;
	setAttr ".tgi[0].ni[15].x" 1320;
	setAttr ".tgi[0].ni[15].y" -505.71429443359375;
	setAttr ".tgi[0].ni[15].nvs" 1922;
	setAttr ".tgi[0].ni[16].x" 1320;
	setAttr ".tgi[0].ni[16].y" -690;
	setAttr ".tgi[0].ni[16].nvs" 1922;
	setAttr ".tgi[0].ni[17].x" 32.857143402099609;
	setAttr ".tgi[0].ni[17].y" 342.85714721679688;
	setAttr ".tgi[0].ni[17].nvs" 1922;
	setAttr ".tgi[0].ni[18].x" 1320;
	setAttr ".tgi[0].ni[18].y" -874.28570556640625;
	setAttr ".tgi[0].ni[18].nvs" 1922;
	setAttr ".tgi[0].ni[19].x" 340;
	setAttr ".tgi[0].ni[19].y" 760;
	setAttr ".tgi[0].ni[19].nvs" 1922;
	setAttr ".tgi[0].ni[20].x" 1320;
	setAttr ".tgi[0].ni[20].y" 85.714286804199219;
	setAttr ".tgi[0].ni[20].nvs" 1922;
	setAttr ".tgi[0].ni[21].x" 647.14288330078125;
	setAttr ".tgi[0].ni[21].y" 288.57144165039063;
	setAttr ".tgi[0].ni[21].nvs" 1922;
	setAttr ".tgi[0].ni[22].x" 1320;
	setAttr ".tgi[0].ni[22].y" -75.714286804199219;
	setAttr ".tgi[0].ni[22].nvs" 1922;
	setAttr ".tgi[0].ni[23].x" 998.5714111328125;
	setAttr ".tgi[0].ni[23].y" 552.85711669921875;
	setAttr ".tgi[0].ni[23].nvs" 1922;
	setAttr ".tgi[0].ni[24].x" 998.5714111328125;
	setAttr ".tgi[0].ni[24].y" -1078.5714111328125;
	setAttr ".tgi[0].ni[24].nvs" 1922;
	setAttr ".tgi[0].ni[25].x" 998.5714111328125;
	setAttr ".tgi[0].ni[25].y" -470;
	setAttr ".tgi[0].ni[25].nvs" 1922;
	setAttr ".tgi[0].ni[26].x" 1320;
	setAttr ".tgi[0].ni[26].y" 320;
	setAttr ".tgi[0].ni[26].nvs" 1922;
	setAttr ".tgi[0].ni[27].x" 998.5714111328125;
	setAttr ".tgi[0].ni[27].y" 254.28572082519531;
	setAttr ".tgi[0].ni[27].nvs" 1922;
	setAttr ".tgi[0].ni[28].x" 1320;
	setAttr ".tgi[0].ni[28].y" 1034.2857666015625;
	setAttr ".tgi[0].ni[28].nvs" 1922;
	setAttr ".tgi[0].ni[29].x" 998.5714111328125;
	setAttr ".tgi[0].ni[29].y" 70;
	setAttr ".tgi[0].ni[29].nvs" 1922;
	setAttr ".tgi[0].ni[30].x" 998.5714111328125;
	setAttr ".tgi[0].ni[30].y" -745.71429443359375;
	setAttr ".tgi[0].ni[30].nvs" 1922;
	setAttr ".tgi[0].ni[31].x" 998.5714111328125;
	setAttr ".tgi[0].ni[31].y" -285.71429443359375;
	setAttr ".tgi[0].ni[31].nvs" 1922;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo8";
	rename -uid "A51E528C-42D6-3C56-F4BC-F4A1898C389C";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -323.80951094248991 -330.95236780151544 ;
	setAttr ".tgi[0].vh" -type "double2" 324.99998708566085 330.95236780151544 ;
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo17";
	rename -uid "9C24CC1E-45E3-D73D-B0ED-54801CA1D618";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo18";
	rename -uid "E459A66D-481D-D442-E8E2-F49F204FD8D1";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo6";
	rename -uid "E94E0393-4214-2855-EC59-65913192F9F9";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo19";
	rename -uid "C15167D7-4B70-C741-B24A-97A8844C3DE5";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo5";
	rename -uid "0822E6FB-4953-D625-58C0-F7BB07355E25";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo10";
	rename -uid "7E6FD770-4361-BDBE-24B7-DB94D8343F53";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo14";
	rename -uid "F9D1C673-43F2-7F2C-B524-21A20D24F39E";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo15";
	rename -uid "7BB98078-4662-C4AD-A44C-1396FD4FF908";
createNode nodeGraphEditorBookmarkInfo -n "JointMover_nodeGraphEditorBookmarkInfo5";
	rename -uid "804FC654-409C-A09E-AD63-729B633F8205";
createNode nodeGraphEditorBookmarkInfo -n "nodeGraphEditorBookmarkInfo16";
	rename -uid "B5558253-4C81-6B0C-7279-40AE4273E640";
	addAttr -ci true -sn "rigModule" -ln "rigModule" -dt "string";
	setAttr ".vl" -type "double2" -113.09523809523813 -739.16292609940172 ;
	setAttr ".vh" -type "double2" 552.38095238095241 92.682311995836656 ;
	setAttr ".rigModule" -type "string" "faceModule";
createNode nodeGraphEditorInfo -n "faceMask_low_hyperShadePrimaryNodeEditorSavedTabsInfo4";
	rename -uid "26F87E92-4EEB-14AE-D551-8C8B2288FF0A";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1681.7975162529422 -433.33331611421443 ;
	setAttr ".tgi[0].vh" -type "double2" 1660.3689456758657 452.38093440494913 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo9";
	rename -uid "50F6A87F-4F60-D52E-AC8C-2E841417E0E2";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -650.23992537612548 -757.14282705670439 ;
	setAttr ".tgi[0].vh" -type "double2" 1889.5255904170522 541.66664514276806 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo11";
	rename -uid "94769AF7-4458-2DBD-8BBE-8BA87E818A15";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -332.47365071468624 -366.66665209664302 ;
	setAttr ".tgi[0].vh" -type "double2" 401.52126701859942 382.1428419578649 ;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo12";
	rename -uid "F8546B9F-41A8-D8FA-BD86-A0B8D8A3449A";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1277.4406000935428 -178.26989501506873 ;
	setAttr ".tgi[0].vh" -type "double2" 581.03553706445609 490.35014659303152 ;
	setAttr -s 3 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -418.57144165039063;
	setAttr ".tgi[0].ni[0].y" 440;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -725.71429443359375;
	setAttr ".tgi[0].ni[1].y" 291.42855834960938;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -111.42857360839844;
	setAttr ".tgi[0].ni[2].y" 440;
	setAttr ".tgi[0].ni[2].nvs" 1923;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av -k on ".unw";
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hwi";
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -av ".etmr";
	setAttr -av ".tmr";
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".blen";
	setAttr -k on ".blat";
	setAttr -av ".msaa";
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 11 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 13 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :defaultTextureList1;
	setAttr -s 55 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
lockNode -l 0 -lu 1;
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -cb on ".hwcc";
	setAttr -cb on ".hwdp";
	setAttr -cb on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_head_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_teeth_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_saliva_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyeLeft_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyeRight_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyeshell_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyelashes_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyelashesShadow_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shader_eyeEdge_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_head_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_teeth_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_saliva_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyeLeft_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyeRight_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyeshell_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyelashes_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyelashesShadow_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shader_eyeEdge_shaderSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "baseMapFile_dx11_diffuseIrradiance.oc" "shader_head_shader.DiffuseCubeIBL"
		;
connectAttr "baseMapFile_dx11_specularIrradiance.oc" "shader_head_shader.SpecularCubeIBL"
		;
connectAttr "baseMapFile_dx11_jitter.oc" "shader_head_shader.DitherTexture";
connectAttr "baseMapFile_dx11_skinLUT.oc" "shader_head_shader.LutTexture";
connectAttr "baseMapFile_head_color.oc" "shader_head_shader.DiffuseTexture";
connectAttr "mapFile_head_cm1_color.oc" "shader_head_shader.animColorMap_00";
connectAttr "mapFile_head_cm2_color.oc" "shader_head_shader.animColorMap_01";
connectAttr "mapFile_head_cm3_color.oc" "shader_head_shader.animColorMap_02";
connectAttr "baseMapFile_head_normal.oc" "shader_head_shader.NormalTexture";
connectAttr "mapFile_head_wm1_normal.oc" "shader_head_shader.animNormalMap_00";
connectAttr "mapFile_head_wm2_normal.oc" "shader_head_shader.animNormalMap_01";
connectAttr "mapFile_head_wm3_normal.oc" "shader_head_shader.animNormalMap_02";
connectAttr "baseMapFile_head_cavity.oc" "shader_head_shader.CavityTexture";
connectAttr "maskFile_head_wm1_blink_L.oc" "shader_head_shader.maskChannel_00";
connectAttr "maskFile_head_wm1_blink_R.oc" "shader_head_shader.maskChannel_01";
connectAttr "maskFile_head_wm1_browsRaiseInner_L.oc" "shader_head_shader.maskChannel_02"
		;
connectAttr "maskFile_head_wm1_browsRaiseInner_R.oc" "shader_head_shader.maskChannel_03"
		;
connectAttr "maskFile_head_wm1_browsRaiseOuter_L.oc" "shader_head_shader.maskChannel_04"
		;
connectAttr "maskFile_head_wm1_browsRaiseOuter_R.oc" "shader_head_shader.maskChannel_05"
		;
connectAttr "maskFile_head_wm1_chinRaise_L.oc" "shader_head_shader.maskChannel_06"
		;
connectAttr "maskFile_head_wm1_chinRaise_R.oc" "shader_head_shader.maskChannel_07"
		;
connectAttr "maskFile_head_wm1_jawOpen.oc" "shader_head_shader.maskChannel_08";
connectAttr "maskFile_head_wm1_purse_DL.oc" "shader_head_shader.maskChannel_09";
connectAttr "maskFile_head_wm1_purse_DR.oc" "shader_head_shader.maskChannel_10";
connectAttr "maskFile_head_wm1_purse_UL.oc" "shader_head_shader.maskChannel_11";
connectAttr "maskFile_head_wm1_purse_UR.oc" "shader_head_shader.maskChannel_12";
connectAttr "maskFile_head_wm1_squintInner_L.oc" "shader_head_shader.maskChannel_13"
		;
connectAttr "maskFile_head_wm1_squintInner_R.oc" "shader_head_shader.maskChannel_14"
		;
connectAttr "maskFile_head_wm2_browsDown_L.oc" "shader_head_shader.maskChannel_15"
		;
connectAttr "maskFile_head_wm2_browsDown_R.oc" "shader_head_shader.maskChannel_16"
		;
connectAttr "maskFile_head_wm2_browsLateral_L.oc" "shader_head_shader.maskChannel_17"
		;
connectAttr "maskFile_head_wm2_browsLateral_R.oc" "shader_head_shader.maskChannel_18"
		;
connectAttr "maskFile_head_wm2_mouthStretch_L.oc" "shader_head_shader.maskChannel_19"
		;
connectAttr "maskFile_head_wm2_mouthStretch_R.oc" "shader_head_shader.maskChannel_20"
		;
connectAttr "maskFile_head_wm2_neckStretch_L.oc" "shader_head_shader.maskChannel_21"
		;
connectAttr "maskFile_head_wm2_neckStretch_R.oc" "shader_head_shader.maskChannel_22"
		;
connectAttr "maskFile_head_wm2_noseWrinkler_L.oc" "shader_head_shader.maskChannel_23"
		;
connectAttr "maskFile_head_wm2_noseWrinkler_R.oc" "shader_head_shader.maskChannel_24"
		;
connectAttr "maskFile_head_wm3_cheekRaiseInner_L.oc" "shader_head_shader.maskChannel_25"
		;
connectAttr "maskFile_head_wm3_cheekRaiseInner_R.oc" "shader_head_shader.maskChannel_26"
		;
connectAttr "maskFile_head_wm3_cheekRaiseOuter_L.oc" "shader_head_shader.maskChannel_27"
		;
connectAttr "maskFile_head_wm3_cheekRaiseOuter_R.oc" "shader_head_shader.maskChannel_28"
		;
connectAttr "maskFile_head_wm3_cheekRaiseUpper_L.oc" "shader_head_shader.maskChannel_29"
		;
connectAttr "maskFile_head_wm3_cheekRaiseUpper_R.oc" "shader_head_shader.maskChannel_30"
		;
connectAttr "maskFile_head_wm3_smile_L.oc" "shader_head_shader.maskChannel_31";
connectAttr "maskFile_head_wm3_smile_R.oc" "shader_head_shader.maskChannel_32";
connectAttr "maskFile_head_wm13_lips_DL.oc" "shader_head_shader.maskChannel_33";
connectAttr "maskFile_head_wm13_lips_DR.oc" "shader_head_shader.maskChannel_34";
connectAttr "maskFile_head_wm13_lips_UL.oc" "shader_head_shader.maskChannel_35";
connectAttr "maskFile_head_wm13_lips_UR.oc" "shader_head_shader.maskChannel_36";
connectAttr "shader_head_shader.oc" "shader_head_shaderSG.ss";
connectAttr "shader_head_shaderSG.msg" "materialInfo1.sg";
connectAttr "shader_head_shader.msg" "materialInfo1.m";
connectAttr "baseMapFile_dx11_diffuseIrradiance.oc" "shader_teeth_shader.DiffuseCubeIBL"
		;
connectAttr "baseMapFile_dx11_specularIrradiance.oc" "shader_teeth_shader.SpecularCubeIBL"
		;
connectAttr "baseMapFile_dx11_jitter.oc" "shader_teeth_shader.DitherTexture";
connectAttr "baseMapFile_dx11_skinLUT.oc" "shader_teeth_shader.LutTexture";
connectAttr "baseMapFile_teeth_color.oc" "shader_teeth_shader.DiffuseTexture";
connectAttr "baseMapFile_teeth_normal.oc" "shader_teeth_shader.NormalTexture";
connectAttr "shader_teeth_shader.oc" "shader_teeth_shaderSG.ss";
connectAttr "shader_teeth_shaderSG.msg" "materialInfo2.sg";
connectAttr "shader_teeth_shader.msg" "materialInfo2.m";
connectAttr "shader_saliva_shader.oc" "shader_saliva_shaderSG.ss";
connectAttr "shader_saliva_shaderSG.msg" "materialInfo3.sg";
connectAttr "shader_saliva_shader.msg" "materialInfo3.m";
connectAttr "baseMapFile_dx11_diffuseIrradiance.oc" "shader_eyeLeft_shader.DiffuseCubeIBL"
		;
connectAttr "baseMapFile_dx11_specularIrradiance.oc" "shader_eyeLeft_shader.SpecularCubeIBL"
		;
connectAttr "baseMapFile_dx11_jitter.oc" "shader_eyeLeft_shader.DitherTexture";
connectAttr "baseMapFile_dx11_skinLUT.oc" "shader_eyeLeft_shader.LutTexture";
connectAttr "baseMapFile_eyes_color.oc" "shader_eyeLeft_shader.DiffuseTexture";
connectAttr "baseMapFile_eyes_normal.oc" "shader_eyeLeft_shader.NormalTexture";
connectAttr "shader_eyeLeft_shader.oc" "shader_eyeLeft_shaderSG.ss";
connectAttr "shader_eyeLeft_shaderSG.msg" "materialInfo4.sg";
connectAttr "shader_eyeLeft_shader.msg" "materialInfo4.m";
connectAttr "baseMapFile_dx11_diffuseIrradiance.oc" "shader_eyeRight_shader.DiffuseCubeIBL"
		;
connectAttr "baseMapFile_dx11_specularIrradiance.oc" "shader_eyeRight_shader.SpecularCubeIBL"
		;
connectAttr "baseMapFile_dx11_jitter.oc" "shader_eyeRight_shader.DitherTexture";
connectAttr "baseMapFile_dx11_skinLUT.oc" "shader_eyeRight_shader.LutTexture";
connectAttr "baseMapFile_eyes_color.oc" "shader_eyeRight_shader.DiffuseTexture";
connectAttr "baseMapFile_eyes_normal.oc" "shader_eyeRight_shader.NormalTexture";
connectAttr "shader_eyeRight_shader.oc" "shader_eyeRight_shaderSG.ss";
connectAttr "shader_eyeRight_shaderSG.msg" "materialInfo5.sg";
connectAttr "shader_eyeRight_shader.msg" "materialInfo5.m";
connectAttr "shader_eyeshell_shader.oc" "shader_eyeshell_shaderSG.ss";
connectAttr "shader_eyeshell_shaderSG.msg" "materialInfo6.sg";
connectAttr "shader_eyeshell_shader.msg" "materialInfo6.m";
connectAttr "baseMapFile_eyelashes_color.oc" "shader_eyelashes_shader.c";
connectAttr "baseMapFile_eyelashes_color.ot" "shader_eyelashes_shader.it";
connectAttr "shader_eyelashes_shader.oc" "shader_eyelashes_shaderSG.ss";
connectAttr "shader_eyelashes_shaderSG.msg" "materialInfo7.sg";
connectAttr "shader_eyelashes_shader.msg" "materialInfo7.m";
connectAttr "baseMapFile_eyelashes_color.msg" "materialInfo7.t" -na;
connectAttr "shader_eyelashesShadow_shader.oc" "shader_eyelashesShadow_shaderSG.ss"
		;
connectAttr "shader_eyelashesShadow_shaderSG.msg" "materialInfo8.sg";
connectAttr "shader_eyelashesShadow_shader.msg" "materialInfo8.m";
connectAttr "shader_eyeEdge_shader.oc" "shader_eyeEdge_shaderSG.ss";
connectAttr "shader_eyeEdge_shaderSG.msg" "materialInfo9.sg";
connectAttr "shader_eyeEdge_shader.msg" "materialInfo9.m";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_dx11_diffuseIrradiance.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_dx11_diffuseIrradiance.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_dx11_diffuseIrradiance.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_dx11_diffuseIrradiance.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_dx11_specularIrradiance.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_dx11_specularIrradiance.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_dx11_specularIrradiance.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_dx11_specularIrradiance.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_dx11_jitter.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_dx11_jitter.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_dx11_jitter.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_dx11_jitter.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_dx11_skinLUT.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_dx11_skinLUT.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_dx11_skinLUT.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_dx11_skinLUT.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_head_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_head_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_head_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_head_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_cm1_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_cm1_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_cm1_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_cm1_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_cm2_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_cm2_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_cm2_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_cm2_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_cm3_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_cm3_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_cm3_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_cm3_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_head_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_head_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_head_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_head_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_wm1_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_wm1_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_wm1_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_wm1_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_wm2_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_wm2_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_wm2_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_wm2_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "mapFile_head_wm3_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "mapFile_head_wm3_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "mapFile_head_wm3_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "mapFile_head_wm3_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_head_cavity.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_head_cavity.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_head_cavity.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_head_cavity.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_blink_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_blink_L.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_blink_L.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_blink_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_blink_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_blink_R.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_blink_R.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_blink_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_browsRaiseInner_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_browsRaiseInner_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_browsRaiseInner_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_browsRaiseInner_L.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_browsRaiseInner_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_browsRaiseInner_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_browsRaiseInner_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_browsRaiseInner_R.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_browsRaiseOuter_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_browsRaiseOuter_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_browsRaiseOuter_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_browsRaiseOuter_L.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_browsRaiseOuter_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_browsRaiseOuter_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_browsRaiseOuter_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_browsRaiseOuter_R.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_chinRaise_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_chinRaise_L.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_chinRaise_L.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_chinRaise_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_chinRaise_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_chinRaise_R.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_chinRaise_R.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_chinRaise_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_jawOpen.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_jawOpen.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_jawOpen.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_jawOpen.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_purse_DL.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_purse_DL.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_purse_DL.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_purse_DL.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_purse_DR.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_purse_DR.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_purse_DR.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_purse_DR.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_purse_UL.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_purse_UL.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_purse_UL.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_purse_UL.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_purse_UR.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_purse_UR.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_purse_UR.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_purse_UR.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_squintInner_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_squintInner_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_squintInner_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_squintInner_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm1_squintInner_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm1_squintInner_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm1_squintInner_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm1_squintInner_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_browsDown_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_browsDown_L.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_browsDown_L.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_browsDown_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_browsDown_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_browsDown_R.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_browsDown_R.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_browsDown_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_browsLateral_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_browsLateral_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_browsLateral_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_browsLateral_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_browsLateral_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_browsLateral_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_browsLateral_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_browsLateral_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_mouthStretch_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_mouthStretch_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_mouthStretch_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_mouthStretch_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_mouthStretch_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_mouthStretch_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_mouthStretch_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_mouthStretch_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_neckStretch_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_neckStretch_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_neckStretch_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_neckStretch_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_neckStretch_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_neckStretch_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_neckStretch_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_neckStretch_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_noseWrinkler_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_noseWrinkler_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_noseWrinkler_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_noseWrinkler_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm2_noseWrinkler_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm2_noseWrinkler_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm2_noseWrinkler_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm2_noseWrinkler_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseInner_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseInner_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseInner_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseInner_L.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseInner_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseInner_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseInner_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseInner_R.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseOuter_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseOuter_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseOuter_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseOuter_L.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseOuter_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseOuter_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseOuter_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseOuter_R.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseUpper_L.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseUpper_L.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseUpper_L.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseUpper_L.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_cheekRaiseUpper_R.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_cheekRaiseUpper_R.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_cheekRaiseUpper_R.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_cheekRaiseUpper_R.ws"
		;
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_smile_L.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_smile_L.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_smile_L.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_smile_L.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm3_smile_R.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm3_smile_R.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm3_smile_R.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm3_smile_R.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm13_lips_DL.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm13_lips_DL.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm13_lips_DL.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm13_lips_DL.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm13_lips_DR.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm13_lips_DR.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm13_lips_DR.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm13_lips_DR.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm13_lips_UL.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm13_lips_UL.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm13_lips_UL.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm13_lips_UL.ws";
connectAttr ":defaultColorMgtGlobals.cme" "maskFile_head_wm13_lips_UR.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "maskFile_head_wm13_lips_UR.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "maskFile_head_wm13_lips_UR.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "maskFile_head_wm13_lips_UR.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_teeth_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_teeth_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_teeth_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_teeth_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_teeth_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_teeth_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_teeth_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_teeth_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_eyes_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_eyes_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_eyes_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_eyes_color.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_eyes_normal.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_eyes_normal.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_eyes_normal.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_eyes_normal.ws";
connectAttr ":defaultColorMgtGlobals.cme" "baseMapFile_eyelashes_color.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "baseMapFile_eyelashes_color.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "baseMapFile_eyelashes_color.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "baseMapFile_eyelashes_color.ws";
connectAttr "shader_eyelashes_shader.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo12.tgi[0].ni[0].dn"
		;
connectAttr "baseMapFile_eyelashes_color.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo12.tgi[0].ni[1].dn"
		;
connectAttr "shader_eyelashes_shaderSG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo12.tgi[0].ni[2].dn"
		;
connectAttr "shader_head_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_teeth_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_saliva_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyeLeft_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyeRight_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyeshell_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyelashes_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyelashesShadow_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_eyeEdge_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "shader_head_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_teeth_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_saliva_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyeLeft_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyeRight_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyeshell_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyelashes_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyelashesShadow_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "shader_eyeEdge_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "baseMapFile_dx11_diffuseIrradiance.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "baseMapFile_dx11_specularIrradiance.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "baseMapFile_dx11_jitter.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_dx11_skinLUT.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_head_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_cm1_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_cm2_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_cm3_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_head_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_wm1_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_wm2_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "mapFile_head_wm3_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_head_cavity.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_blink_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_blink_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_browsRaiseInner_L.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm1_browsRaiseInner_R.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm1_browsRaiseOuter_L.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm1_browsRaiseOuter_R.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm1_chinRaise_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_chinRaise_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_jawOpen.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_purse_DL.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_purse_DR.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_purse_UL.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_purse_UR.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_squintInner_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm1_squintInner_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm2_browsDown_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm2_browsDown_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm2_browsLateral_L.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm2_browsLateral_R.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm2_mouthStretch_L.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm2_mouthStretch_R.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm2_neckStretch_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm2_neckStretch_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm2_noseWrinkler_L.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm2_noseWrinkler_R.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "maskFile_head_wm3_cheekRaiseInner_L.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_cheekRaiseInner_R.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_cheekRaiseOuter_L.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_cheekRaiseOuter_R.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_cheekRaiseUpper_L.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_cheekRaiseUpper_R.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "maskFile_head_wm3_smile_L.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm3_smile_R.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm13_lips_DL.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm13_lips_DR.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm13_lips_UL.msg" ":defaultTextureList1.tx" -na;
connectAttr "maskFile_head_wm13_lips_UR.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_teeth_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_teeth_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_eyes_color.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_eyes_normal.msg" ":defaultTextureList1.tx" -na;
connectAttr "baseMapFile_eyelashes_color.msg" ":defaultTextureList1.tx" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
connectAttr "baseMapFile_eyelashes_color.oc" ":internal_soloShader.ic";
// End of head_shader.ma
