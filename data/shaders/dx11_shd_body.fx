// Maya Skin shader made by Charles Greivelding 2014

//------------------------------------
// Notes
//------------------------------------
// Shader uses 'pre-multiplied alpha' as its render state and this Uber Shader is build to work in unison with that.
// Alternatively, in Maya, the dx11Shader node allows you to set your own render states by supplying the 'overridesDrawState' annotation in the technique
// You may find it harder to get proper transparency sorting if you choose to do so.

// The technique annotation 'isTransparent' is used to tell Maya how treat the technique with respect to transparency.
//	- If set to 0 the technique is always considered opaque
//	- If set to 1 the technique is always considered transparent
//	- If set to 2 the plugin will check if the parameter marked with the OPACITY semantic is less than 1.0
//	- If set to 3 the plugin will use the transparencyTest annotation to create a MEL procedure to perform the desired test.
// Maya will then render the object twice. Front faces follow by back faces.

// For some objects you may need to switch the Transparency Algorithm to 'Depth Peeling' to avoid transparency issues.
// Models that require this usually have internal faces.

//------------------------------------
// Defines
//------------------------------------
// how many mip map levels should Maya generate or load per texture.
// 0 means all possible levels
// some textures may override this value, but most textures will follow whatever we have defined here
// If you wish to optimize performance (at the cost of reduced quality), you can set NumberOfMipMaps below to 1

#define NumberOfMipMaps 0
#define PI 3.1415926
#define _3DSMAX_SPIN_MAX 99999

#ifndef _MAYA_
#define _3DSMAX_	// at time of writing this shader, Nitrous driver did not have the _3DSMAX_ define set
#define _ZUP_		// Maya is Y up, 3dsMax is Z up
#endif

#ifdef _MAYA_
#define _SUPPORTTESSELLATION_	// at time of writing this shader, 3dsMax did not support tessellation
#endif

//------------------------------------
// State
//------------------------------------
#ifdef _MAYA_
RasterizerState WireframeCullFront {
	CullMode = Front;
	FillMode = WIREFRAME;
};

BlendState PMAlphaBlending {
	AlphaToCoverageEnable = FALSE;
	BlendEnable[0] = TRUE;
	SrcBlend = ONE;
	DestBlend = INV_SRC_ALPHA;
	BlendOp = ADD;
	SrcBlendAlpha = ONE;	// Required for hardware frame render alpha channel
	DestBlendAlpha = INV_SRC_ALPHA;
	BlendOpAlpha = ADD;
	RenderTargetWriteMask[0] = 0x0F;
};
#endif

//------------------------------------
// Map Channels
//------------------------------------
#ifdef _3DSMAX_
int texcoord0 : Texcoord <
	int Texcoord = 0;
	int MapChannel = 1;
	string UIWidget = "None";
>;

int texcoord1 : Texcoord <
	int Texcoord = 1;
	int MapChannel = 2;
	string UIWidget = "None";
>;

int texcoord2 : Texcoord <
	int Texcoord = 2;
	int MapChannel = 3;
	string UIWidget = "None";
>;
#endif

//------------------------------------
// Samplers
//------------------------------------
SamplerState CubeMapSampler {
	Filter = ANISOTROPIC;
	AddressU = Clamp;
	AddressV = Clamp;
	AddressW = Clamp;
};

SamplerState SamplerAnisoWrap {
	Filter = ANISOTROPIC;
	AddressU = Wrap;
	AddressV = Wrap;
};

SamplerState SamplerAnisoClamp {
	Filter = ANISOTROPIC;
	AddressU = Clamp;
	AddressV = Clamp;
};

SamplerState SamplerShadowDepth {
	Filter = MIN_MAG_MIP_POINT;
	AddressU = Border;
	AddressV = Border;
	BorderColor = float4(1.0f, 1.0f, 1.0f, 1.0f);
};

//------------------------------------
// Textures
//------------------------------------

Texture2D LutTexture <
	string UIGroup = "SubSurfaceScattering";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "SSS LUT Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 203;
	int UVEditorOrder = 2;
>;

Texture2D DitherTexture <
	string UIGroup = "SubSurfaceScattering";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "SSS Dither Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 203;
	int UVEditorOrder = 2;
>;

// ---------------------------------------------
// Blend GROUP
// ---------------------------------------------

bool UseBlendTexture <
	string UIGroup = "Wrinkle mixing";
	string UIName = "Enable Wrinkle Mixing";
	int UIOrder = 919;
> = false;

Texture2D animNormalMap_00 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Wrinkle Map 00";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 948;
	int UVEditorOrder = 2;
>;

Texture2D animNormalMap_01 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Wrinkle Map 01";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 949;
	int UVEditorOrder = 2;
>;

Texture2D animNormalMap_02 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Wrinkle Map 02";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 950;
	int UVEditorOrder = 2;
>;


Texture2D animColorMap_00 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Blood Flow 00";
	string ResourceType = "2D";
	int UIOrder = 951;
	int UVEditorOrder = 2;
>;

Texture2D animColorMap_01 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Blood Flow 01";
	string ResourceType = "2D";
	int UIOrder = 952;
	int UVEditorOrder = 2;
>;

Texture2D animColorMap_02 <
	string UIGroup = "Animated Maps";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Blood Flow 02";
	string ResourceType = "2D";
	int UIOrder = 953;
	int UVEditorOrder = 2;
>;


Texture2D maskChannel_00 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 00 Mask";
	string ResourceType = "2D";
	int UIOrder = 948;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_01 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 01 Mask";
	string ResourceType = "2D";
	int UIOrder = 949;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_02 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 02 Mask";
	string ResourceType = "2D";
	int UIOrder = 950;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_03 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 03 Mask";
	string ResourceType = "2D";
	int UIOrder = 951;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_04 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 04 Mask";
	string ResourceType = "2D";
	int UIOrder = 952;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_05 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 05 Mask";
	string ResourceType = "2D";
	int UIOrder = 953;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_06 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 06 Mask";
	string ResourceType = "2D";
	int UIOrder = 954;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_07 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 07 Mask";
	string ResourceType = "2D";
	int UIOrder = 955;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_08 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 08 Mask";
	string ResourceType = "2D";
	int UIOrder = 956;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_09 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 09 Mask";
	string ResourceType = "2D";
	int UIOrder = 957;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_10 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 10 Mask";
	string ResourceType = "2D";
	int UIOrder = 958;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_11 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 11 Mask";
	string ResourceType = "2D";
	int UIOrder = 959;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_12 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 12 Mask";
	string ResourceType = "2D";
	int UIOrder = 960;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_13 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 13 Mask";
	string ResourceType = "2D";
	int UIOrder = 961;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_14 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 14 Mask";
	string ResourceType = "2D";
	int UIOrder = 962;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_15 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 15 Mask";
	string ResourceType = "2D";
	int UIOrder = 963;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_16 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 16 Mask";
	string ResourceType = "2D";
	int UIOrder = 964;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_17 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 17 Mask";
	string ResourceType = "2D";
	int UIOrder = 965;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_18 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 18 Mask";
	string ResourceType = "2D";
	int UIOrder = 966;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_19 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 19 Mask";
	string ResourceType = "2D";
	int UIOrder = 967;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_20 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 20 Mask";
	string ResourceType = "2D";
	int UIOrder = 968;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_21 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 21 Mask";
	string ResourceType = "2D";
	int UIOrder = 969;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_22 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 22 Mask";
	string ResourceType = "2D";
	int UIOrder = 970;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_23 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 23 Mask";
	string ResourceType = "2D";
	int UIOrder = 971;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_24 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 24 Mask";
	string ResourceType = "2D";
	int UIOrder = 972;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_25 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 25 Mask";
	string ResourceType = "2D";
	int UIOrder = 973;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_26 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 26 Mask";
	string ResourceType = "2D";
	int UIOrder = 974;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_27 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 27 Mask";
	string ResourceType = "2D";
	int UIOrder = 975;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_28 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 28 Mask";
	string ResourceType = "2D";
	int UIOrder = 976;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_29 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 29 Mask";
	string ResourceType = "2D";
	int UIOrder = 977;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_30 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 30 Mask";
	string ResourceType = "2D";
	int UIOrder = 978;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_31 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 31 Mask";
	string ResourceType = "2D";
	int UIOrder = 979;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_32 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 32 Mask";
	string ResourceType = "2D";
	int UIOrder = 980;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_33 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 33 Mask";
	string ResourceType = "2D";
	int UIOrder = 981;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_34 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 34 Mask";
	string ResourceType = "2D";
	int UIOrder = 982;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_35 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 35 Mask";
	string ResourceType = "2D";
	int UIOrder = 983;
	int UVEditorOrder = 2;
>;

Texture2D maskChannel_36 <
	string UIGroup = "Masks";
	string ResourceName = "";
	string UIWidget = "File Picker";
	string UIName = "Channel 36 Mask";
	string ResourceType = "2D";
	int UIOrder = 984;
	int UVEditorOrder = 2;
>;


float maskWeight_00 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 00 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 954;
> = 0.0;

float maskWeight_01 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 01 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 955;
> = 0.0;

float maskWeight_02 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 02 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 956;
> = 0.0;

float maskWeight_03 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 03 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 957;
> = 0.0;

float maskWeight_04 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 04 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 958;
> = 0.0;

float maskWeight_05 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 05 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 959;
> = 0.0;

float maskWeight_06 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 06 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 960;
> = 0.0;

float maskWeight_07 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 07 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 961;
> = 0.0;

float maskWeight_08 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 08 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 962;
> = 0.0;

float maskWeight_09 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 09 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 963;
> = 0.0;

float maskWeight_10 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 10 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 964;
> = 0.0;

float maskWeight_11 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 11 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 965;
> = 0.0;

float maskWeight_12 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 12 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 966;
> = 0.0;

float maskWeight_13 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 13 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 967;
> = 0.0;

float maskWeight_14 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 14 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 968;
> = 0.0;

float maskWeight_15 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 15 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 969;
> = 0.0;

float maskWeight_16 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 16 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 970;
> = 0.0;

float maskWeight_17 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 17 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 971;
> = 0.0;

float maskWeight_18 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 18 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 972;
> = 0.0;

float maskWeight_19 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 19 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 973;
> = 0.0;

float maskWeight_20 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 20 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 974;
> = 0.0;

float maskWeight_21 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 21 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 975;
> = 0.0;

float maskWeight_22 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 22 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 976;
> = 0.0;

float maskWeight_23 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 23 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 977;
> = 0.0;

float maskWeight_24 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 24 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 978;
> = 0.0;

float maskWeight_25 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 25 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 979;
> = 0.0;

float maskWeight_26 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 26 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 980;
> = 0.0;

float maskWeight_27 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 27 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 981;
> = 0.0;

float maskWeight_28 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 28 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 982;
> = 0.0;

float maskWeight_29 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 29 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 983;
> = 0.0;

float maskWeight_30 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 30 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 984;
> = 0.0;

float maskWeight_31 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 31 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 985;
> = 0.0;

float maskWeight_32 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 32 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 986;
> = 0.0;

float maskWeight_33 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 33 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 987;
> = 0.0;

float maskWeight_34 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 34 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 988;
> = 0.0;

float maskWeight_35 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 35 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 989;
> = 0.0;

float maskWeight_36 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 36 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 990;
> = 0.0;

float maskWeight_37 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 37 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 991;
> = 0.0;

float maskWeight_38 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 38 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 992;
> = 0.0;

float maskWeight_39 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 39 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 993;
> = 0.0;

float maskWeight_40 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 40 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 994;
> = 0.0;

float maskWeight_41 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 41 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 995;
> = 0.0;

float maskWeight_42 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 42 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 996;
> = 0.0;

float maskWeight_43 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 43 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 997;
> = 0.0;

float maskWeight_44 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 44 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 998;
> = 0.0;

float maskWeight_45 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 45 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 999;
> = 0.0;

float maskWeight_46 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 46 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1000;
> = 0.0;

float maskWeight_47 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 47 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1001;
> = 0.0;

float maskWeight_48 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 48 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1002;
> = 0.0;

float maskWeight_49 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 49 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1003;
> = 0.0;

float maskWeight_50 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 50 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1004;
> = 0.0;

float maskWeight_51 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 51 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1005;
> = 0.0;

float maskWeight_52 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 52 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1006;
> = 0.0;

float maskWeight_53 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 53 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1007;
> = 0.0;

float maskWeight_54 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 54 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1008;
> = 0.0;

float maskWeight_55 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 55 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1009;
> = 0.0;

float maskWeight_56 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 56 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1010;
> = 0.0;

float maskWeight_57 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 57 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1011;
> = 0.0;

float maskWeight_58 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 58 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1012;
> = 0.0;

float maskWeight_59 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 59 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1013;
> = 0.0;

float maskWeight_60 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 60 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1014;
> = 0.0;

float maskWeight_61 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 61 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1015;
> = 0.0;

float maskWeight_62 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 62 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1016;
> = 0.0;

float maskWeight_63 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 63 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1017;
> = 0.0;

float maskWeight_64 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 64 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1018;
> = 0.0;

float maskWeight_65 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 65 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1019;
> = 0.0;

float maskWeight_66 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 66 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1020;
> = 0.0;

float maskWeight_67 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 67 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1021;
> = 0.0;

float maskWeight_68 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 68 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1022;
> = 0.0;

float maskWeight_69 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 69 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1023;
> = 0.0;

float maskWeight_70 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 70 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1024;
> = 0.0;

float maskWeight_71 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 71 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1025;
> = 0.0;

float maskWeight_72 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 72 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1026;
> = 0.0;

float maskWeight_73 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 73 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1027;
> = 0.0;

float maskWeight_74 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 74 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1028;
> = 0.0;

float maskWeight_75 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 75 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1029;
> = 0.0;

float maskWeight_76 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 76 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1030;
> = 0.0;

float maskWeight_77 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 77 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1031;
> = 0.0;

float maskWeight_78 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 78 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1032;
> = 0.0;

float maskWeight_79 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 79 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1033;
> = 0.0;

float maskWeight_80 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 80 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1034;
> = 0.0;

float maskWeight_81 <
	string UIGroup = "Multipliers";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	string UIName = "Channel 81 Multiplier";
	float UIStep = 0.01;
	int UIOrder = 1035;
> = 0.0;



Texture2D OcclusionTexture <
	string UIGroup = "Occlusion";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Ambient Occlusion Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 401;
	int UVEditorOrder = 2;
>;

Texture2D ScatteringRadiusTexture <
	string UIGroup = "SubSurfaceScattering";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "SSS Radius Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 209;
	int UVEditorOrder = 2;
>;

Texture2D CavityTexture <
	string UIGroup = "Cavity";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Cavity Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 501;
	int UVEditorOrder = 4;
>;

Texture2D DiffuseTexture <
	string UIGroup = "Diffuse";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Diffuse Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 201;
	int UVEditorOrder = 1;
>;

Texture2D SpecularTexture <
	string UIGroup = "Specular";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Specular Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 302;
	int UVEditorOrder = 4;
>;

Texture2D NormalTexture <
	string UIGroup = "Normal";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Normal Map";
	string ResourceType = "2D";
	int mipmaplevels = 0;	// If mip maps exist in texture, Maya will load them. So user can pre-calculate and re-normalize mip maps for normal maps in .dds
	int UIOrder = 601;
	int UVEditorOrder = 5;
>;

Texture2D MicroCavityTexture <
	string UIGroup = "Micro Details";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Micro Cavity Map";
	string ResourceType = "2D";
	int mipmaplevels = 0;
	int UIOrder = 701;
	int UVEditorOrder = 5;
>;

Texture2D MicroNormalTexture <
	string UIGroup = "Micro Details";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Micro Normal Map";
	string ResourceType = "2D";
	int mipmaplevels = 0;
	int UIOrder = 704;
	int UVEditorOrder = 5;
>;

#ifdef _SUPPORTTESSELLATION_
Texture2D DisplacementTexture <
	string UIGroup = "Tessellation and Displacement";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Displacement Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 902;
	int UVEditorOrder = 8;
>;
#endif

Texture2D BackScatteringThicknessTexture <
	string UIGroup = "BackScattering";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Thickness Map";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 215;
	int UVEditorOrder = 10;
>;

Texture2D OpacityMaskTexture <
	string UIGroup = "Opacity";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Opacity Mask";
	string ResourceType = "2D";
	int mipmaplevels = NumberOfMipMaps;
	int UIOrder = 800;
	int UVEditorOrder = 12;
>;

TextureCube DiffuseCubeIBL <
	string UIGroup = "IBL Settings";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Diffuse Cubemap";
	string ResourceType = "Cube";
	int mipmaplevels = 0; // Use (or load) max number of mip map levels so we can use blurring
	int UIOrder = 108;
	int UVEditorOrder = 10;
>;

TextureCube SpecularCubeIBL : environment <
	string UIGroup = "IBL Settings";
	string ResourceName = "";
	string UIWidget = "FilePicker";
	string UIName = "Specular Cubemap";
	string ResourceType = "Cube";
	int mipmaplevels = 0;
	int UIOrder = 111;
	int UVEditorOrder = 6;
>;

//------------------------------------
// Shadow Maps
//------------------------------------
Texture2D light0ShadowMap : SHADOWMAP <
	string Object = "Light 0";	// UI Group for lights, auto-closed
	string UIWidget = "None";
	int UIOrder = 5010;
>;

Texture2D light1ShadowMap : SHADOWMAP <
	string Object = "Light 1";
	string UIWidget = "None";
	int UIOrder = 5020;
>;

Texture2D light2ShadowMap : SHADOWMAP <
	string Object = "Light 2";
	string UIWidget = "None";
	int UIOrder = 5030;
>;

//------------------------------------
// Internal depth textures for Maya depth-peeling transparency
//------------------------------------
#ifdef _MAYA_

Texture2D transpDepthTexture : transpdepthtexture <
	string UIWidget = "None";
>;

Texture2D opaqueDepthTexture : opaquedepthtexture <
	string UIWidget = "None";
>;

#endif

//------------------------------------
// Per Frame parameters
//------------------------------------
cbuffer UpdatePerFrame : register(b0) {
	float4x4 viewInv : ViewInverse < string UIWidget = "None"; >;
	float4x4 view : View < string UIWidget = "None"; >;
	float4x4 prj : Projection < string UIWidget = "None"; >;
	float4x4 viewPrj : ViewProjection < string UIWidget = "None"; >;

	// A shader may wish to do different actions when Maya is rendering the preview swatch (e.g. disable displacement)
	// This value will be true if Maya is rendering the swatch
	bool IsSwatchRender : MayaSwatchRender < string UIWidget = "None"; > = false;
	float2 screenSize : ViewportPixelSize < string UIWidget = "None"; >;

	// If the user enables viewport gamma correction in Maya's global viewport rendering settings, the shader should not do gamma again
	bool MayaFullScreenGamma : MayaGammaCorrection < string UIWidget = "None"; > = false;
}


//------------------------------------
// Per Object parameters
//------------------------------------
cbuffer UpdatePerObject : register(b1) {
	float4x4 world : World < string UIWidget = "None"; >;
	float4x4 worldIT : WorldInverseTranspose < string UIWidget = "None"; >;
#ifndef _SUPPORTTESSELLATION_
	float4x4 wvp : WorldViewProjection < string UIWidget = "None"; >;
#endif

// ---------------------------------------------
// Lighting Settings GROUP
// ---------------------------------------------
bool LinearSpaceLighting <
	string UIGroup = "Lighting Settings";
	string UIName = "Linear Space Lighting";
	int UIOrder = 100;
> = true;

bool UseShadows <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string UIGroup = "Lighting Settings";
	string UIName = "Shadows";
	int UIOrder = 101;
#endif
> = true;

float shadowMultiplier <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string UIGroup = "Lighting Settings";
	string UIWidget = "Slider";
	float UIMin = 0.000;
	float UIMax = 1.000;
	float UIStep = 0.001;
	string UIName = "Shadow Strength";
	int UIOrder = 102;
#endif
> = { 1.0f };

// This offset allows you to fix any in-correct self shadowing caused by limited precision.
// This tends to get affected by scene scale and polygon count of the objects involved.
float shadowDepthBias : ShadowMapBias <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string UIGroup = "Lighting Settings";
	string UIWidget = "Slider";
	float UIMin = 0.000;
	float UISoftMax = 10.000;
	float UIStep = 0.001;
	string UIName = "Shadow Bias";
	int UIOrder = 103;
#endif
> = { 0.01f };

// flips back facing normals to improve lighting for things like sheets of hair or leaves
bool flipBackfaceNormals <
	string UIGroup = "Lighting Settings";
	string UIName = "Double Sided Lighting";
	int UIOrder = 104;
> = true;

// -- light props are inserted here via UIOrder 20 - 49

// ---------------------------------------------
// IBL Settings GROUP
// ---------------------------------------------

float SkyRotation <
	string UIGroup = "IBL Settings";
	string UIName = "Sky Rotation";
	float UISoftMin = 0;
	float UISoftMax = 360;
	float UIMin = 0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 1;
	int UIOrder = 105;
	string UIWidget = "Slider";
> = { 0.0f };

bool UseDiffuseIBLMap <
	string UIGroup = "IBL Settings";
	string UIName = "Use Diffuse Cubemap";
	int UIOrder = 106;
> = false;

float DiffuseIBLIntensity <
	string UIGroup = "IBL Settings";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 2.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.001;
	string UIName = "Diffuse IBL Intensity";
	int UIOrder = 107;
> = 1.0;

bool UseSpecCubeIBL <
	string UIGroup = "IBL Settings";
	string UIName = "Use Specular Cubemap";
	int UIOrder = 109;
> = false;

float SpecularIBLIntensity <
	string UIGroup = "IBL Settings";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 2.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.001;
	string UIName = "Specular IBL Intensity";
	int UIOrder = 110;
> = 1.0;

// ---------------------------------------------
// Diffuse GROUP
// ---------------------------------------------

bool UseDiffuseTexture <
	string UIGroup = "Diffuse";
	string UIName = "Use Diffuse Map";
	int UIOrder = 200;
> = false;


bool UseDiffuseTextureAlpha <
	string UIGroup = "Diffuse";
	string UIName = "Use Diffuse Map Alpha";
	int UIOrder = 201;
> = false;

float3 DiffuseColor : Diffuse <
	string UIGroup = "Diffuse";
	string UIName = "Diffuse Color";
	string UIWidget = "ColorPicker";
	int UIOrder = 202;
> = { 1.0f, 1.0f, 1.0f };

// ---------------------------------------------
// SSS GROUP
// ---------------------------------------------

float skinCoeffX <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Coeffient R";
	int UIOrder = 204;
> = 1.0;

float skinCoeffY <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Coeffient G";
	int UIOrder = 205;
> = 0.5;

float skinCoeffZ <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Coeffient B";
	int UIOrder = 206;
> = 0.25;

float NormalBlurring <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Softness";
	int UIOrder = 207;
> = 0.25;

bool UseScatteringRadiusTexture <
	string UIGroup = "SubSurfaceScattering";
	string UIName = "Use SSS Radius Map";
	int UIOrder = 209;
> = false;

float skinScattering <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Radius";
	int UIOrder = 210;
> = 0.25;

float shadowBlur <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Shadow Blur";
	int UIOrder = 211;
> = 1.0;

float shadowDither <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Shadow Dither";
	int UIOrder = 211;
> = 1.0;

float shadowScattering <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "SSS Shadow Scattering";
	int UIOrder = 212;
> = 1.0;

float shadowSaturation <
	string UIGroup = "SubSurfaceScattering";
	float UIMin = 0.0;
	float UISoftMax = 4.0;
	float UIMax = 4;
	float UIStep = 0.1;
	string UIName = "SSS Shadow Saturation";
	int UIOrder = 213;
> = 1.0;

// ---------------------------------------------
// BackScattering GROUP
// ---------------------------------------------

bool UseTranslucency <
	string UIGroup = "BackScattering";
	string UIName = "Back Scattering";
	int UIOrder = 214;
> = false;

bool UseThicknessTexture <
	string UIGroup = "BackScattering";
	string UIName = "Use Thickness Map";
	int UIOrder = 216;
> = false;

float skinScatteringRoughness <
	string UIGroup = "BackScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName = "Back Scattering Width";
	int UIOrder = 217;
> = 1.0;

/*float3 skinScatteringInnerColor <
	string UIGroup = "BackScattering";
	string UIName = "Back Scattering Inner Color";
	string UIWidget = "ColorPicker";
	int UIOrder = 215;
> = {0.25f, 0.05f, 0.02f };*/

float3 skinScatteringOuterColor <
	string UIGroup = "BackScattering";
	string UIName = "Back Scattering Color";
	string UIWidget = "ColorPicker";
	int UIOrder = 218;
> = { 0.25f, 0.05f, 0.02f };

float skinScatteringAmount <
	string UIGroup = "BackScattering";
	float UIMin = 0.0;
	float UISoftMax = 6.0;
	float UIMax = 6;
	float UIStep = 0.1;
	string UIName = "Back Scattering Amount";
	int UIOrder = 219;
> = 1.0;

float skinAmbientScatteringAmount <
	string UIGroup = "BackScattering";
	float UIMin = 0.0;
	float UISoftMax = 6.0;
	float UIMax = 6;
	float UIStep = 0.1;
	string UIName = "Back Scattering Ambient Amount";
	int UIOrder = 220;
> = 1.0;

/* float skinScatteringPlane <
	string UIGroup = "BackScattering";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1;
	float UIStep = 0.1;
	string UIName   = "Back Scattering Far Plane";
	int UIOrder = 218;
> = 1.0;*/

// ---------------------------------------------
// Specular GROUP
// ---------------------------------------------

bool UseSpecularTexture <
	string UIGroup = "Specular";
	string UIName = "Use Specular Map";
	int UIOrder = 301;
> = false;

bool UseSpecularTextureAlpha <
	string UIGroup = "Specular";
	string UIName = "Use Roughness Map Alpha";
	int UIOrder = 301;
> = false;

float3 SpecularColor : Specular <
	string UIGroup = "Specular";
	string UIName = "Specular Color";
	string UIWidget = "ColorPicker";
	int UIOrder = 303;
> = { 1.0f, 1.0f, 1.0f };


float LobeMix <
	string UIGroup = "Specular";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 1.0;
	float UIMax = 1.0;
	float UIStep = 0.01;
	string UIName = "Lobe Mixing";
	int UIOrder = 304;
> = 0.75;

float Roughness <
	string UIGroup = "Specular";
	string UIWidget = "Slider";
	float UIMin = 0.01;
	float UISoftMax = 1.0;
	float UIMax = 1.0;
	float UIStep = 0.01;
	string UIName = "Roughness multiplier";
	int UIOrder = 305;
> = .2;

// ---------------------------------------------
// Occlusion GROUP
// ---------------------------------------------

bool UseAmbientOcclusionTexture <
	string UIGroup = "Occlusion";
	string UIName = "Use Occlusion Map";
	int UIOrder = 400;
> = false;

float OcclusionAmount <
	string UIGroup = "Occlusion";
	string UIWidget = "Slider";
	float UIMin = 0.01;
	float UISoftMax = 2.0;
	float UIMax = 2.0;
	float UIStep = 0.01;
	string UIName = "Occlusion Amount";
	int UIOrder = 402;
> = 1.0;

// ---------------------------------------------
// Cavity GROUP
// ---------------------------------------------

bool UseCavityTexture <
	string UIGroup = "Cavity";
	string UIName = "Use Cavity Map";
	int UIOrder = 500;
> = false;

float CavityAmount <
	string UIGroup = "Cavity";
	string UIWidget = "Slider";
	float UIMin = 0.01;
	float UISoftMax = 2.0;
	float UIMax = 2.0;
	float UIStep = 0.01;
	string UIName = "Cavity Amount";
	int UIOrder = 502;
> = 1.0;

// ---------------------------------------------
// Normal GROUP
// ---------------------------------------------
bool UseNormalTexture <
	string UIGroup = "Normal";
	string UIName = "Use Normal Map";
	int UIOrder = 600;
> = false;

float NormalHeight <
	string UIGroup = "Normal";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 5.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	string UIName = "Normal Height";
	int UIOrder = 603;
> = 1.0;

bool SupportNonUniformScale <
	string UIGroup = "Normal";
	string UIName = "Support Non-Uniform Scale";
	int UIOrder = 604;
> = true;

int NormalCoordsysX <
	string UIGroup = "Normal";
	string UIWidget = "Slider";
	float UIMin = 0;
	float UIMax = 1;
	float UIStep = 1;
	string UIFieldNames = "Positive:Negative";
	string UIName = "Normal X (Red)";
	int UIOrder = 605;
> = 0;

int NormalCoordsysY <
	string UIGroup = "Normal";
	string UIWidget = "Slider";
	float UIMin = 0;
	float UIMax = 1;
	float UIStep = 1;
	string UIFieldNames = "Positive:Negative";
	string UIName = "Normal Y (Green)";
	int UIOrder = 606;
> = 0;

// ---------------------------------------------
// Micro Details GROUP
// ---------------------------------------------

bool UseMicroCavityTexture <
	string UIGroup = "Micro Details";
	string UIName = "Use Micro Cavity Map";
	int UIOrder = 700;
> = false;

float MicroCavityAmount <
	string UIGroup = "Micro Details";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 2.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	string UIName = "Micro Cavity Amount";
	int UIOrder = 702;
> = 1.0;

bool UseMicroNormalTexture <
	string UIGroup = "Micro Details";
	string UIName = "Use Micro Normal Map";
	int UIOrder = 703;
> = false;

float MicroNormalHeight <
	string UIGroup = "Micro Details";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 5.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	string UIName = "Micro Normal Height";
	int UIOrder = 705;
> = 1.0;

float MicroScale <
	string UIGroup = "Micro Details";
	string UIWidget = "Slider";
	float UIMin = 16.0;
	float UISoftMax = 256.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	string UIName = "Micro Scale";
	int UIOrder = 706;
> = 32;

// ---------------------------------------------
// Opacity GROUP
// ---------------------------------------------
float Opacity : OPACITY <
	string UIGroup = "Opacity";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.001;
	string UIName = "Opacity";
	int UIOrder = 801;
> = 1.0;

bool UseOpacityMaskTexture <
	string UIGroup = "Opacity";
	string UIName = "Opacity Mask";
	int UIOrder = 802;
> = false;

// at what value do we clip away pixels
float OpacityMaskBias <
	string UIGroup = "Opacity";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.001;
	string UIName = "Opacity Mask Bias";
	int UIOrder = 803;
> = 0.1;

#ifdef _SUPPORTTESSELLATION_
// ---------------------------------------------
// Tessellation and Displacement GROUP
// ---------------------------------------------
int DisplacementModel <
	string UIGroup = "Tessellation and Displacement";
	string UIName = "Displacement Model";
	string UIFieldNames = "Grayscale:Tangent Vector";
	float UIMin = 0;
	float UIMax = 1;
	float UIStep = 1;
	int UIOrder = 900;
> = false;

bool UseDisplacementMap <
	string UIGroup = "Tessellation and Displacement";
	string UIName = "Displacement Map";
	int UIOrder = 901;
> = false;

int VectorDisplacementCoordSys <
	string UIGroup = "Tessellation and Displacement";
	string UIWidget = "Slider";
	string UIFieldNames = "Mudbox (XZY):Maya (XYZ)";
	string UIName = "Displacement Coordsys";
	float UIMin = 0;
	float UIMax = 1;
	float UIStep = 1;
	int UIOrder = 903;
> = 0;

float DisplacementHeight <
	string UIGroup = "Tessellation and Displacement";
	float UISoftMin = 0.0;
	float UISoftMax = 10.0;
	string UIName = "Displacement Height";
	float UIMin = -(_3DSMAX_SPIN_MAX);
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.1;
	int UIOrder = 904;
> = 0.5;

// This allows you to control what the 'base' value for displacement is.
// When the offset value is 0.5, that means that a gray value (color: 128,128,128) will get 0 displacement.
// A value of 0 would then dent in.
// A value of 1 would then extrude.
float DisplacementOffset <
	string UIGroup = "Tessellation and Displacement";
	float UISoftMin = -1.0;
	float UISoftMax = 1.0;
	float UIMin = -(_3DSMAX_SPIN_MAX);
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.1;
	string UIName = "Displacement Offset";
	int UIOrder = 905;
> = 0.5;

// This gives the artist control to prevent this shader from clipping away faces to quickly when displacement is actually keeping the faces on screen.
// This is also important for e.g. shadow map generation to make sure displaced vertices are not clipped out of the light's view
// See BBoxExtraScale for artist control over Maya clipping the entire object away when it thinks it leaves the view.
float DisplacementClippingBias <
	string UIGroup = "Tessellation and Displacement";
	float UISoftMin = 0.0;
	float UISoftMax = 99.0;
	float UIMin = -(_3DSMAX_SPIN_MAX);
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.5;
	string UIName = "Displacement Clipping Bias";
	int UIOrder = 906;
> = 5.0;

// This gives the artist control to prevent maya from clipping away the entire object to fast in case displacement is used.
// Its semantic has to be BoundingBoxExtraScale
float BBoxExtraScale : BoundingBoxExtraScale <
	string UIGroup = "Tessellation and Displacement";
	float UIMin = 1.0;
	float UISoftMax = 10.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.5;
	string UIName = "Bounding Box Extra Scale";
	int UIOrder = 907;
> = 1.0;

float TessellationRange <
	string UIGroup = "Tessellation and Displacement";
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UISoftMax = 999.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 1.0;
	string UIName = "Tessellation Range";
	int UIOrder = 908;
> = { 0 };

float TessellationMin <
	string UIGroup = "Tessellation and Displacement";
	float UIMin = 1.0;
	float UISoftMax = 10.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.5;
	string UIName = "Tessellation Minimum";
	int UIOrder = 909;
> = 3.0;

float FlatTessellation <
	string UIGroup = "Tessellation and Displacement";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.1;
	string UIName = "Flat Tessellation";
	int UIOrder = 910;
> = 0.0;
#endif

// ---------------------------------------------
// UV assignment GROUP
// ---------------------------------------------
// Use the Surface Data Section to set your UVset names for each Texcoord.
// E.g. TexCoord1 = uv:UVset
// Then pick a Texcoord in the UV Section to use that UVset for a texture.

int DiffuseTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Diffuse Map UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2002;
> = 0;

int OcclusionTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Ambient Occlusion Map UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2003;
> = 1;

int OpacityMaskTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Opacity Mask UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2005;
> = 0;

int SpecularTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Specular Map UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2006;
> = 0;

int NormalTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Normal Map UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2008;
> = 0;

#ifdef _SUPPORTTESSELLATION_
int DisplacementTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Displacement Map UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2010;
> = 0;
#endif

int ThicknessTexcoord <
	string UIGroup = "UV";
	string UIWidget = "Slider";
	string UIFieldNames = "TexCoord0:TexCoord1:TexCoord2";
	string UIName = "Translucency Mask UV";
	float UIMin = 0;
	float UIMax = 2;
	float UIStep = 1;
	int UIOrder = 2011;
> = 0;
} //end UpdatePerObject cbuffer

//------------------------------------
// Light parameters
//------------------------------------
cbuffer UpdateLights : register(b2) {
// ---------------------------------------------
// Light 0 GROUP
// ---------------------------------------------
// This value is controlled by Maya to tell us if a light should be calculated
// For example the artist may disable a light in the scene, or choose to see only the selected light
// This flag allows Maya to tell our shader not to contribute this light into the lighting
bool light0Enable : LIGHTENABLE <
string Object = "Light 0";	// UI Group for lights, auto-closed
string UIName = "Enable Light 0";
int UIOrder = 20;
#ifdef _MAYA_
> = false;	// maya manages lights itself and defaults to no lights
#else
> = true;	// in 3dsMax we should have the default light enabled
#endif

// follows LightParameterInfo::ELightType
// spot = 2, point = 3, directional = 4, ambient = 5,
int light0Type : LIGHTTYPE <
	string Object = "Light 0";
	string UIName = "Light 0 Type";
	string UIFieldNames = "None:Default:Spot:Point:Directional:Ambient";
	int UIOrder = 21;
	float UIMin = 0;
	float UIMax = 5;
	float UIStep = 1;
> = 2;	// default to spot so the cone angle etc work when "Use Shader Settings" option is used

float3 light0Pos : POSITION <
	string Object = "Light 0";
	string UIName = "Light 0 Position";
	string Space = "World";
	int UIOrder = 22;
	int RefID = 0; // 3DSMAX
> = { 100.0f, 100.0f, 100.0f };

float3 light0Color : LIGHTCOLOR <
	string Object = "Light 0";
#ifdef _3DSMAX_
	int LightRef = 0;
	string UIWidget = "None";
#else
	string UIName = "Light 0 Color";
	string UIWidget = "Color";
	int UIOrder = 23;
#endif
> = { 1.0f, 1.0f, 1.0f };

float light0Intensity : LIGHTINTENSITY <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 0";
	string UIName = "Light 0 Intensity";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 24;
#endif
> = { 1.0f };

float3 light0Dir : DIRECTION <
	string Object = "Light 0";
	string UIName = "Light 0 Direction";
	string Space = "World";
	int UIOrder = 25;
	int RefID = 0; // 3DSMAX
> = { 100.0f, 100.0f, 100.0f };

#ifdef _MAYA_
float light0ConeAngle : HOTSPOT // In radians
#else
float light0ConeAngle : LIGHTHOTSPOT
#endif
<
	string Object = "Light 0";
#ifdef _3DSMAX_
	int LightRef = 0;
	string UIWidget = "None";
#else
	string UIName = "Light 0 Cone Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 26;
#endif
> = { 0.46f };

#ifdef _MAYA_
float light0FallOff : FALLOFF // In radians. Sould be HIGHER then cone angle or lighted area will invert
#else
float light0FallOff : LIGHTFALLOFF
#endif
<
	string Object = "Light 0";
#ifdef _3DSMAX_
	int LightRef = 0;
	string UIWidget = "None";
#else
	string UIName = "Light 0 Penumbra Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 27;
#endif
> = { 0.7f };

float light0AttenScale : DECAYRATE <
	string Object = "Light 0";
	string UIName = "Light 0 Decay";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 28;
> = { 0.0 };

bool light0ShadowOn : SHADOWFLAG <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 0";
	string UIName = "Light 0 Casts Shadow";
	string UIWidget = "None";
	int UIOrder = 29;
#endif
> = true;

float4x4 light0Matrix : SHADOWMAPMATRIX <
	string Object = "Light 0";
	string UIWidget = "None";
>;

// ---------------------------------------------
// Light 1 GROUP
// ---------------------------------------------
bool light1Enable : LIGHTENABLE <
	string Object = "Light 1";
	string UIName = "Enable Light 1";
	int UIOrder = 30;
> = false;

int light1Type : LIGHTTYPE <
	string Object = "Light 1";
	string UIName = "Light 1 Type";
	string UIFieldNames = "None:Default:Spot:Point:Directional:Ambient";
	float UIMin = 0;
	float UIMax = 5;
	int UIOrder = 31;
> = 2;

float3 light1Pos : POSITION <
	string Object = "Light 1";
	string UIName = "Light 1 Position";
	string Space = "World";
	int UIOrder = 32;
	int RefID = 1; // 3DSMAX
> = { -100.0f, 100.0f, 100.0f };

float3 light1Color : LIGHTCOLOR <
	string Object = "Light 1";
#ifdef _3DSMAX_
	int LightRef = 1;
	string UIWidget = "None";
#else
	string UIName = "Light 1 Color";
	string UIWidget = "Color";
	int UIOrder = 33;
#endif
> = { 1.0f, 1.0f, 1.0f };

float light1Intensity : LIGHTINTENSITY <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 1";
	string UIName = "Light 1 Intensity";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 34;
#endif
> = { 1.0f };

float3 light1Dir : DIRECTION <
	string Object = "Light 1";
	string UIName = "Light 1 Direction";
	string Space = "World";
	int UIOrder = 35;
	int RefID = 1; // 3DSMAX
> = { 100.0f, 100.0f, 100.0f };

#ifdef _MAYA_
float light1ConeAngle : HOTSPOT // In radians
#else
float light1ConeAngle : LIGHTHOTSPOT
#endif
<
	string Object = "Light 1";
#ifdef _3DSMAX_
	int LightRef = 1;
	string UIWidget = "None";
#else
	string UIName = "Light 1 Cone Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 36;
#endif
> = { 45.0f };

#ifdef _MAYA_
float light1FallOff : FALLOFF // In radians. Sould be HIGHER then cone angle or lighted area will invert
#else
float light1FallOff : LIGHTFALLOFF
#endif
<
	string Object = "Light 1";
#ifdef _3DSMAX_
	int LightRef = 1;
	string UIWidget = "None";
#else
	string UIName = "Light 1 Penumbra Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 37;
#endif
> = { 0.0f };

float light1AttenScale : DECAYRATE <
	string Object = "Light 1";
	string UIName = "Light 1 Decay";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 38;
> = { 0.0 };

bool light1ShadowOn : SHADOWFLAG <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 1";
	string UIName = "Light 1 Casts Shadow";
	string UIWidget = "None";
	int UIOrder = 39;
#endif
> = true;

float4x4 light1Matrix : SHADOWMAPMATRIX <
	string Object = "Light 1";
	string UIWidget = "None";
>;

// ---------------------------------------------
// Light 2 GROUP
// ---------------------------------------------
bool light2Enable : LIGHTENABLE <
	string Object = "Light 2";
	string UIName = "Enable Light 2";
	int UIOrder = 40;
> = false;

int light2Type : LIGHTTYPE <
	string Object = "Light 2";
	string UIName = "Light 2 Type";
	string UIFieldNames = "None:Default:Spot:Point:Directional:Ambient";
	float UIMin = 0;
	float UIMax = 5;
	int UIOrder = 41;
> = 2;

float3 light2Pos : POSITION <
	string Object = "Light 2";
	string UIName = "Light 2 Position";
	string Space = "World";
	int UIOrder = 42;
	int RefID = 2; // 3DSMAX
> = { 100.0f, 100.0f, -100.0f };

float3 light2Color : LIGHTCOLOR <
	string Object = "Light 2";
#ifdef _3DSMAX_
	int LightRef = 2;
	string UIWidget = "None";
#else
	string UIName = "Light 2 Color";
	string UIWidget = "Color";
	int UIOrder = 43;
#endif
> = { 1.0f, 1.0f, 1.0f };

float light2Intensity : LIGHTINTENSITY <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 2";
	string UIName = "Light 2 Intensity";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 44;
#endif
> = { 1.0f };

float3 light2Dir : DIRECTION <
	string Object = "Light 2";
	string UIName = "Light 2 Direction";
	string Space = "World";
	int UIOrder = 45;
	int RefID = 2; // 3DSMAX
> = { 100.0f, 100.0f, 100.0f };

#ifdef _MAYA_
float light2ConeAngle : HOTSPOT // In radians
#else
float light2ConeAngle : LIGHTHOTSPOT
#endif
<
	string Object = "Light 2";
#ifdef _3DSMAX_
	int LightRef = 2;
	string UIWidget = "None";
#else
	string UIName = "Light 2 Cone Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 46;
#endif
> = { 45.0f };

#ifdef _MAYA_
float light2FallOff : FALLOFF // In radians. Sould be HIGHER then cone angle or lighted area will invert
#else
float light2FallOff : LIGHTFALLOFF
#endif
<
string Object = "Light 2";
#ifdef _3DSMAX_
	int LightRef = 2;
	string UIWidget = "None";
#else
	string UIName = "Light 2 Penumbra Angle";
	float UIMin = 0;
	float UIMax = PI / 2;
	int UIOrder = 47;
#endif
> = { 0.0f };

float light2AttenScale : DECAYRATE <
	string Object = "Light 2";
	string UIName = "Light 2 Decay";
	float UIMin = 0.0;
	float UIMax = _3DSMAX_SPIN_MAX;
	float UIStep = 0.01;
	int UIOrder = 48;
> = { 0.0 };

bool light2ShadowOn : SHADOWFLAG <
#ifdef _3DSMAX_
	string UIWidget = "None";
#else
	string Object = "Light 2";
	string UIName = "Light 2 Casts Shadow";
	string UIWidget = "None";
	int UIOrder = 49;
#endif
> = true;

float4x4 light2Matrix : SHADOWMAPMATRIX <
	string Object = "Light 2";
	string UIWidget = "None";
>;

} //end lights cbuffer

//------------------------------------
// Structs
//------------------------------------
struct APPDATA {
	float3 position		: POSITION;
	float2 texCoord0	: TEXCOORD0;
	float2 texCoord1	: TEXCOORD1;
	float2 texCoord2	: TEXCOORD2;
	float3 normal		: NORMAL;
	float3 binormal		: BINORMAL;
	float3 tangent		: TANGENT;
};

struct SHADERDATA {
	float4 position			: SV_Position;
	float2 texCoord0		: TEXCOORD0;
	float2 texCoord1		: TEXCOORD1;
	float2 texCoord2		: TEXCOORD2;
	float3 worldNormal   	: NORMAL;
	float4 worldTangent 	: TANGENT;
	float3 worldPosition	: TEXCOORD3;
	float4 screenCoord	: TEXCOORD14;

#ifdef _SUPPORTTESSELLATION_
	// Geometry generated control points:
	// .worldPosition is CP0, so we don't need to store it again
	float3 CP1    : TEXCOORD4;
	float3 CP2    : TEXCOORD5;

	// PN-AEN with displacement fix:
	float4 dominantEdge    : TEXCOORD6;	// both vertices of an edge
	float2 dominantVertex  : TEXCOORD7;	// corner

	// Dominant normal and tangent for VDM crack fix:
	// this could be compacted into less texcoords, but left as-is for readability
	float3 dominantNormalE0 : TEXCOORD8;
	float3 dominantNormalE1 : TEXCOORD9;
	float3 dominantNormalCorner : TEXCOORD10;

	float3 dominantTangentE0 : TEXCOORD11;
	float3 dominantTangentE1 : TEXCOORD12;
	float3 dominantTangentCorner : TEXCOORD13;

	float clipped : CLIPPED;
#endif
};


#ifdef _SUPPORTTESSELLATION_
struct HSCONSTANTDATA {
	float TessFactor[3]		: SV_TessFactor;		// tessellation amount for each edge of patch
	float InsideTessFactor : SV_InsideTessFactor;	// tessellation amount within a patch surface (would be float2 for quads)
	float3 CPCenter			: CENTER;				// Geometry generated center control point
};
#endif

//------------------------------------
// BRDF
//------------------------------------

float sqr(float x) {
	return x*x;
}

// [Beckmann 1963, "The scattering of electromagnetic waves from rough surfaces"]
float D_Beckmann(float Roughness, float NoH) {
	float m = Roughness;
	float m2 = m * m;

	float NdotH2 = sqr(NoH);
	return exp((NdotH2 - 1) / (m2 * NdotH2)) / (PI * m2 * NdotH2 * NdotH2);
}

// This function is from Nvidia's Human Head demo
float D_BeckmannNVIDIA(float m, float ndoth) {
	float alpha = acos(ndoth);
	float ta = tan(alpha);
	float val = 1.0 / (m*m*pow(ndoth, 4.0)) * exp(-(ta*ta) / (m*m));
	return val;
}

// Schlick 1994, "An Inexpensive BRDF Model for Physically-Based Rendering"
// Lagarde 2012, "Spherical Gaussian approximation for Blinn-Phong, Phong and Fresnel"
float3 F_Schlick(float3 SpecularColor, float LdotH) {
	return SpecularColor + (1.0f - SpecularColor) * exp2((-5.55473 * LdotH - 6.98316) * LdotH);
}

// Schlick 1994, "An Inexpensive BRDF Model for Physically-Based Rendering"
// Lagarde 2011, "Adopting a physically based shading model"
// Lagarde 2012, "Spherical Gaussian approximation for Blinn-Phong, Phong and Fresnel"
float3 F_LagardeSchlick(float3 SpecularColor, float Roughness, float NdotV) {
	return SpecularColor + (max(1 - Roughness, SpecularColor) - SpecularColor)  * exp2((-5.55473 * NdotV - 6.98316) * NdotV);
}

float3 F_KelemenSzirmaykalos(float3 H, float3 V, float3 F0) {
	float base = 1.0 - dot(V, H);
	float exponential = pow(base, 5.0);
	return exponential + F0 * (1.0 - exponential);
}

float3 KelemenSzirmaykalos(float3 N, float3 L, float3 V, float roughness, float3 specular) {
	float3 result = float3(0.0, 0.0, 0.0);
	float NdotL = dot(N, L);

	if (NdotL > 0.0) {
		float3 h = L + V;
		float3 H = normalize(h);
		float NdotH = dot(N, H);
		float VdotH = dot(V, H);
		float D = D_BeckmannNVIDIA(roughness, NdotH);
		float3 F = F_Schlick(specular, VdotH);
		float G = 1;
		float3 specularDirect = max(D * G * F / dot(h, h), 0);
		result = specularDirect * NdotL; // Specular is added for more tuning
	}
	return result;
}

float3 PennerSkin(float3 skinCoef, float3 N, float3 L, float3 Nlow, float Curvature) {
	float3 pennerX = lerp(N, Nlow, skinCoef.x);
	float3 pennerY = lerp(N, Nlow, skinCoef.y);
	float3 pennerZ = lerp(N, Nlow, skinCoef.z);

	float3 pennerNdotL = float3(dot(pennerX, L), dot(pennerY, L), dot(pennerZ, L));
	pennerNdotL = saturate(pennerNdotL * 0.5 + 0.5);

	float3 pennerlookUp;
	pennerlookUp.r = LutTexture.Sample(SamplerAnisoClamp, float2(pennerNdotL.r, Curvature)).r;
	pennerlookUp.g = LutTexture.Sample(SamplerAnisoClamp, float2(pennerNdotL.g, Curvature)).g;
	pennerlookUp.b = LutTexture.Sample(SamplerAnisoClamp, float2(pennerNdotL.b, Curvature)).b;

	return pennerlookUp;
}

float3 PennerSkinNoLUT(float3 skinCoef, float3 N, float3 L, float3 Nlow) {
	float3 pennerX = lerp(N, Nlow, skinCoef.x);
	float3 pennerY = lerp(N, Nlow, skinCoef.y);
	float3 pennerZ = lerp(N, Nlow, skinCoef.z);

	float3 pennerNdotL = float3(dot(pennerX, L), dot(pennerY, L), dot(pennerZ, L));

	float3 pennerlookUp;
	pennerlookUp.r = saturate(pennerNdotL.r*(float3(1, 1, 1).r - skinCoef.r) + skinCoef.r) * (1 - skinCoef.r);
	pennerlookUp.g = saturate(pennerNdotL.g*(float3(1, 1, 1).g - skinCoef.g) + skinCoef.g) * (1 - skinCoef.g);
	pennerlookUp.b = saturate(pennerNdotL.b*(float3(1, 1, 1).b - skinCoef.b) + skinCoef.b) * (1 - skinCoef.b);

	return pennerlookUp;
}

float3 diffuseSkinIBL(float3 skinCoef, float3 diffuseIBL_HighFreq, float3 diffuseIBL_LowFreq) {
	return lerp(diffuseIBL_HighFreq, diffuseIBL_LowFreq, skinCoef);
}

//------------------------------------
// Functions
//------------------------------------

float4 ComputeScreenPos(float4 pos) {
#if UNITY_UV_STARTS_AT_TOP
	float scale = -1.0;
#else
	float scale = 1.0;
#endif

	float4 o = pos * 0.5f;
	o.xy = float2(o.x, o.y*scale) + o.w;
	o.zw = pos.zw;

	return o;
}

// Occlusion taking into account the color of the texture multiplied to it
float3 coloredOcclusion(float3 color, float occlusion) {
	float3 coloredOcclusion = lerp(float3(1.0f, 1.0f, 1.0f), color, (1 - occlusion));
		//color *= coloredOcclusion;
		return coloredOcclusion;
}

float specularOcclusion(float3 N, float3 V, float Occlusion) {
	const float specularPow = 5.0;
	float NdotV = dot(N, V);
	float s = saturate(-0.3 + NdotV * NdotV);

	return lerp(pow(Occlusion, specularPow), 1.0, s);
}

float2 pickTexcoord(int index, float2 t0, float2 t1, float2 t2) {
	float2 tcoord = t0;

	if (index == 1) {
		tcoord = t1;
	} else if (index == 2) {
		tcoord = t2;
	}

	return tcoord;
}

float3 RotateVectorYaw(float3 vec, float degreeOfRotation) {
	float3 rotatedVec = vec;
	float angle = radians(degreeOfRotation);

	rotatedVec.x = (cos(angle) * vec.x) - (sin(angle) * vec.z);
	rotatedVec.z = (sin(angle) * vec.x) + (cos(angle) * vec.z);

	return rotatedVec;
}

// Spot light cone
float lightConeangle(float coneAngle, float coneFalloff, float3 lightVec, float3 lightDir) {
	// the cone falloff should be equal or bigger then the coneAngle or the light inverts
	// this is added to make manually tweaking the spot settings easier.
	if (coneFalloff < coneAngle) {
		coneFalloff = coneAngle;
	}

	float LdotDir = dot(normalize(lightVec), lightDir);

	// cheaper cone, no fall-off control would be:
	// float cone = pow(saturate(LdotDir), 1 / coneAngle);

	// higher quality cone (more expensive):
	float cone = smoothstep(cos(coneFalloff), cos(coneAngle), LdotDir);

	return cone;
}

#define SHADOW_FILTER_TAPS_CNT 10

float2 SuperFilterTaps[SHADOW_FILTER_TAPS_CNT] < string UIWidget = "None"; > = {
	{ -0.84052f, -0.073954f },
	{ -0.326235f, -0.40583f },
	{ -0.698464f, 0.457259f },
	{ -0.203356f, 0.6205847f },
	{ 0.96345f, -0.194353f },
	{ 0.473434f, -0.480026f },
	{ 0.519454f, 0.767034f },
	{ 0.185461f, -0.8945231f },
	{ 0.507351f, 0.064963f },
	{ -0.321932f, 0.5954349f }
};

static float4 kernel[25] = {
	{ 0.530605, 0.613514, 0.739601, 0 },
	{ 0.000973794, 1.11862e-005, 9.43437e-007, -3 },
	{ 0.00333804, 7.85443e-005, 1.2945e-005, -2.52083 },
	{ 0.00500364, 0.00020094, 5.28848e-005, -2.08333 },
	{ 0.00700976, 0.00049366, 0.000151938, -1.6875 },
	{ 0.0094389, 0.00139119, 0.000416598, -1.33333 },
	{ 0.0128496, 0.00356329, 0.00132016, -1.02083 },
	{ 0.017924, 0.00711691, 0.00347194, -0.75 },
	{ 0.0263642, 0.0119715, 0.00684598, -0.520833 },
	{ 0.0410172, 0.0199899, 0.0118481, -0.333333 },
	{ 0.0493588, 0.0367726, 0.0219485, -0.1875 },
	{ 0.0402784, 0.0657244, 0.04631, -0.0833333 },
	{ 0.0211412, 0.0459286, 0.0378196, -0.0208333 },
	{ 0.0211412, 0.0459286, 0.0378196, 0.0208333 },
	{ 0.0402784, 0.0657244, 0.04631, 0.0833333 },
	{ 0.0493588, 0.0367726, 0.0219485, 0.1875 },
	{ 0.0410172, 0.0199899, 0.0118481, 0.333333 },
	{ 0.0263642, 0.0119715, 0.00684598, 0.520833 },
	{ 0.017924, 0.00711691, 0.00347194, 0.75 },
	{ 0.0128496, 0.00356329, 0.00132016, 1.02083 },
	{ 0.0094389, 0.00139119, 0.000416598, 1.33333 },
	{ 0.00700976, 0.00049366, 0.000151938, 1.6875 },
	{ 0.00500364, 0.00020094, 5.28848e-005, 2.08333 },
	{ 0.00333804, 7.85443e-005, 1.2945e-005, 2.52083 },
	{ 0.000973794, 1.11862e-005, 9.43437e-007, 3 }
};


static float2 kernelRandom[32] = {
	{ 0.254395, 0.385445 },
	{ -0.139177, 0.571074 },
	{ -0.453510, 0.962140 },
	{ 0.482684, 0.346190 },
	{ 0.889741, 0.724799 },
	{ -0.661047, -0.137344 },
	{ -0.193311, -0.313475 },
	{ 0.363177, -0.960291 },
	{ -0.225866, -0.654962 },
	{ 0.407875, 0.431522 },
	{ -0.543008, -0.992827 },
	{ -0.878493, -0.896999 },
	{ -0.641776, 0.130757 },
	{ -0.785279, -0.015190 },
	{ 0.469054, 0.248633 },
	{ -0.820410, -0.562833 },
	{ 0.174019, -0.618069 },
	{ -0.906449, -0.275099 },
	{ -0.655285, -0.956021 },
	{ 0.453776, -0.085425 },
	{ -0.430788, -0.089530 },
	{ -0.587370, -0.851826 },
	{ 0.149056, -0.474322 },
	{ 0.228684, 0.321661 },
	{ -0.668752, -0.829400 },
	{ -0.729554, 0.438250 },
	{ -0.467018, -0.252882 },
	{ 0.090398, 0.618760 },
	{ 0.741840, 0.516401 },
	{ -0.983891, 0.248701 },
	{ -0.162010, -0.714455 },
	{ 0.308825, 0.787175 }
};

float shadowMapTexelSize < string UIWidget = "None"; > = { 0.00195313 }; // (1.0f / 512)

// Shadows:
// Percentage-Closer Filtering
float3 lightShadow(float4x4 LightViewPrj, uniform Texture2D ShadowMapTexture, float3 VertexWorldPosition, float2 screenCoord, float skinRadius, float2 size) {
	float4 dither = 2.0 * DitherTexture.SampleLevel(SamplerAnisoWrap, screenCoord.xy * size / 128, 0) - 1.0;
	float2x2 rotationMatrix = float2x2(dither.x, dither.y, -dither.y, dither.x);

	float ditherShadow = 0;
	float shadowColored = 0;

	float4 Pndc = mul(float4(VertexWorldPosition.xyz, 1.0), LightViewPrj);
	Pndc.xyz /= Pndc.w;

	if (Pndc.x > -1.0f && Pndc.x < 1.0f && Pndc.y  > -1.0f && Pndc.y <  1.0f && Pndc.z >  0.0f && Pndc.z <  1.0f) {
		float2 uv = 0.5f * Pndc.xy + 0.5f;
			uv = float2(uv.x, (1.0 - uv.y));	// maya flip Y
		float z = Pndc.z - shadowDepthBias / Pndc.w;

		screenCoord.y = 1 - screenCoord.y;

		float shadowDepth = skinRadius;
		shadowDepth *= 4.0;

		for (int i = 0; i < 32; ++i) {
			float2 offset = kernelRandom[i] * shadowDepth * shadowMapTexelSize;
			float2 ditherOffset = mul(offset, rotationMatrix);
			ditherOffset = lerp(offset, ditherOffset, shadowDither);
			float3 sample = z - ShadowMapTexture.SampleLevel(SamplerShadowDepth, uv + ditherOffset, 0).x;

			ditherShadow += (sample >= 0.0f) ? 0.0f : (1.0f / 32);
		}
	}

	return ditherShadow;
}

float3 lightShadowSkin(float4x4 LightViewPrj, uniform Texture2D ShadowMapTexture, float3 VertexWorldPosition, float2 screenCoord, float skinRadius, float2 size, float2 dir) {

	float4 dither = 2.0 * DitherTexture.SampleLevel(SamplerAnisoWrap, screenCoord.xy * size / 128, 0) - 1.0;
	float2x2 rotationMatrix = float2x2(dither.x, dither.y, -dither.y, dither.x);

	float ditherShadow = 0;
	float3 shadowColored = float3(0, 0, 0);

		float4 Pndc = mul(float4(VertexWorldPosition.xyz, 1.0), LightViewPrj);
		Pndc.xyz /= Pndc.w;
	if (Pndc.x > -1.0f && Pndc.x < 1.0f && Pndc.y  > -1.0f && Pndc.y <  1.0f && Pndc.z >  0.0f && Pndc.z <  1.0f) {
		float2 uv = 0.5f * Pndc.xy + 0.5f;
		uv = float2(uv.x, (1.0 - uv.y));	// maya flip Y

		float z = Pndc.z - shadowDepthBias / Pndc.w;
		screenCoord.y = 1 - screenCoord.y;

		float shadowDepth = skinRadius;
		shadowDepth *= 4.0;

		for (int i = 0; i < 25; ++i) {
			float2 offset = kernel[i].a * dir * shadowDepth * shadowMapTexelSize;
			offset = mul(offset, rotationMatrix);
			float3 sample = z - ShadowMapTexture.SampleLevel(SamplerShadowDepth, uv + offset, 0).x;
			ditherShadow = (sample >= 0.0f) ? 0.0f : 1.0f;

			shadowColored += ditherShadow * kernel[i].rgb;
		}
	}

	return shadowColored;
}

#ifdef _SUPPORTTESSELLATION_
// Pick dominant for crack free displacement (original function by Bryan Dudash, modified to support any float3)
float3 PickDominant(float3 vec,			// vector to change
	float U, float V, float W,	// barycoords
	float3 DE0A, float3 DE0B,	// domimant edge 0 vertex A and B
	float3 DE1A, float3 DE1B,	// domimant edge 1 vertex A and B
	float3 DE2A, float3 DE2B,	// domimant edge 2 vertex A and B
	float3 DV0, float3 DV1, float3 DV2) { // dominant corners
	// Override the texture coordinates along the primitive edges and at the corners.
	// Keep the original interpolated coords for the inner area of the primitive.

	float3 dominantVector = vec;

	float edgeThreshold = 0.0001f;
	float edgeU = (U == 0) ? 1 : 0;
	float edgeV = (V == 0) ? 1 : 0;
	float edgeW = (W == 0) ? 1 : 0;

	float corner = ((edgeU + edgeV + edgeW) == 2) ? 1 : 0;		// two are 0, means we are a corner
	float edge = ((edgeU + edgeV + edgeW) == 1) ? 1 : 0;		// one of them is 0, means we are an edge
	float innerarea = ((edgeU + edgeV + edgeW) == 0) ? 1 : 0;	// none are 0, means we are interior

	if (innerarea != 1) {
		// Note: the order of the vertices/edges we choose here can be different per application
		//		 and depend on how the index buffer was generated.
		//		 These work for Maya with its PN-AEN18 primitive generator
		if (corner) {
			if (U > 1.0 - edgeThreshold)
				dominantVector = DV1;
			else if (V > 1.0 - edgeThreshold)
				dominantVector = DV2;
			else if (W > 1.0 - edgeThreshold)
				dominantVector = DV0;
		} else {
			if (edgeU)
				dominantVector = lerp(DE2A, DE2B, W);
			else if (edgeV)
				dominantVector = lerp(DE0A, DE0B, U);
			else
				dominantVector = lerp(DE1A, DE1B, V);
		}
	}

	return dominantVector;
}

// outside of view?
float IsClipped(float4 clipPos) {
	float W = clipPos.w + DisplacementClippingBias;	// bias allows artist to control to early clipping due to displacement
	// Test whether the position is entirely inside the view frustum.
	return (-W <= clipPos.x && clipPos.x <= W && -W <= clipPos.y && clipPos.y <= W && -W <= clipPos.z && clipPos.z <= W) ? 0.0f : 1.0f;
}

// Compute whether all three control points along the edge are outside of the view frustum.
// By doing this, we're ensuring that
// 1.0 means clipped, 0.0 means unclipped.
float ComputeClipping(float3 cpA, float3 cpB, float3 cpC) {
	// Compute the projected position for each position, then check to see whether they are clipped.
	float4 projPosA = mul(float4(cpA, 1), viewPrj), projPosB = mul(float4(cpB, 1), viewPrj), projPosC = mul(float4(cpC, 1), viewPrj);
	return min(min(IsClipped(projPosA), IsClipped(projPosB)), IsClipped(projPosC));
}

// PN Triangles and PN-AEN control points:
float3 ComputeCP(float3 posA, float3 posB, float3 normA) {
	return (2.0f * posA + posB - (dot((posB - posA), normA) * normA)) / 3.0f;
}
#endif

// Clip pixel away when opacity mask is used
void OpacityMaskClip(float2 uv) {
	if (UseOpacityMaskTexture) {
		float OpacityMaskMap = OpacityMaskTexture.Sample(SamplerAnisoWrap, uv).x;

		// clip value when less then 0 for punch-through alpha.
		clip(OpacityMaskMap < OpacityMaskBias ? -1 : 1);
	}
}


// Calculate a light:
struct lightOut {
	float Specular;
	float3 Color;
};

lightOut CalculateLight(bool lightEnable, int lightType, float lightAtten, float3 lightPos, float3 vertWorldPos,
	float3 lightColor, float lightIntensity, float3 lightDir, float lightConeAngle, float lightFallOff, float4x4 lightViewPrjMatrix,
	uniform Texture2D lightShadowMap, bool lightShadowOn, float3 vertexNormal, float3 normal, float3 diffuseColorIn,
	float3 eyeVec, float roughness, float3 specularColorIn, float3 thickness, float softenMask,
	float gammaCorrection, float opacity, float3 ambientOcclusion, float3 skinOcclusion, float2 screenCoord, float2 size, float scatteringRadius) {
	lightOut OUT = (lightOut)0;

	OUT.Specular = 0.0;
	OUT.Color = float3(0, 0, 0);

	if (lightEnable) {
		// For Maya, flip the lightDir:
#ifdef _MAYA_
	lightDir = -lightDir;
#endif

	bool isAmbientLight = (lightType == 5);
	if (isAmbientLight) {
		OUT.Color = diffuseColorIn * lightColor * lightIntensity;
		OUT.Color.rgb *= ambientOcclusion;
		return OUT;
	}

	bool isDirectionalLight = (lightType == 4);
	float3 lightVec = lerp(lightPos - vertWorldPos, lightDir, isDirectionalLight);

	float3 L = normalize(lightVec);

	// Diffuse:
	float3 diffuseDirect = float3(0, 0, 0);
	float3 scatter = float3(skinCoeffX, skinCoeffY, skinCoeffZ);
	diffuseDirect = PennerSkin(scatter, normal, L, vertexNormal, 1 - (scatteringRadius*skinScattering)) * diffuseColorIn;
	//diffuseDirect = PennerSkinNoLUT(scatter,normal,L, vertexNormal) * diffuseColorIn;

	// Specular:
	float3 specularDirect = float3(0, 0, 0);

	float3 Lobe1 = KelemenSzirmaykalos(normal, L, eyeVec, roughness, specularColorIn);
	float3 Lobe2 = KelemenSzirmaykalos(normal, L, eyeVec, roughness*0.5, specularColorIn);

	specularDirect = Lobe2 * LobeMix + Lobe1 * (1 - LobeMix);

	// Light Attenuation:
	bool enableAttenuation = lightAtten > 0.0001f;
	float attenuation = 1.0f;
	if (!isDirectionalLight) {
		attenuation = lerp(1.0, 1 / pow(length(lightVec), lightAtten), enableAttenuation);
	}

	// Spot light Cone Angle:
	float angle = 1;
	if (lightType == 2) {
		angle = lightConeangle(lightConeAngle, lightFallOff, lightVec, lightDir);
	}

	// Shadows:
	float shadow = 1;
	float3 skinShadow = float3(1, 1, 1);
	float3 softShadow = float3(1, 1, 1);
	if (UseShadows && lightShadowOn) {
		shadow = lightShadow(lightViewPrjMatrix, lightShadowMap, vertWorldPos, screenCoord, shadowBlur, size);

		skinShadow = LutTexture.Sample(SamplerAnisoClamp, float2(shadow * angle, 1 - shadowScattering));
		skinShadow = lerp(dot(float3(0.33, 0.59, 0.11), skinShadow), skinShadow, shadowSaturation);
		skinShadow = lerp(skinShadow, 1, (shadow* angle)*(shadow* angle)*(shadow* angle));
	}

	float3 lightAttenuation = lightIntensity * angle * attenuation * lightColor;

	diffuseDirect *= lightIntensity * skinShadow * attenuation * lightColor;
	specularDirect *= lightAttenuation * shadow;

	float3 backScattering = float3(0, 0, 0);
	if (UseTranslucency) {
		half backRoughness = (1 - skinScatteringRoughness) * 128;
		float3 viewScattering = exp2(saturate(dot(eyeVec, -(L + (normal * 0.01)))) * backRoughness - backRoughness) * skinScatteringAmount;
		float3 lightScattering = saturate(dot(-L, normal)*0.5 + 0.5) * skinAmbientScatteringAmount;

		//float3 IBLScattering = diffuseIBL;
		backScattering = (viewScattering + lightScattering) * lightAttenuation * shadow * thickness;

		float3 profile = skinScatteringOuterColor * backScattering;
		backScattering = profile * skinScatteringAmount;


		/*float scale = 2e4 * (1.0 - skinScatteringAmount) / backRoughness;

		float4 shrinkedPos = float4(vertWorldPos - 0.005 * vertexNormal, 1.0);

		float4 shadowPosition = mul(shrinkedPos, lightViewPrjMatrix);

		float d1 = lightShadowMap.Sample(SamplerShadowDepth, shadowPosition.xy / shadowPosition.w); // 'd1' has a range of 0..1

		float d2 = shadowPosition.z; // 'd2' has a range of 0..'lightFarPlane'
		d1 *= skinScatteringPlane*shadowPosition.w; // So we scale 'd1' accordingly:
		float d = scale * abs(d1 - d2);

		float dd = -d * d;
		float3 profile = float3(0.233, 0.455, 0.649) * exp(dd / 0.0064) +
		float3(0.1,   0.336, 0.344) * exp(dd / 0.0484) +
		float3(0.118, 0.198, 0.0)   * exp(dd / 0.187)  +
		float3(0.113, 0.007, 0.007) * exp(dd / 0.567)  +
		float3(0.358, 0.004, 0.0)   * exp(dd / 1.99)   +
		float3(0.078, 0.0,   0.0)   * exp(dd / 7.41);
		backScattering = profile * saturate((0.3 + dot(L, -vertexNormal)) / 1.3) * thickness * diffuseColorIn; */
	}

	OUT.Color += diffuseDirect * skinOcclusion;
	OUT.Color *= opacity;
	OUT.Color += specularDirect * ambientOcclusion + backScattering;

	// Output specular and rim for opacity:
	// OUT.Specular = dot(saturate(specularColor), float3(0.3f, 0.6f, 0.1f));
	} // end if light enabled

	return OUT;
}

//------------------------------------
// vertex shader with tessellation
//------------------------------------
// take inputs from 3d-app
// vertex animation/skinning would happen here
SHADERDATA vt(APPDATA IN) {
	SHADERDATA OUT = (SHADERDATA)0;

	// we pass vertices in world space
	float4 worldPos = mul(float4(IN.position, 1), world);
	OUT.worldPosition.xyz = worldPos.xyz;

#ifdef _SUPPORTTESSELLATION_
	OUT.position = worldPos;
#else
	OUT.position = float4(IN.position.xyz, 1);
#endif

	OUT.screenCoord = mul(float4(OUT.position.xyz, 1), viewPrj);

	// Pass through texture coordinates
	// flip Y for Maya
#ifdef _MAYA_
	OUT.texCoord0 = float2(IN.texCoord0.x, (1.0 - IN.texCoord0.y));
	OUT.texCoord1 = float2(IN.texCoord1.x, (1.0 - IN.texCoord1.y));
	OUT.texCoord2 = float2(IN.texCoord2.x, (1.0 - IN.texCoord2.y));
#else
	OUT.texCoord0 = IN.texCoord0;
	OUT.texCoord1 = IN.texCoord1;
	OUT.texCoord2 = IN.texCoord2;
#endif

	// output normals in world space:
	if (!SupportNonUniformScale) {
		OUT.worldNormal = normalize(mul(IN.normal, (float3x3)world));
	} else {
		OUT.worldNormal = normalize(mul(IN.normal, (float3x3)worldIT));
	}

	// output tangent in world space:
	if (!SupportNonUniformScale) {
		OUT.worldTangent.xyz = normalize(mul(IN.tangent, (float3x3)world));
	} else {
		OUT.worldTangent.xyz = normalize(mul(IN.tangent, (float3x3)worldIT));
	}

	// store direction for normal map:
	OUT.worldTangent.w = 1;
	if (dot(cross(IN.normal.xyz, IN.tangent.xyz), IN.binormal.xyz) < 0.0) {
		OUT.worldTangent.w = -1;
	}

	return OUT;
}


//------------------------------------
// vertex shader without tessellation
//------------------------------------
SHADERDATA v(APPDATA IN) {
	SHADERDATA OUT = vt(IN);

	// If we don't use tessellation, pass vertices in clip space:
#ifdef _SUPPORTTESSELLATION_
	OUT.position = mul(float4(OUT.position.xyz, 1), viewPrj);
#else
	OUT.position = mul(float4(IN.position, 1), wvp);
#endif

	return OUT;
}

#ifdef _SUPPORTTESSELLATION_
//------------------------------------
// hull shader
//------------------------------------
// executed once per control point.
// control points can be considered the original vertices of the mesh
// outputs a control point
// run parallel with hull constant function
[domain("tri")]
[partitioning("fractional_odd")]
[outputtopology("triangle_cw")]
[patchconstantfunc("HS_Constant")]
[outputcontrolpoints(3)]
[maxtessfactor(64.0)]

// PN-AEN without displacement fix:
// SHADERDATA HS( InputPatch<SHADERDATA, 9> IN, uint index : SV_OutputControlPointID, uint patchID : SV_PrimitiveID )

// PN Triangles, no crack fixes:
// SHADERDATA HS( InputPatch<SHADERDATA, 3> IN, uint index : SV_OutputControlPointID, uint patchID : SV_PrimitiveID )


// PN-AEN and displacement fix
// the index buffer is made up as follows:
// the triangle vertices index (int3)					// PNAEN9 and PNAEN18
// the 3 adjacent edges vertices index (3 * int2)		// PNAEN9 and PNAEN18
// the 3 dominant edges vertices index (3 * int2)		// PNAEN18
// the dominant position vertices index (int3)			// PNAEN18
SHADERDATA HS(InputPatch<SHADERDATA, 18> IN, uint index : SV_OutputControlPointID, uint patchID : SV_PrimitiveID) {
	SHADERDATA OUT = (SHADERDATA)0;

	// copy everything first:
	OUT = IN[index];

	// Compute the next output control point ID so we know which edge we're on.
	const uint nextIndex = index < 2 ? index + 1 : 0; // (index + 1) % 3

	// PN-AEN 9 and 18:
	const uint neighborIndex = 3 + 2 * index;
	const uint neighborNextIndex = neighborIndex + 1;
	float3 myCP, neighborCP;

	// Calculate original PN control points and neighbors'.  Then average.
	myCP = ComputeCP(IN[index].worldPosition, IN[nextIndex].worldPosition, IN[index].worldNormal);
	neighborCP = ComputeCP(IN[neighborIndex].worldPosition, IN[neighborNextIndex].worldPosition, IN[neighborIndex].worldNormal);
	OUT.CP1 = (myCP + neighborCP) / 2;

	myCP = ComputeCP(IN[nextIndex].worldPosition, IN[index].worldPosition, IN[nextIndex].worldNormal);
	neighborCP = ComputeCP(IN[neighborNextIndex].worldPosition, IN[neighborIndex].worldPosition, IN[neighborNextIndex].worldNormal);
	OUT.CP2 = (myCP + neighborCP) / 2;

	// PN Triangles only would be:
	// OUT.CP1 = ComputeCP( IN[index].worldPosition, IN[nextIndex].worldPosition, IN[index].worldNormal);
	// OUT.CP2 = ComputeCP( IN[nextIndex].worldPosition, IN[index].worldPosition, IN[nextIndex].worldNormal);

	// Clipping:
	OUT.clipped = ComputeClipping(OUT.worldPosition, OUT.CP1, OUT.CP2);

	// PN-AEN discontinuity code for displacement UVs:
	const uint dominantEdgeIndex = 9 + 2 * index;
	const uint dominantEdgeNextIndex = dominantEdgeIndex + 1;
	const uint dominantVertexIndex = 15 + index;

	// Note: the order of the vertices/edges we choose here can be different per application and
	// depend on how the index buffer was generated.
	// These work for Maya with its PN-AEN18 primitive generator
	float2 dominantEdgeUV = pickTexcoord(DisplacementTexcoord, IN[dominantEdgeIndex].texCoord0, IN[dominantEdgeIndex].texCoord1, IN[dominantEdgeIndex].texCoord2);
	float2 dominantEdgeNextUV = pickTexcoord(DisplacementTexcoord, IN[dominantEdgeNextIndex].texCoord0, IN[dominantEdgeNextIndex].texCoord1, IN[dominantEdgeNextIndex].texCoord2);
	float2 dominantVertexUV = pickTexcoord(DisplacementTexcoord, IN[dominantVertexIndex].texCoord0, IN[dominantVertexIndex].texCoord1, IN[dominantVertexIndex].texCoord2);

	OUT.dominantEdge = float4(dominantEdgeNextUV, dominantEdgeUV);
	OUT.dominantVertex = dominantVertexUV;

	// VDM dominant normal and tangent for displacement crack fix:
	OUT.dominantNormalE0 = IN[dominantEdgeNextIndex].worldNormal.xyz;
	OUT.dominantNormalE1 = IN[dominantEdgeIndex].worldNormal.xyz;
	OUT.dominantNormalCorner = IN[dominantVertexIndex].worldNormal.xyz;

	OUT.dominantTangentE0 = IN[dominantEdgeNextIndex].worldTangent.xyz;
	OUT.dominantTangentE1 = IN[dominantEdgeIndex].worldTangent.xyz;
	OUT.dominantTangentCorner = IN[dominantVertexIndex].worldTangent.xyz;

	return OUT;
}

//------------------------------------
// Hull shader constant function
//------------------------------------
// executed once per patch
// outputs user defined data per patch and tessellation factor
// calculates control points for vertex and normal and passes to domain
// This hull shader passes the tessellation factors through to the HW tessellator,
// run parallel with hull function
HSCONSTANTDATA HS_Constant(const OutputPatch<SHADERDATA, 3> IN, uint patchID : SV_PrimitiveID) {
	HSCONSTANTDATA OUT = (HSCONSTANTDATA)0;

	// future todo:
	// triangle is on silhouette?
	// triangle is facing camera? If facing backwards, reduce tessellation
	// triangle lies in high frequency area of displacement map (density-based tessellation)?

	// Now setup the PNTriangle control points...
	// Center control point
	float3 f3E = (IN[0].CP1 + IN[0].CP2 + IN[1].CP1 + IN[1].CP2 + IN[2].CP1 + IN[2].CP2) / 6.0f;
	float3 f3V = (IN[0].worldPosition + IN[1].worldPosition + IN[2].worldPosition) / 3.0f;
	OUT.CPCenter = f3E + ((f3E - f3V) / 2.0f);

	// Clipping:
	float4 centerViewPos = mul(float4(OUT.CPCenter, 1), viewPrj);
	bool centerClipped = IsClipped(centerViewPos);

	if (IN[0].clipped && IN[1].clipped && IN[2].clipped && centerClipped) {
		// If all control points are clipped, the surface cannot possibly be visible.
		// Not entirely true, because displacement mapping can make them visible in the domain shader
		// so we provide the user with a bias factor to avoid clipping too early
		OUT.TessFactor[0] = OUT.TessFactor[1] = OUT.TessFactor[2] = 0;
	} else {
		// Camera based tessellation, per object. So very basic.
		float3 CameraPosition = viewInv[3].xyz;
			float LengthOp = length((CameraPosition - world[3].xyz));
		float DivOp = (TessellationRange / LengthOp);
		float MaxOp = max(TessellationMin + DivOp, 1);
		OUT.TessFactor[0] = OUT.TessFactor[1] = OUT.TessFactor[2] = MaxOp;
	}

	// Inside tess factor is just the average of the edge factors
	OUT.InsideTessFactor = (OUT.TessFactor[0] + OUT.TessFactor[1] + OUT.TessFactor[2]) / 3.0f;

	return OUT;
}

//------------------------------------
// domain shader
//------------------------------------
// outputs the new vertices based on previous tessellation.
// also calculates new normals and uvs
// This domain shader applies contol point weighting to the barycentric coords produced by the FF tessellator
// If you wanted to do any vertex lighting, it would have to happen here.
[domain("tri")]
SHADERDATA DS(HSCONSTANTDATA HSIN, OutputPatch<SHADERDATA, 3> IN, float3 f3BarycentricCoords : SV_DomainLocation) {
	SHADERDATA OUT = (SHADERDATA)0;

	// The barycentric coordinates
	float fU = f3BarycentricCoords.x;
	float fV = f3BarycentricCoords.y;
	float fW = f3BarycentricCoords.z;

	// Precompute squares and squares * 3
	float fUU = fU * fU;
	float fVV = fV * fV;
	float fWW = fW * fW;
	float fUU3 = fUU * 3.0f;
	float fVV3 = fVV * 3.0f;
	float fWW3 = fWW * 3.0f;

	// PN position:
	float3 position = IN[0].worldPosition * fWW * fW +
		IN[1].worldPosition * fUU * fU +
		IN[2].worldPosition * fVV * fV +
		IN[0].CP1 * fWW3 * fU +
		IN[0].CP2 * fW * fUU3 +
		IN[2].CP2 * fWW3 * fV +
		IN[1].CP1 * fUU3 * fV +
		IN[2].CP1 * fW * fVV3 +
		IN[1].CP2 * fU * fVV3 +
		HSIN.CPCenter * 6.0f * fW * fU * fV;

	// Flat position:
	float3 flatPosition = IN[0].worldPosition * fW + IN[1].worldPosition * fU + IN[2].worldPosition * fV;

	// allow user to blend between PN tessellation and flat tessellation:
	position = lerp(position, flatPosition, FlatTessellation);

	// Interpolate normal
	float3 normal = IN[0].worldNormal * fW + IN[1].worldNormal * fU + IN[2].worldNormal * fV;

	// Normalize the interpolated normal
	OUT.worldNormal = normalize(normal);

	// Compute tangent:
	float3 tangent = IN[0].worldTangent.xyz * fW + IN[1].worldTangent.xyz * fU + IN[2].worldTangent.xyz * fV;
	OUT.worldTangent.xyz = normalize(tangent.xyz);

	// Pass through the direction of the binormal as calculated in the vertex shader
	OUT.worldTangent.w = IN[0].worldTangent.w;

	// Linear interpolate the texture coords
	OUT.texCoord0 = IN[0].texCoord0 * fW + IN[1].texCoord0 * fU + IN[2].texCoord0 * fV;
	OUT.texCoord1 = IN[0].texCoord1 * fW + IN[1].texCoord1 * fU + IN[2].texCoord1 * fV;
	OUT.texCoord2 = IN[0].texCoord2 * fW + IN[1].texCoord2 * fU + IN[2].texCoord2 * fV;

	// apply displacement map (only when not rendering the Maya preview swatch):
	if (UseDisplacementMap && !IsSwatchRender) {
		// Fix Displacement Seams.
		// we assume here that the displacement UVs is UVset 0.
		// if this UVset index is changed, it should als be changed in the hull shader
		// PN-AEN 18 with displacement UV seam fix
		float2 displaceUV = pickTexcoord(DisplacementTexcoord, OUT.texCoord0, OUT.texCoord1, OUT.texCoord2);
		float3 displacementUVW = PickDominant(float3(displaceUV, 0), fU, fV, fW,
			float3(IN[0].dominantEdge.xy, 0), float3(IN[0].dominantEdge.zw, 0),
			float3(IN[1].dominantEdge.xy, 0), float3(IN[1].dominantEdge.zw, 0),
			float3(IN[2].dominantEdge.xy, 0), float3(IN[2].dominantEdge.zw, 0),
			float3(IN[0].dominantVertex.xy, 0),
			float3(IN[1].dominantVertex.xy, 0),
			float3(IN[2].dominantVertex.xy, 0));

		// We can still get cracks here because the world tangent and normal may be different for vertices on each side of the UV seam,
		// because we do the tangent to world conversion, we get the same diplacement amount, but it results in different movement once converted to world space.
		// And even a tiny difference between normal or tangent will cause large cracks.
		float3 displacementNormal = PickDominant(OUT.worldNormal,
			fU, fV, fW,
			IN[0].dominantNormalE0, IN[0].dominantNormalE1,
			IN[1].dominantNormalE0, IN[1].dominantNormalE1,
			IN[2].dominantNormalE0, IN[2].dominantNormalE1,
			IN[0].dominantNormalCorner,
			IN[1].dominantNormalCorner,
			IN[2].dominantNormalCorner);

		displacementNormal = normalize(displacementNormal);

		if (DisplacementModel == 1)	{ // Tangent Vector Displacement
			float3 displacementTangent = PickDominant(OUT.worldTangent.xyz, fU, fV, fW,
				IN[0].dominantTangentE0, IN[0].dominantTangentE1,
				IN[1].dominantTangentE0, IN[1].dominantTangentE1,
				IN[2].dominantTangentE0, IN[2].dominantTangentE1,
				IN[0].dominantTangentCorner,
				IN[1].dominantTangentCorner,
				IN[2].dominantTangentCorner);

			displacementTangent = normalize(displacementTangent);

			float3 vecDisp = DisplacementTexture.SampleLevel(SamplerAnisoWrap, displacementUVW.xy, 0).xyz;
			vecDisp -= DisplacementOffset;

			float3 Bn = cross(displacementNormal, displacementTangent);
			float3x3 toWorld = float3x3(displacementTangent, Bn.xyz, displacementNormal);

			float3 VDMcoordSys = vecDisp.xzy;		// Mudbox
			if (VectorDisplacementCoordSys == 1) {
				VDMcoordSys = vecDisp.xyz;			// Maya or ZBrush
			}

			float3 vecDispW = mul(VDMcoordSys, toWorld) * DisplacementHeight;
			position.xyz += vecDispW;
		} else {
			// offset (-0.5) so that we can have negative displacement also
			float offset = DisplacementTexture.SampleLevel(SamplerAnisoWrap, displacementUVW.xy, 0).x - DisplacementOffset;
			position.xyz += displacementNormal * offset * DisplacementHeight;
		}
	}

	// Update World Position value for inside pixel shader:
	OUT.worldPosition = position.xyz;

	// Transform model position with view-projection matrix
	//OUT.position = float4(position.xyz, 1);							// with geo
	OUT.position = mul(float4(position.xyz, 1), viewPrj);				// without geo

	return OUT;
}

//------------------------------------
// Geometry Shader
//------------------------------------
// This is a sample Geo shader. Disabled in this shader, but left here for your reference.
// If you wish to enable it, search for 'with geo' in this shader for code to change.
[maxvertexcount(3)] // Declaration for the maximum number of vertices to create
void GS(triangle SHADERDATA IN[3], inout TriangleStream<SHADERDATA> TriStream) {
	SHADERDATA OUT;

	// quick test to see if geo also works:
	for (int i = 0; i<3; ++i) {
		OUT = IN[i];
		OUT.position = mul(mul(float4(OUT.position.xyz, 1), view), prj);
		TriStream.Append(OUT);
	}
	TriStream.RestartStrip(); // end triangle
}
#endif

void sampleMasks() {

}

//------------------------------------
// pixel shader
//------------------------------------
float4 f(SHADERDATA IN, bool FrontFace : SV_IsFrontFace) : SV_Target {
#ifdef _3DSMAX_
	FrontFace = !FrontFace;
#endif
	// clip are early as possible
	float2 opacityMaskUV = pickTexcoord(OpacityMaskTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
	OpacityMaskClip(opacityMaskUV);

	float gammaCorrection = lerp(1.0, 2.2, LinearSpaceLighting);

	float3 N = normalize(IN.worldNormal.xyz);
	if (flipBackfaceNormals) {
		N = lerp(-N, N, FrontFace);
	}
	float3 Nw = N;

	// Tangent and BiNormal:
	float3 T = normalize(IN.worldTangent.xyz);
	float3 Bn = cross(N, T);
	Bn *= IN.worldTangent.w;

	float4 diffuse = float4(1, 1, 1, 1);
	if (UseDiffuseTexture) {
		float2 diffuseUV = pickTexcoord(DiffuseTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float4 diffuseTextureSample = DiffuseTexture.Sample(SamplerAnisoWrap, diffuseUV);

		if (UseDiffuseTextureAlpha) {
			diffuse.a = diffuseTextureSample.a;
		}

		diffuse.rgb *= pow(diffuseTextureSample.rgb, gammaCorrection);
	}

	float3 microNormal = float3(0, 0, 1);
	if (UseNormalTexture) {
		float3x3 toWorld = float3x3(T, Bn, N);

		float2 normalUV = pickTexcoord(NormalTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float3 NormalMap = NormalTexture.Sample(SamplerAnisoWrap, normalUV).xyz * 2.0 - 1.0;
		float3 backupNormal = NormalMap;

		if (NormalCoordsysX > 0)
			NormalMap.x = -NormalMap.x;
		if (NormalCoordsysY > 0)
			NormalMap.y = -NormalMap.y;

		NormalMap.xy *= NormalHeight;

		if (UseMicroNormalTexture) {
			float2 normalUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
			microNormal = MicroNormalTexture.Sample(SamplerAnisoWrap, normalUV * MicroScale).xyz * 2.0 - 1.0;

			microNormal.xy *= MicroNormalHeight;
			NormalMap.xy += microNormal.xy;
		}

		if (UseBlendTexture) {
			float2 blendUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);

            float3 animNormalSample_00 = animNormalMap_00.Sample(SamplerAnisoWrap, blendUV).xyz * 2.0 - 1.0;
			if (NormalCoordsysY > 0) {
				animNormalSample_00.y = -animNormalSample_00.y;
			}
			if (NormalCoordsysX > 0) {
				animNormalSample_00.x = -animNormalSample_00.x;
			}
			float3 animNormalDelta_00 = animNormalSample_00 - NormalMap;
			float3 animNormalSample_01 = animNormalMap_01.Sample(SamplerAnisoWrap, blendUV).xyz * 2.0 - 1.0;
			if (NormalCoordsysY > 0) {
				animNormalSample_01.y = -animNormalSample_01.y;
			}
			if (NormalCoordsysX > 0) {
				animNormalSample_01.x = -animNormalSample_01.x;
			}
			float3 animNormalDelta_01 = animNormalSample_01 - NormalMap;
			float3 animNormalSample_02 = animNormalMap_02.Sample(SamplerAnisoWrap, blendUV).xyz * 2.0 - 1.0;
			if (NormalCoordsysY > 0) {
				animNormalSample_02.y = -animNormalSample_02.y;
			}
			if (NormalCoordsysX > 0) {
				animNormalSample_02.x = -animNormalSample_02.x;
			}
			float3 animNormalDelta_02 = animNormalSample_02 - NormalMap;

			float3 animColorDelta_00 = (pow(animColorMap_00.Sample(SamplerAnisoWrap, blendUV).xyz, gammaCorrection)) - diffuse;
			float3 animColorDelta_01 = (pow(animColorMap_01.Sample(SamplerAnisoWrap, blendUV).xyz, gammaCorrection)) - diffuse;
			float3 animColorDelta_02 = (pow(animColorMap_02.Sample(SamplerAnisoWrap, blendUV).xyz, gammaCorrection)) - diffuse;

			float maskChannelVal_00 = maskChannel_00.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_01 = maskChannel_01.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_02 = maskChannel_02.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_03 = maskChannel_03.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_04 = maskChannel_04.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_05 = maskChannel_05.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_06 = maskChannel_06.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_07 = maskChannel_07.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_08 = maskChannel_08.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_09 = maskChannel_09.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_10 = maskChannel_10.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_11 = maskChannel_11.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_12 = maskChannel_12.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_13 = maskChannel_13.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_14 = maskChannel_14.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_15 = maskChannel_15.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_16 = maskChannel_16.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_17 = maskChannel_17.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_18 = maskChannel_18.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_19 = maskChannel_19.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_20 = maskChannel_20.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_21 = maskChannel_21.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_22 = maskChannel_22.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_23 = maskChannel_23.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_24 = maskChannel_24.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_25 = maskChannel_25.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_26 = maskChannel_26.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_27 = maskChannel_27.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_28 = maskChannel_28.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_29 = maskChannel_29.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_30 = maskChannel_30.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_31 = maskChannel_31.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_32 = maskChannel_32.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_33 = maskChannel_33.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_34 = maskChannel_34.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_35 = maskChannel_35.Sample(SamplerAnisoWrap, blendUV);
			float maskChannelVal_36 = maskChannel_36.Sample(SamplerAnisoWrap, blendUV);

			NormalMap.xy += animNormalDelta_00 * maskWeight_47 * maskChannelVal_36
						  + animNormalDelta_00 * maskWeight_15 * maskChannelVal_05
						  + animNormalDelta_00 * maskWeight_13 * maskChannelVal_04
						  + animNormalDelta_00 * maskWeight_46 * maskChannelVal_35
						  + animNormalDelta_00 * maskWeight_73 * maskChannelVal_06
						  + animNormalDelta_00 * maskWeight_11 * maskChannelVal_03
						  + animNormalDelta_00 * maskWeight_65 * maskChannelVal_11
						  + animNormalDelta_00 * maskWeight_75 * maskChannelVal_07
						  + animNormalDelta_00 * maskWeight_67 * maskChannelVal_12
						  + animNormalDelta_00 * maskWeight_09 * maskChannelVal_02
						  + animNormalDelta_00 * maskWeight_49 * maskChannelVal_34
						  + animNormalDelta_00 * maskWeight_71 * maskChannelVal_10
						  + animNormalDelta_00 * maskWeight_48 * maskChannelVal_33
						  + animNormalDelta_00 * maskWeight_23 * maskChannelVal_14
						  + animNormalDelta_00 * maskWeight_69 * maskChannelVal_09
						  + animNormalDelta_00 * maskWeight_18 * maskChannelVal_00
						  + animNormalDelta_00 * maskWeight_22 * maskChannelVal_01
						  + animNormalDelta_00 * maskWeight_77 * maskChannelVal_08
						  + animNormalDelta_00 * maskWeight_19 * maskChannelVal_13
						  + animNormalDelta_01 * maskWeight_07 * maskChannelVal_18
						  + animNormalDelta_01 * maskWeight_03 * maskChannelVal_16
						  + animNormalDelta_01 * maskWeight_81 * maskChannelVal_22
						  + animNormalDelta_01 * maskWeight_79 * maskChannelVal_21
						  + animNormalDelta_01 * maskWeight_01 * maskChannelVal_15
						  + animNormalDelta_01 * maskWeight_05 * maskChannelVal_17
						  + animNormalDelta_01 * maskWeight_63 * maskChannelVal_20
						  + animNormalDelta_01 * maskWeight_37 * maskChannelVal_23
						  + animNormalDelta_01 * maskWeight_61 * maskChannelVal_19
						  + animNormalDelta_01 * maskWeight_39 * maskChannelVal_24
						  + animNormalDelta_02 * maskWeight_59 * maskChannelVal_34
						  + animNormalDelta_02 * maskWeight_35 * maskChannelVal_30
						  + animNormalDelta_02 * maskWeight_54 * maskChannelVal_35
						  + animNormalDelta_02 * maskWeight_58 * maskChannelVal_36
						  + animNormalDelta_02 * maskWeight_29 * maskChannelVal_29
						  + animNormalDelta_02 * maskWeight_55 * maskChannelVal_33
						  + animNormalDelta_02 * maskWeight_28 * maskChannelVal_27
						  + animNormalDelta_02 * maskWeight_33 * maskChannelVal_26
						  + animNormalDelta_02 * maskWeight_27 * maskChannelVal_25
						  + animNormalDelta_02 * maskWeight_34 * maskChannelVal_28
						  + animNormalDelta_02 * maskWeight_41 * maskChannelVal_31
						  + animNormalDelta_02 * maskWeight_51 * maskChannelVal_32;

			diffuse.rgb += animColorDelta_00 * maskWeight_20 * maskChannelVal_01
						 + animColorDelta_00 * maskWeight_70 * maskChannelVal_10
						 + animColorDelta_00 * maskWeight_43 * maskChannelVal_36
						 + animColorDelta_00 * maskWeight_66 * maskChannelVal_12
						 + animColorDelta_00 * maskWeight_45 * maskChannelVal_34
						 + animColorDelta_00 * maskWeight_12 * maskChannelVal_04
						 + animColorDelta_00 * maskWeight_14 * maskChannelVal_05
						 + animColorDelta_00 * maskWeight_44 * maskChannelVal_33
						 + animColorDelta_00 * maskWeight_42 * maskChannelVal_35
						 + animColorDelta_00 * maskWeight_16 * maskChannelVal_00
						 + animColorDelta_00 * maskWeight_74 * maskChannelVal_07
						 + animColorDelta_00 * maskWeight_64 * maskChannelVal_11
						 + animColorDelta_00 * maskWeight_68 * maskChannelVal_09
						 + animColorDelta_00 * maskWeight_10 * maskChannelVal_03
						 + animColorDelta_00 * maskWeight_08 * maskChannelVal_02
						 + animColorDelta_00 * maskWeight_72 * maskChannelVal_06
						 + animColorDelta_00 * maskWeight_21 * maskChannelVal_14
						 + animColorDelta_00 * maskWeight_76 * maskChannelVal_08
						 + animColorDelta_00 * maskWeight_17 * maskChannelVal_13
						 + animColorDelta_01 * maskWeight_78 * maskChannelVal_21
						 + animColorDelta_01 * maskWeight_60 * maskChannelVal_19
						 + animColorDelta_01 * maskWeight_80 * maskChannelVal_22
						 + animColorDelta_01 * maskWeight_06 * maskChannelVal_18
						 + animColorDelta_01 * maskWeight_04 * maskChannelVal_17
						 + animColorDelta_01 * maskWeight_62 * maskChannelVal_20
						 + animColorDelta_01 * maskWeight_38 * maskChannelVal_24
						 + animColorDelta_01 * maskWeight_36 * maskChannelVal_23
						 + animColorDelta_01 * maskWeight_02 * maskChannelVal_16
						 + animColorDelta_01 * maskWeight_00 * maskChannelVal_15
						 + animColorDelta_02 * maskWeight_30 * maskChannelVal_26
						 + animColorDelta_02 * maskWeight_52 * maskChannelVal_35
						 + animColorDelta_02 * maskWeight_32 * maskChannelVal_30
						 + animColorDelta_02 * maskWeight_26 * maskChannelVal_29
						 + animColorDelta_02 * maskWeight_24 * maskChannelVal_25
						 + animColorDelta_02 * maskWeight_56 * maskChannelVal_36
						 + animColorDelta_02 * maskWeight_25 * maskChannelVal_27
						 + animColorDelta_02 * maskWeight_57 * maskChannelVal_34
						 + animColorDelta_02 * maskWeight_53 * maskChannelVal_33
						 + animColorDelta_02 * maskWeight_31 * maskChannelVal_28
						 + animColorDelta_02 * maskWeight_50 * maskChannelVal_32
						 + animColorDelta_02 * maskWeight_40 * maskChannelVal_31;

		}
		NormalMap = mul(NormalMap.xyz, toWorld);
		N = normalize(NormalMap);
	} else {
		if (UseMicroNormalTexture) {
			float3x3 toWorld = float3x3(T, Bn, N);

			float2 normalUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
			microNormal = MicroNormalTexture.Sample(SamplerAnisoWrap, normalUV * MicroScale).xyz * 2.0 - 1.0;

			microNormal.xy *= MicroNormalHeight;
			microNormal = mul(microNormal.xyz, toWorld);
		}
	}

	diffuse.rgb *= DiffuseColor;

	float3 blurredNormal = lerp(N, Nw, NormalBlurring);

	float3 V = normalize(viewInv[3].xyz - IN.worldPosition.xyz);

	float4 specular = float4(0.028, 0.028, 0.028, 1);
	specular.rgb *= SpecularColor;

	if (UseSpecularTexture) {
		float2 opacityUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float4 SpecularTextureSample = SpecularTexture.Sample(SamplerAnisoWrap, opacityUV);

		specular.rgb *= pow(SpecularTextureSample.rgb, gammaCorrection);

		if (UseSpecularTextureAlpha) {
			specular.a = SpecularTextureSample.a;
		}
	}

	float cavity = 1;
	if (UseCavityTexture) {
		float2 cavityUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float CavityTextureSample = CavityTexture.Sample(SamplerAnisoWrap, cavityUV);

		cavity = lerp(1, pow(CavityTextureSample, gammaCorrection), CavityAmount);
	}

	float microCavity = 1;
	if (UseMicroCavityTexture) {
		float2 cavityUV = pickTexcoord(SpecularTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float MicroCavityTextureSample = MicroCavityTexture.Sample(SamplerAnisoWrap, cavityUV * MicroScale);

		microCavity = lerp(1, pow(MicroCavityTextureSample, gammaCorrection), MicroCavityAmount);
	}

	specular.rgb *= cavity * microCavity; // We apply cavity on the specular before it is sent to the fresnel

	float roughness = Roughness;
	if (UseSpecularTextureAlpha) {
		roughness *= specular.a;
	}

	float scatteringRadius = 1;
	if (UseScatteringRadiusTexture) {
		float2 scatteringUV = pickTexcoord(DiffuseTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float4 scatteringRadiusTextureSample = ScatteringRadiusTexture.Sample(SamplerAnisoWrap, scatteringUV);

		scatteringRadius *= pow(scatteringRadiusTextureSample, gammaCorrection);
	}

	// Opacity:
	float opacity = saturate(diffuse.a * Opacity);

	// Occlusion:
	float3 ambientOcclusion = float3(1, 1, 1);
	if (UseAmbientOcclusionTexture) {
		float2 aomapUV = pickTexcoord(OcclusionTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		float3 aomapTextureSample = OcclusionTexture.Sample(SamplerAnisoWrap, aomapUV).rgb;
		ambientOcclusion *= lerp(1, pow(aomapTextureSample.rgb, gammaCorrection), OcclusionAmount);
	}

	float3 thickness = float3(1, 1, 1);
	if (UseThicknessTexture) {
		float2 thicknessUV = pickTexcoord(ThicknessTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
		thickness = pow(BackScatteringThicknessTexture.Sample(SamplerAnisoWrap, thicknessUV), gammaCorrection).xyz;
	}

	float3 skinOcclusion = coloredOcclusion(diffuse, ambientOcclusion); // Colored occlusion for skin

	float softenMask = 1.0f;

	float2 screenCoord = IN.screenCoord.xy / IN.screenCoord.w;
	//float2 currentScreenSize = screenSize; // TO DO FIND A WAY TO GET SCREEN SIZE, MAYA BUG ?
	float2 currentScreenSize = float2(1024, 512);

	// --------
	// LIGHTS:
	// --------
	// future todo: Maya could pass light info in array so we can loop any number of lights.

	// light 0:
	lightOut light0 = CalculateLight(light0Enable, light0Type, light0AttenScale, light0Pos, IN.worldPosition.xyz,
	light0Color, light0Intensity, light0Dir, light0ConeAngle, light0FallOff, light0Matrix,
	light0ShadowMap, light0ShadowOn, blurredNormal, N, diffuse, V, roughness, specular,
	thickness, softenMask, gammaCorrection, opacity, ambientOcclusion, skinOcclusion, screenCoord, currentScreenSize, scatteringRadius);

	// light 1:
	lightOut light1 = CalculateLight(light1Enable, light1Type, light1AttenScale, light1Pos, IN.worldPosition.xyz,
		light1Color, light1Intensity, light1Dir, light1ConeAngle, light1FallOff, light1Matrix,
		light1ShadowMap, light1ShadowOn, blurredNormal, N, diffuse, V, roughness, specular,
		thickness, softenMask, gammaCorrection, opacity, ambientOcclusion, skinOcclusion, screenCoord, currentScreenSize, scatteringRadius);

	// light 2:
	lightOut light2 = CalculateLight(light2Enable, light2Type, light2AttenScale, light2Pos, IN.worldPosition.xyz,
		light2Color, light2Intensity, light2Dir, light2ConeAngle, light2FallOff, light2Matrix,
		light2ShadowMap, light2ShadowOn, blurredNormal, N, diffuse, V, roughness, specular,
		thickness, softenMask, gammaCorrection, opacity, ambientOcclusion, skinOcclusion, screenCoord, currentScreenSize, scatteringRadius);

	float3 lightTotal = light0.Color + light1.Color + light2.Color;


	// ----------------------
	// IMAGE BASED LIGHTING
	// ----------------------

	// Specular IBL
	float3 specularIBL = float3(0, 0, 0);
	bool reflectMapUsed = UseSpecCubeIBL;
	if (reflectMapUsed) {
		int lod = 7; // Hard coded mip map level

		float3 reflectionVector = reflect(-V, N);

		reflectionVector = RotateVectorYaw(reflectionVector, SkyRotation);
		reflectionVector = normalize(reflectionVector);
		float NdotV = saturate(dot(N, V));
		float3 F = F_LagardeSchlick(specular, 1 - roughness, NdotV);

		specularIBL += SpecularCubeIBL.SampleLevel(CubeMapSampler, reflectionVector, lod * roughness).rgb * F;
	}

	// Diffuse IBL
	float3 diffuseIBL = float3(0, 0, 0);
	bool useDiffuseIBL = UseDiffuseIBLMap;
	if (useDiffuseIBL) {
		// We use the world normal to sample the lighting texture
		float3 diffuseIBLVec_High = N;
		float3 diffuseIBLVec_Low = blurredNormal;

		diffuseIBLVec_High = RotateVectorYaw(diffuseIBLVec_High, SkyRotation);
		diffuseIBLVec_High = normalize(diffuseIBLVec_High);

		diffuseIBLVec_Low = RotateVectorYaw(diffuseIBLVec_Low, SkyRotation);
		diffuseIBLVec_Low = normalize(diffuseIBLVec_Low);

		float3 diffuseIBL_High = DiffuseCubeIBL.SampleLevel(CubeMapSampler, diffuseIBLVec_High, 0).rgb;
		float3 diffuseIBL_Low = DiffuseCubeIBL.SampleLevel(CubeMapSampler, diffuseIBLVec_Low, 0).rgb;

		diffuseIBL = diffuseSkinIBL(float3(skinCoeffX, skinCoeffY, skinCoeffZ), diffuseIBL_High, diffuseIBL_Low);
	}

	// ----------------------
	// FINAL COLOR AND ALPHA:
	// ----------------------

	float3 result = float3(0, 0, 0);

	result += diffuse * diffuseIBL * DiffuseIBLIntensity * skinOcclusion;

	result += specularIBL * SpecularIBLIntensity * specularOcclusion(N, V, ambientOcclusion);

	result += lightTotal;

	//result = N;

	// do gamma correction in shader:
	if (!MayaFullScreenGamma)
		result = pow(result, 1 / gammaCorrection);

	// final alpha:
	float transparency = opacity;
	transparency = saturate(transparency);	// keep 0-1 range

	return float4(result, transparency);
}


#ifdef _MAYA_
void Peel(SHADERDATA IN) {
	float currZ = abs(mul(float4(IN.worldPosition, 1.0f), view).z);

	float4 Pndc = mul(float4(IN.worldPosition, 1.0f), viewPrj);
	float2 UV = Pndc.xy / Pndc.w * float2(0.5f, -0.5f) + 0.5f;
	float prevZ = transpDepthTexture.Sample(SamplerShadowDepth, UV).r;
	float opaqZ = opaqueDepthTexture.Sample(SamplerShadowDepth, UV).r;
	float bias = 0.00002f;

	if (currZ < prevZ * (1.0f + bias) || currZ > opaqZ * (1.0f - bias)) {
		discard;
	}
}

float4 LinearDepth(SHADERDATA IN) {
	return abs(mul(float4(IN.worldPosition, 1.0f), view).z);
}

float4 DepthComplexity(float opacity) {
	return opacity > 0.001f ? 1.0f : 0.0f;
}

struct MultiOut2 {
	float4 target0 : SV_Target0;
	float4 target1 : SV_Target1;
};

MultiOut2 fTransparentPeel(SHADERDATA IN, bool FrontFace : SV_IsFrontFace) {
	Peel(IN);

	MultiOut2 OUT;
	OUT.target0 = f(IN, FrontFace);
	OUT.target1 = LinearDepth(IN);
	return OUT;
}

MultiOut2 fTransparentPeelAndAvg(SHADERDATA IN, bool FrontFace : SV_IsFrontFace) {
	Peel(IN);

	MultiOut2 OUT;
	OUT.target0 = f(IN, FrontFace);
	OUT.target1 = DepthComplexity(OUT.target0.w);
	return OUT;
}

MultiOut2 fTransparentWeightedAvg(SHADERDATA IN, bool FrontFace : SV_IsFrontFace) {
	MultiOut2 OUT;
	OUT.target0 = f(IN, FrontFace);
	OUT.target1 = DepthComplexity(OUT.target0.w);
	return OUT;
}

//------------------------------------
// wireframe pixel shader
//------------------------------------
float4 fwire(SHADERDATA IN) : SV_Target {
	return float4(0, 0, 1, 1);
}


//------------------------------------
// pixel shader for shadow map generation
//------------------------------------
//float4 ShadowMapPS( float3 Pw, float4x4 shadowViewProj )
float4 ShadowMapPS(SHADERDATA IN) : SV_Target {
	// clip as early as possible
	float2 opacityMaskUV = pickTexcoord(OpacityMaskTexcoord, IN.texCoord0, IN.texCoord1, IN.texCoord2);
	OpacityMaskClip(opacityMaskUV);

	float4 Pndc = mul(float4(IN.worldPosition, 1.0f), viewPrj);

	// divide Z and W component from clip space vertex position to get final depth per pixel
	float retZ = Pndc.z / Pndc.w;

	retZ += fwidth(retZ);
	return retZ.xxxx;
}
#endif

//-----------------------------------
// Objects without tessellation
//------------------------------------
technique11 TessellationOFF <
	bool overridesDrawState = false;	// we do not supply our own render state settings
	int isTransparent = 3;
	// objects with clipped pixels need to be flagged as isTransparent to avoid the occluding underlying geometry since Maya renders the object with flat shading when computing depth
	string transparencyTest = "Opacity < 1.0 || (UseDiffuseTexture && UseDiffuseTextureAlpha) || UseOpacityMaskTexture";
	// 'VariableNameAsAttributeName = false' can be used to tell Maya's DX11ShaderNode to use the UIName annotation string for the Maya attribute name instead of the shader variable name.
	// When changing this option, the attribute names generated for the shader inside Maya will change and this can have the side effect that older scenes have their shader attributes reset to default.
	// bool VariableNameAsAttributeName = false;

#ifdef _MAYA_
	// Tells Maya that the effect supports advanced transparency algorithm,
	// otherwise Maya would render the associated objects simply by alpha
	// blending on top of other objects supporting advanced transparency
	// when the viewport transparency algorithm is set to depth-peeling or
	// weighted-average.
	bool supportsAdvancedTransparency = true;
#endif
>
{
	pass p0 < string drawContext = "colorPass";	> { // tell maya during what draw context this shader should be active, in this case 'Color'
		// even though overrideDrawState is false, we still set the pre-multiplied alpha state here in
		// case Maya is using 'Depth Peeling' transparency algorithm
		// This unfortunately won't solve sorting issues, but at least our object can draw transparent.
		// If we don't set this, the object will always be opaque.
		// In the future, hopefully ShaderOverride nodes can participate properly in Maya's Depth Peeling setup
#ifdef _MAYA_
		SetBlendState(PMAlphaBlending, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
#endif
		SetVertexShader(CompileShader(vs_5_0, v()));
		SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, f()));
	}

#ifdef _MAYA_
	pass pTransparentPeel < string drawContext = "transparentPeel"; > { // Depth-peeling pass for depth-peeling transparency algorithm.
		SetVertexShader(CompileShader(vs_5_0, v()));
		SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, fTransparentPeel()));
	}

	pass pTransparentPeelAndAvg < string drawContext = "transparentPeelAndAvg"; > { // Weighted-average pass for depth-peeling transparency algorithm.
		SetVertexShader(CompileShader(vs_5_0, v()));
		SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, fTransparentPeelAndAvg()));
	}

	pass pTransparentWeightedAvg < string drawContext = "transparentWeightedAvg"; > { // Weighted-average algorithm. No peeling.
		SetVertexShader(CompileShader(vs_5_0, v()));
		SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, fTransparentWeightedAvg()));
	}

	pass pShadow < string drawContext = "shadowPass"; > {
		SetVertexShader(CompileShader(vs_5_0, v()));
		SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, ShadowMapPS()));
	}
#endif
}

#ifdef _SUPPORTTESSELLATION_
//-----------------------------------
// Objects with tessellation
//------------------------------------
// Vertex Index Buffer options:
// index_buffer_type: None;			// no divergent normals and no displacement crack fix
// index_buffer_type: PNAEN9;		// divergent normals crack fix; no displacement UV seam crack fix
// index_buffer_type: PNAEN18,		// crack fix for divergent normals and UV seam displacement
technique11 TessellationON <
	string index_buffer_type = "PNAEN18";	// tell Maya what type of index buffer we want. Must be unique name per generator
	bool overridesDrawState = false;
	int isTransparent = 3;
	string transparencyTest = "Opacity < 1.0 || (UseDiffuseTexture && UseDiffuseTextureAlpha) || UseOpacityMaskTexture";
	bool supportsAdvancedTransparency = true; > {
		pass p0 < string drawContext = "colorPass"; > {
			SetBlendState(PMAlphaBlending, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
			SetVertexShader(CompileShader(vs_5_0, vt()));
			SetHullShader(CompileShader(hs_5_0, HS()));
			SetDomainShader(CompileShader(ds_5_0, DS()));
			SetGeometryShader(NULL);								// without geo
			//SetGeometryShader( CompileShader(gs_5_0, GS()) );		// with geo
			SetPixelShader(CompileShader(ps_5_0, f()));
		}

		pass pTransparentPeel < string drawContext = "transparentPeel";> { // Depth-peeling pass for depth-peeling transparency algorithm.
			SetVertexShader(CompileShader(vs_5_0, vt()));
			SetHullShader(CompileShader(hs_5_0, HS()));
			SetDomainShader(CompileShader(ds_5_0, DS()));
			SetGeometryShader(NULL);
			SetPixelShader(CompileShader(ps_5_0, fTransparentPeel()));
		}

		pass pTransparentPeelAndAvg < string drawContext = "transparentPeelAndAvg"; > { // Weighted-average pass for depth-peeling transparency algorithm.
			SetVertexShader(CompileShader(vs_5_0, vt()));
			SetHullShader(CompileShader(hs_5_0, HS()));
			SetDomainShader(CompileShader(ds_5_0, DS()));
			SetGeometryShader(NULL);
			SetPixelShader(CompileShader(ps_5_0, fTransparentPeelAndAvg()));
		}

		pass pTransparentWeightedAvg < string drawContext = "transparentWeightedAvg"; > { // Weighted-average algorithm. No peeling.
			SetVertexShader(CompileShader(vs_5_0, vt()));
			SetHullShader(CompileShader(hs_5_0, HS()));
			SetDomainShader(CompileShader(ds_5_0, DS()));
			SetGeometryShader(NULL);
			SetPixelShader(CompileShader(ps_5_0, fTransparentWeightedAvg()));
		}

		pass pShadow < string drawContext = "shadowPass"; > {
			SetVertexShader(CompileShader(vs_5_0, vt()));
			SetHullShader(CompileShader(hs_5_0, HS()));
			SetDomainShader(CompileShader(ds_5_0, DS()));
			SetGeometryShader(NULL);
			SetPixelShader(CompileShader(ps_5_0, ShadowMapPS()));
		}
}

//-----------------------------------
// Wireframe
//------------------------------------
technique11 WireFrame <
	string index_buffer_type = "PNAEN18";
	bool overridesDrawState = false;		// since we only change the fillMode, it can remain on false. If we changed the blend state, it would have to be true
	int isTransparent = 0; > {
	pass p0 < string drawContext = "colorPass"; > {
		SetRasterizerState(WireframeCullFront);
		SetVertexShader(CompileShader(vs_5_0, vt()));
		SetHullShader(CompileShader(hs_5_0, HS()));
		SetDomainShader(CompileShader(ds_5_0, DS()));
		SetGeometryShader(NULL);								// without geo
		//SetGeometryShader( CompileShader(gs_5_0, GS()) );		// with geo
		SetPixelShader(CompileShader(ps_5_0, fwire()));
	}
}
#endif
