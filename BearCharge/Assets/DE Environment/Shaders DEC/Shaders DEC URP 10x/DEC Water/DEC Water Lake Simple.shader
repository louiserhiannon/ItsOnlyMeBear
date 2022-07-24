// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Water/Water Lake Simple"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(SURFACE OPTIONS)][Enum(Front,2,Back,1,Both,0)]_RenderFace("Render Face", Int) = 2
		[EmissionFlags]_EmissionFlags("Global Illumination Emissive", Float) = 0
		[Toggle(_RECEIVE_SHADOWS_OFF)] _RECEIVE_SHADOWS_OFF("Receive Shadows", Float) = 0
		[Toggle(_SPECULARHIGHLIGHTS_OFF)] _SPECULARHIGHLIGHTS_OFF("Receive Specular Highlights", Float) = 0
		[Toggle(_ENVIRONMENTREFLECTIONS_OFF)] _ENVIRONMENTREFLECTIONS_OFF("Receive Environment Reflections", Float) = 1
		[HDR][Header (COLOR TINT WATER LAYERS)]_ShorelineTint("Shoreline Tint", Color) = (0.2784314,0.4235294,0.4431373,1)
		_ShorelineDepth("Shoreline Depth", Range( 0 , 100)) = 40
		_ShorelineOffset("Shoreline Offset", Range( -1 , 1)) = 0.1
		[HDR]_MidwaterTint("Midwater Tint", Color) = (0.1490196,0.4235294,0.4705882,1)
		[HDR]_DepthTint("Depth Tint", Color) = (0.1960784,0.4313726,0.509804,1)
		_DepthOffset("Depth Offset", Range( 0 , 10)) = 2
		[Header (OPACITY)]_Opacity("Opacity", Range( 0.001 , 1)) = 0.05
		_OpacityShoreline("Opacity Shoreline", Range( 0 , 25)) = 2
		[Header (REFRACTION)]_RefractionScale("Refraction Scale", Range( 0 , 1)) = 0.2
		[Header(SMOOTHNESS)]_SMOOTHNESS_Strength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SMOOTHNESS_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 0
		_SMOOTHNESS_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 1
		_SMOOTHNESS_FresnelPower("Fresnel Power", Range( 0 , 10)) = 5
		[HDR]_SpecularColor("Specular Tint", Color) = (0.06666667,0.06666667,0.05882353,0)
		_Shininess("Specular Strength", Range( 0 , 1)) = 0
		[Header(SPECULAR)][DE_DrawerFloatEnum(Off _Active _Active Clamped)]_SpecularMode("Specular Mode", Float) = 2
		_SpecularWrap("Specular Wrap", Range( 0 , 3)) = 0.5
		[HDR][Header(SPECULAR ADDITTIONAL LIGHTS)]_URP_SpecularColor("Specular Tint", Color) = (1,1,1,1)
		_URP_SpecularStrength("Specular Strength", Range( 0 , 1)) = 0.5
		[Header(........................................)][Header(NORMAL MAP (HORIZONTAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_WaterNormal_Horizontal_FlowType("Mode Flow Type", Int) = 1
		[Normal][DE_DrawerTextureSingleLine]_WaterNormal_Horizontal_Vertical_NormalMap("Normal Map", 2D) = "bump" {}
		_WaterNormal_Horizontal_NormalStrength("Normal Strength", Float) = 1
		_WaterNormal_Horizontal_TilingX("Tiling X", Float) = 10
		_WaterNormal_Horizontal_TilingY("Tiling Y", Float) = 10
		_WaterNormal_Horizontal_Speed("Speed", Float) = 0.5
		_WaterNormal_Horizontal_FlowStrength("Flow Strength", Float) = 0.5
		_WaterNormal_Horizontal_Timescale("Flow Timescale", Range( 0 , 1)) = 0.6
		[Header(FOAM OFFSHORE (HORIZONTAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_FOAMHORIZONTAL_ModeFlowType("Mode Flow Type", Int) = 0
		[HDR]_FOAMHORIZONTAL_Tint("Tint", Color) = (1,1,1,0)
		_FOAMHORIZONTAL_TintStrength("Tint Strength", Range( 0 , 5)) = 2.297033
		[DE_DrawerTextureSingleLine]_FOAMHORIZONTAL_FoamMap("Foam Map", 2D) = "white" {}
		_FOAMHORIZONTAL_Distance("Foam Distance", Range( 0.3 , 100)) = 0.3
		_FOAMHORIZONTAL_NormalStrength("Normal Strength ", Range( 0 , 5)) = 5
		_FOAMHORIZONTAL_TilingX("Tiling X", Float) = 10
		_FOAMHORIZONTAL_TilingY("Tiling Y", Float) = 10
		_FOAMHORIZONTAL_Speed("Speed", Float) = 0.2
		_FOAMHORIZONTAL_FlowStrength("Flow Strength", Float) = 3
		_FOAMHORIZONTAL_Timescale("Flow Timescale", Range( 0 , 1)) = 0.2
		[Header(........................................)][Header(NORMAL MAP (VERTICAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_WaterNormal_Vertical_FlowType("Mode Flow Type", Int) = 1
		[Normal][DE_DrawerTextureSingleLine]_WaterNormal_Vertical_NormalMap("Normal Map", 2D) = "bump" {}
		_WaterNormal_Vertical_NormalStrength("Normal Strength", Float) = 1
		_WaterNormal_Vertical_TilingX("Tiling X", Float) = 10
		_WaterNormal_Vertical_TilingY("Tiling Y", Float) = 10
		_WaterNormal_Vertical_Speed("Speed", Float) = 0.5
		_WaterNormal_Vertical_FlowStrength("Flow Strength", Float) = 0.5
		_WaterNormal_Vertical_Timescale("Flow Timescale", Range( 0 , 1)) = 0.6
		[Header(FOAM OFFSHORE (VERTICAL))][Enum(Off,0,Swirling,1,Flow Map,2)]_FOAMVERTICAL_ModeFlowType("Mode Flow Type", Int) = 0
		[HDR]_FOAMVERTICAL_Tint("Tint", Color) = (1,1,1,0)
		_FOAMVERTICAL_TintStrength("Tint Strength", Range( 0 , 5)) = 1
		[DE_DrawerTextureSingleLine]_FOAMVERTICAL_FoamMap("Foam Map", 2D) = "white" {}
		_FOAMVERTICAL_Distance("Foam Distance", Range( 0.3 , 100)) = 0.3
		_FOAMVERTICAL_NormalStrength("Normal Strength ", Range( 0 , 5)) = 5
		_FOAMVERTICAL_TilingX("Tiling X", Float) = 10
		_FOAMVERTICAL_TilingY("Tiling Y", Float) = 10
		_FOAMVERTICAL_Speed("Speed", Float) = 0.2
		_FOAMVERTICAL_FlowStrength("Flow Strength", Float) = 3
		_FOAMVERTICAL_Timescale("Flow Timescale", Range( 0 , 1)) = 0.2
		[Header(........................................)][Header(FOAM SHORELINE)][Enum(Off,0,Swirling,1,Flow Map,2)]_FoamShoreline_ModeFlowType("Mode Flow Type", Int) = 1
		[HDR]_FoamShoreline_Tint("Tint", Color) = (1,1,1,0)
		_FoamShoreline_TintStrength("Tint Strength", Range( 0 , 5)) = 0.5
		[DE_DrawerTextureSingleLine]_FoamShoreline_FoamMap("Foam Map", 2D) = "white" {}
		_FoamShoreline_Distance("Foam Distance", Range( 0.5 , 100)) = 0.5
		_FoamShoreline_NormalStrength("Normal Strength ", Range( 0 , 5)) = 1
		_TilingX_Shoreline("Tiling X", Float) = 25
		_TilingY_Shoreline("Tiling Y", Float) = 25
		_FoamShoreline_Speed("Speed", Float) = 0.1
		_FoamShoreline_FlowStrength("Flow Strength", Float) = 0.5
		_FoamShoreline_Timescale("Flow Timescale", Range( 0 , 1)) = 0.1
		[Header(........................................)][Header(REFLECTION)][Enum(Off,0,Active CubeMap,1,Active Probe,2)]_Reflection_ModeURP("Reflection Mode", Int) = 0
		[HDR][DE_DrawerTextureSingleLine]_Reflection_Cubemap("Reflection Cubemap", CUBE) = "white" {}
		_Reflection_Cloud("Reflection Cloud", Range( 0 , 1)) = 1
		_Reflection_Wobble("Reflection Wobble", Range( 0 , 0.1)) = 0
		_Reflection_Smoothness("Reflection Smoothness", Range( 0 , 2)) = 2
		_Reflection_LOD("Reflection Probe Level of Detail", Float) = 0
		_Reflection_BumpScale("Reflection Bump Scale", Range( 0 , 1)) = 0.5
		_Reflection_BumpClamp("Reflection Bump Clamp", Range( 0 , 0.15)) = 0.15
		[DE_DrawerToggleNoKeyword]_Reflection_FresnelMode("Enable Fresnel", Float) = 0
		_Reflection_FresnelStrength("Fresnel Strength", Range( 0.001 , 1)) = 0.5
		_Reflection_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 1
		[ASEEnd]_Reflection_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 0.5

		[HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		
		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Transparent" }
		Cull [_RenderFace]
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask [_AlphatoCoverage]
		
		HLSLINCLUDE
		#pragma target 4.0

		#pragma prefer_hlslcc gles
		

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS

		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend One Zero, One Zero
			ColorMask [_ColorMask]
			

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON

			#pragma multi_compile _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			
			#pragma multi_compile _ _LIGHT_COOKIES
			#pragma multi_compile _ _CLUSTERED_RENDERING

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat_aniso2);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g43888( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g43875( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43869( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43897( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43882( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g43869( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1230_g43897( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1223_g43882( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsSpecularMask( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				#endif
				return Color;
			}
			
			float3 float3switch31_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch11_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch18_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord8.w = eyeDepth;
				
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord10 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
				o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int m_switch119_g43873 = _Reflection_ModeURP;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g43868 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g43868 = abs( ( screenDepth2_g43868 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g43868 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g43868*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g43868 = lerp( _DepthTint , lerpResult25_g43868 , saturate( (distanceDepth2_g43868*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g43868 = lerpResult27_g43868;
				int m_switch238_g43888 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g43888 = float3(0,0,0.001);
				float mulTime155_g43888 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g43888 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g43888 = ( FlowSpeed365_g43888 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g43888).xx;
				float2 appendResult235_g43888 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g43888 = IN.ase_texcoord8.xyz.xy * ( appendResult235_g43888 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g43888 = cos( _G_FlowSwirling.x );
				float sin62_g43888 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos62_g43888 , -sin62_g43888 , sin62_g43888 , cos62_g43888 )) + float2( 0,0 );
				float2 panner15_g43888 = ( mulTime155_g43888 * temp_cast_0 + rotator62_g43888);
				float2 temp_cast_1 = (temp_output_367_0_g43888).xx;
				float cos8_g43888 = cos( _G_FlowSwirling.y );
				float sin8_g43888 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos8_g43888 , -sin8_g43888 , sin8_g43888 , cos8_g43888 )) + float2( 0,0 );
				float2 panner16_g43888 = ( mulTime155_g43888 * temp_cast_1 + rotator8_g43888);
				float2 temp_cast_2 = (temp_output_367_0_g43888).xx;
				float2 panner17_g43888 = ( mulTime155_g43888 * temp_cast_2 + texCoord23_g43888);
				float2 layeredBlendVar666_g43888 = IN.ase_texcoord8.xyz.xy;
				float4 layeredBlend666_g43888 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43888 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43888 ) , layeredBlendVar666_g43888.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43888 ) , layeredBlendVar666_g43888.y ) );
				float4 temp_output_1_0_g43892 = layeredBlend666_g43888;
				float temp_output_8_0_g43892 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g43892 = UnpackNormalScale( temp_output_1_0_g43892, temp_output_8_0_g43892 );
				unpack52_g43892.z = lerp( 1, unpack52_g43892.z, saturate(temp_output_8_0_g43892) );
				float3 temp_output_699_59_g43888 = unpack52_g43892;
				float3 temp_output_372_0_g43888 = abs( WorldNormal );
				float3 break386_g43888 = ( temp_output_372_0_g43888 * temp_output_372_0_g43888 );
				float _MASK_VERTICAL_Z381_g43888 = ( break386_g43888.z + 0.01 );
				float3 lerpResult677_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float _MASK_VERTICAL_X373_g43888 = ( -break386_g43888.x + 0.2 );
				float3 lerpResult681_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float _MASK_VERTICAL_Y_NEG413_g43888 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult677_g43888 + lerpResult681_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_Swirling238_g43888 = lerpResult679_g43888;
				float2 texCoord196_g43890 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43890 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43890 = texCoord196_g43890;
				float2 blendOpDest197_g43890 = (_FLOWMAP_Map89_g43890).xy;
				float2 temp_output_197_0_g43890 = ( saturate( (( blendOpDest197_g43890 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43890 ) * ( 1.0 - blendOpSrc197_g43890 ) ) : ( 2.0 * blendOpDest197_g43890 * blendOpSrc197_g43890 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43890 = FlowSpeed365_g43888;
				float temp_output_182_0_g43890 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43890 );
				float temp_output_194_0_g43890 = (0.0 + (( ( temp_output_182_0_g43890 - floor( ( temp_output_182_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43890 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g43890 = ( -temp_output_194_0_g43890 * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult198_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_A199_g43890);
				float2 INPUT_MAP_TILLING128_g43888 = appendResult235_g43888;
				float2 texCoord205_g43890 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43888 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43890 = texCoord205_g43890;
				float2 FLOW_A201_g43890 = ( lerpResult198_g43890 + TEXTURE_TILLING211_g43890 );
				float temp_output_225_0_g43890 = (temp_output_182_0_g43890*1.0 + 0.5);
				float _TIME_UV_B214_g43890 = ( -(0.0 + (( ( temp_output_225_0_g43890 - floor( ( temp_output_225_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult229_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_B214_g43890);
				float2 FLOW_B232_g43890 = ( lerpResult229_g43890 + TEXTURE_TILLING211_g43890 );
				float TIME_BLEND235_g43890 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43890 / 0.5 ) ) ) );
				float4 lerpResult317_g43888 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43890 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43890 ) , TIME_BLEND235_g43890);
				float4 temp_output_1_0_g43889 = lerpResult317_g43888;
				float NormalStrength152_g43888 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g43889 = NormalStrength152_g43888;
				float3 unpack52_g43889 = UnpackNormalScale( temp_output_1_0_g43889, temp_output_8_0_g43889 );
				unpack52_g43889.z = lerp( 1, unpack52_g43889.z, saturate(temp_output_8_0_g43889) );
				float3 temp_output_701_59_g43888 = unpack52_g43889;
				float3 lerpResult692_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float3 lerpResult691_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float3 lerpResult697_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult692_g43888 + lerpResult691_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_FlowMap238_g43888 = lerpResult697_g43888;
				float3 localfloat3switch238_g43888 = float3switch238_g43888( m_switch238_g43888 , m_Off238_g43888 , m_Swirling238_g43888 , m_FlowMap238_g43888 );
				int m_switch456_g43875 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g43875 = float3(0,0,0.001);
				float mulTime155_g43875 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g43875 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g43875 = ( FlowSpeed365_g43875 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g43875).xx;
				float2 appendResult235_g43875 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g43875 = IN.ase_texcoord8.xyz.xy * ( appendResult235_g43875 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g43875 = cos( _G_FlowSwirling.x );
				float sin62_g43875 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos62_g43875 , -sin62_g43875 , sin62_g43875 , cos62_g43875 )) + float2( 0,0 );
				float2 panner15_g43875 = ( mulTime155_g43875 * temp_cast_5 + rotator62_g43875);
				float2 temp_cast_6 = (temp_output_367_0_g43875).xx;
				float cos8_g43875 = cos( _G_FlowSwirling.y );
				float sin8_g43875 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos8_g43875 , -sin8_g43875 , sin8_g43875 , cos8_g43875 )) + float2( 0,0 );
				float2 panner16_g43875 = ( mulTime155_g43875 * temp_cast_6 + rotator8_g43875);
				float2 temp_cast_7 = (temp_output_367_0_g43875).xx;
				float2 panner17_g43875 = ( mulTime155_g43875 * temp_cast_7 + texCoord23_g43875);
				float2 layeredBlendVar448_g43875 = IN.ase_texcoord8.xyz.xy;
				float4 layeredBlend448_g43875 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43875 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43875 ) , layeredBlendVar448_g43875.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43875 ) , layeredBlendVar448_g43875.y ) );
				float4 temp_output_1_0_g43879 = layeredBlend448_g43875;
				float temp_output_8_0_g43879 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g43879 = UnpackNormalScale( temp_output_1_0_g43879, temp_output_8_0_g43879 );
				unpack52_g43879.z = lerp( 1, unpack52_g43879.z, saturate(temp_output_8_0_g43879) );
				float3 temp_output_481_59_g43875 = unpack52_g43879;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g43875 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g43875 = ( break386_g43875.z + 0.75 );
				float3 lerpResult465_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float _MASK_VERTICAL_X373_g43875 = ( break386_g43875.x + 0.45 );
				float3 lerpResult457_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float _MASK_VERTICAL_Y383_g43875 = ( -break386_g43875.y + 5.0 );
				float3 lerpResult454_g43875 = lerp( lerpResult465_g43875 , ( lerpResult465_g43875 + lerpResult457_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float _MASK_VERTICAL_Y_NEG413_g43875 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g43875 = lerp( float3( 0,0,0 ) , lerpResult454_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_Swirling456_g43875 = lerpResult477_g43875;
				float2 texCoord196_g43876 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43876 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43876 = texCoord196_g43876;
				float2 blendOpDest197_g43876 = (_FLOWMAP_Map89_g43876).xy;
				float2 temp_output_197_0_g43876 = ( saturate( (( blendOpDest197_g43876 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43876 ) * ( 1.0 - blendOpSrc197_g43876 ) ) : ( 2.0 * blendOpDest197_g43876 * blendOpSrc197_g43876 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43876 = FlowSpeed365_g43875;
				float temp_output_182_0_g43876 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43876 );
				float temp_output_194_0_g43876 = (0.0 + (( ( temp_output_182_0_g43876 - floor( ( temp_output_182_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43876 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g43876 = ( -temp_output_194_0_g43876 * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult198_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_A199_g43876);
				float2 INPUT_MAP_TILLING128_g43875 = appendResult235_g43875;
				float2 texCoord205_g43876 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43875 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43876 = texCoord205_g43876;
				float2 FLOW_A201_g43876 = ( lerpResult198_g43876 + TEXTURE_TILLING211_g43876 );
				float temp_output_225_0_g43876 = (temp_output_182_0_g43876*1.0 + 0.5);
				float _TIME_UV_B214_g43876 = ( -(0.0 + (( ( temp_output_225_0_g43876 - floor( ( temp_output_225_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult229_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_B214_g43876);
				float2 FLOW_B232_g43876 = ( lerpResult229_g43876 + TEXTURE_TILLING211_g43876 );
				float TIME_BLEND235_g43876 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43876 / 0.5 ) ) ) );
				float4 lerpResult317_g43875 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43876 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43876 ) , TIME_BLEND235_g43876);
				float4 temp_output_1_0_g43878 = lerpResult317_g43875;
				float NormalStrength152_g43875 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g43878 = NormalStrength152_g43875;
				float3 unpack52_g43878 = UnpackNormalScale( temp_output_1_0_g43878, temp_output_8_0_g43878 );
				unpack52_g43878.z = lerp( 1, unpack52_g43878.z, saturate(temp_output_8_0_g43878) );
				float3 temp_output_483_59_g43875 = unpack52_g43878;
				float3 lerpResult466_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float3 lerpResult453_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float3 lerpResult460_g43875 = lerp( lerpResult466_g43875 , ( lerpResult466_g43875 + lerpResult453_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float3 lerpResult411_g43875 = lerp( float3( 0,0,0 ) , lerpResult460_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_FlowMap456_g43875 = lerpResult411_g43875;
				float3 localfloat3switch456_g43875 = float3switch456_g43875( m_switch456_g43875 , m_Off456_g43875 , m_Swirling456_g43875 , m_FlowMap456_g43875 );
				float2 weightedBlendVar1711_g43868 = IN.ase_texcoord8.xyz.xy;
				float3 weightedBlend1711_g43868 = ( weightedBlendVar1711_g43868.x*localfloat3switch238_g43888 + weightedBlendVar1711_g43868.y*localfloat3switch456_g43875 );
				float3 NORMAL_IN84_g43894 = ( weightedBlend1711_g43868 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g43894 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord8.w;
				float eyeDepth7_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g43894 = ( (NORMAL_IN84_g43894).xy * ( REFACTED_SCALE_FLOAT78_g43894 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g43894 - eyeDepth ) ) );
				float eyeDepth27_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g43894, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g43894 = (( float4( ( temp_output_21_0_g43894 * saturate( ( eyeDepth27_g43894 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g43894 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g43894 ), 1.0 );
				float4 REFRACTED_DEPTH144_g43868 = fetchOpaqueVal89_g43894;
				float temp_output_20_0_g43868 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g43868 = 0.0;
				#else
				float staticSwitch37_g43868 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g43868*-5.0 + 1.0) ) ) ) * temp_output_20_0_g43868 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g43868 = staticSwitch37_g43868;
				float4 lerpResult105_g43868 = lerp( COLOR_TINT161_g43868 , REFRACTED_DEPTH144_g43868 , DEPTH_TINT_ALPHA93_g43868);
				float4 _MaskVector1 = float4(0.001,0.001,0.001,0);
				int m_switch278_g43869 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g43869 = float4( 0,0,0,0 );
				float mulTime806_g43869 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g43869 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g43869 = ( FlowSpeed1146_g43869 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g43869).xx;
				float2 appendResult219_g43869 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g43869 = ( appendResult219_g43869 * float2( 2,2 ) );
				float2 texCoord487_g43869 = IN.ase_texcoord8.xyz.xy * temp_output_1294_0_g43869 + float2( 0,0 );
				float cos485_g43869 = cos( _G_FlowSwirling.x );
				float sin485_g43869 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos485_g43869 , -sin485_g43869 , sin485_g43869 , cos485_g43869 )) + float2( 0,0 );
				float2 panner483_g43869 = ( mulTime806_g43869 * temp_cast_14 + rotator485_g43869);
				float2 temp_cast_15 = (temp_output_1150_0_g43869).xx;
				float cos481_g43869 = cos( _G_FlowSwirling.y );
				float sin481_g43869 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos481_g43869 , -sin481_g43869 , sin481_g43869 , cos481_g43869 )) + float2( 0,0 );
				float2 panner480_g43869 = ( mulTime806_g43869 * temp_cast_15 + rotator481_g43869);
				float2 temp_cast_16 = (temp_output_1150_0_g43869).xx;
				float2 panner478_g43869 = ( mulTime806_g43869 * temp_cast_16 + texCoord487_g43869);
				float4 OUT_SWIRLING298_g43869 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43869 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43869 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43869 ) ) );
				float4 m_Swirling278_g43869 = OUT_SWIRLING298_g43869;
				float2 texCoord196_g43872 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43872 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43872 = texCoord196_g43872;
				float2 blendOpDest197_g43872 = (_FLOWMAP_Map89_g43872).xy;
				float2 temp_output_197_0_g43872 = ( saturate( (( blendOpDest197_g43872 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43872 ) * ( 1.0 - blendOpSrc197_g43872 ) ) : ( 2.0 * blendOpDest197_g43872 * blendOpSrc197_g43872 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43872 = FlowSpeed1146_g43869;
				float temp_output_182_0_g43872 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43872 );
				float temp_output_194_0_g43872 = (0.0 + (( ( temp_output_182_0_g43872 - floor( ( temp_output_182_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43869 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43872 = FlowStrength1147_g43869;
				float _TIME_UV_A199_g43872 = ( -temp_output_194_0_g43872 * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult198_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_A199_g43872);
				float2 INPUT_MAP_TILLING128_g43869 = temp_output_1294_0_g43869;
				float2 texCoord205_g43872 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43869 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43872 = texCoord205_g43872;
				float2 FLOW_A201_g43872 = ( lerpResult198_g43872 + TEXTURE_TILLING211_g43872 );
				float temp_output_225_0_g43872 = (temp_output_182_0_g43872*1.0 + 0.5);
				float _TIME_UV_B214_g43872 = ( -(0.0 + (( ( temp_output_225_0_g43872 - floor( ( temp_output_225_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult229_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_B214_g43872);
				float2 FLOW_B232_g43872 = ( lerpResult229_g43872 + TEXTURE_TILLING211_g43872 );
				float TIME_BLEND235_g43872 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43872 / 0.5 ) ) ) );
				float4 lerpResult1117_g43869 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43872 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43872 ) , TIME_BLEND235_g43872);
				float4 OUT_FLOW_FLOWMAP1119_g43869 = lerpResult1117_g43869;
				float4 m_FlowMap278_g43869 = OUT_FLOW_FLOWMAP1119_g43869;
				float4 localfloat4switch278_g43869 = float4switch278_g43869( m_switch278_g43869 , m_Off278_g43869 , m_Swirling278_g43869 , m_FlowMap278_g43869 );
				float clampDepth2_g43881 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g43881 = clampDepth2_g43881;
				float4 localCalculateObliqueFrustumCorrection3_g43896 = CalculateObliqueFrustumCorrection();
				float dotResult4_g43896 = dot( float4( IN.ase_texcoord10.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g43896 );
				float correctionFactor1_g43881 = dotResult4_g43896;
				float localCorrectedLinearEyeDepth1_g43881 = CorrectedLinearEyeDepth( z1_g43881 , correctionFactor1_g43881 );
				float eyeDepth18_g43881 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g43881 = ( eyeDepth18_g43881 - ScreenPos.w );
				float temp_output_13_0_g43881 = ( localCorrectedLinearEyeDepth1_g43881 - abs( temp_output_17_0_g43881 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g43868 = saturate( temp_output_13_0_g43881 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43869 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float GRAB_SCREEN_DEPTH73_g43868 = localCorrectedLinearEyeDepth1_g43881;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g43868 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43869 = temp_cast_23;
				float4 lerpResult281_g43869 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43869 * _FOAMVERTICAL_TintStrength ) * temp_cast_20 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43869.z + temp_cast_21 ) - temp_cast_22 ) * temp_output_294_0_g43869 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * temp_output_294_0_g43869 ) ) ));
				float4 lerpResult265_g43869 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43869 , FlowStrength1147_g43869);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g43869 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g43869 = ( break1161_g43869.z + 0.45 );
				float4 lerpResult1173_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_Z1162_g43869);
				float _MASK_VERTICAL_X1170_g43869 = ( break1161_g43869.x + 0.46 );
				float4 lerpResult1176_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_X1170_g43869);
				float _MASK_VERTICAL_Y1163_g43869 = ( -break1161_g43869.y + 6.5 );
				float4 lerpResult1179_g43869 = lerp( lerpResult1173_g43869 , ( lerpResult1173_g43869 + lerpResult1176_g43869 ) , _MASK_VERTICAL_Y1163_g43869);
				float4 temp_output_1189_0_g43869 = saturate( lerpResult1179_g43869 );
				float4 FOAM_VERTICAL_OFFSHORE655_g43868 = temp_output_1189_0_g43869;
				int m_switch278_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g43897 = float4( 0,0,0,0 );
				float mulTime806_g43897 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g43897 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g43897 = ( Speed1146_g43897 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g43897).xx;
				float2 appendResult219_g43897 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g43897 = ( appendResult219_g43897 * float2( 2,2 ) );
				float2 texCoord487_g43897 = IN.ase_texcoord8.xyz.xy * temp_output_1214_0_g43897 + float2( 0,0 );
				float cos485_g43897 = cos( _G_FlowSwirling.x );
				float sin485_g43897 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos485_g43897 , -sin485_g43897 , sin485_g43897 , cos485_g43897 )) + float2( 0,0 );
				float2 panner483_g43897 = ( mulTime806_g43897 * temp_cast_27 + rotator485_g43897);
				float2 temp_cast_28 = (temp_output_1150_0_g43897).xx;
				float cos481_g43897 = cos( _G_FlowSwirling.y );
				float sin481_g43897 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos481_g43897 , -sin481_g43897 , sin481_g43897 , cos481_g43897 )) + float2( 0,0 );
				float2 panner480_g43897 = ( mulTime806_g43897 * temp_cast_28 + rotator481_g43897);
				float2 temp_cast_29 = (temp_output_1150_0_g43897).xx;
				float2 panner478_g43897 = ( mulTime806_g43897 * temp_cast_29 + texCoord487_g43897);
				float4 OUT_SWIRLING298_g43897 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43897 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43897 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43897 ) ) );
				float4 m_Swirling278_g43897 = OUT_SWIRLING298_g43897;
				float2 texCoord196_g43898 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43898 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43898 = texCoord196_g43898;
				float2 blendOpDest197_g43898 = (_FLOWMAP_Map89_g43898).xy;
				float2 temp_output_197_0_g43898 = ( saturate( (( blendOpDest197_g43898 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43898 ) * ( 1.0 - blendOpSrc197_g43898 ) ) : ( 2.0 * blendOpDest197_g43898 * blendOpSrc197_g43898 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43898 = Speed1146_g43897;
				float temp_output_182_0_g43898 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43898 );
				float temp_output_194_0_g43898 = (0.0 + (( ( temp_output_182_0_g43898 - floor( ( temp_output_182_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43897 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43898 = FlowStrength1147_g43897;
				float _TIME_UV_A199_g43898 = ( -temp_output_194_0_g43898 * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult198_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_A199_g43898);
				float2 INPUT_MAP_TILLING128_g43897 = temp_output_1214_0_g43897;
				float2 texCoord205_g43898 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43897 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43898 = texCoord205_g43898;
				float2 FLOW_A201_g43898 = ( lerpResult198_g43898 + TEXTURE_TILLING211_g43898 );
				float temp_output_225_0_g43898 = (temp_output_182_0_g43898*1.0 + 0.5);
				float _TIME_UV_B214_g43898 = ( -(0.0 + (( ( temp_output_225_0_g43898 - floor( ( temp_output_225_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult229_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_B214_g43898);
				float2 FLOW_B232_g43898 = ( lerpResult229_g43898 + TEXTURE_TILLING211_g43898 );
				float TIME_BLEND235_g43898 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43898 / 0.5 ) ) ) );
				float4 lerpResult1117_g43897 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43898 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43898 ) , TIME_BLEND235_g43898);
				float4 OUT_FLOW_FLOWMAP1119_g43897 = lerpResult1117_g43897;
				float4 m_FlowMap278_g43897 = OUT_FLOW_FLOWMAP1119_g43897;
				float4 localfloat4switch278_g43897 = float4switch278_g43897( m_switch278_g43897 , m_Off278_g43897 , m_Swirling278_g43897 , m_FlowMap278_g43897 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43897 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43897 = temp_cast_35;
				float4 lerpResult281_g43897 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43897 * _FOAMHORIZONTAL_TintStrength ) * temp_cast_32 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43897.z + temp_cast_33 ) - temp_cast_34 ) * temp_output_294_0_g43897 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * temp_output_294_0_g43897 ) ) ));
				float4 lerpResult265_g43897 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43897 , FlowStrength1147_g43897);
				float _MASK_HORIZONTAL1160_g43897 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g43897 = lerp( float4(0.001,0.001,0.001,0) , lerpResult265_g43897 , _MASK_HORIZONTAL1160_g43897);
				float4 temp_output_1188_0_g43897 = saturate( lerpResult1185_g43897 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g43868 = temp_output_1188_0_g43897;
				int m_switch278_g43882 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g43882 = float4( 0,0,0,0 );
				float mulTime806_g43882 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g43882 = _FoamShoreline_Speed;
				float temp_output_1185_0_g43882 = ( FlowSpeed1179_g43882 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g43882).xx;
				float2 appendResult219_g43882 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g43882 = ( appendResult219_g43882 * float2( 2,2 ) );
				float2 INPUT_MAP_TILLING128_g43882 = temp_output_1196_0_g43882;
				float2 texCoord487_g43882 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43882 + float2( 0,0 );
				float cos485_g43882 = cos( _G_FlowSwirling.x );
				float sin485_g43882 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos485_g43882 , -sin485_g43882 , sin485_g43882 , cos485_g43882 )) + float2( 0,0 );
				float2 panner483_g43882 = ( mulTime806_g43882 * temp_cast_38 + rotator485_g43882);
				float2 temp_cast_39 = (temp_output_1185_0_g43882).xx;
				float cos481_g43882 = cos( _G_FlowSwirling.y );
				float sin481_g43882 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos481_g43882 , -sin481_g43882 , sin481_g43882 , cos481_g43882 )) + float2( 0,0 );
				float2 panner480_g43882 = ( mulTime806_g43882 * temp_cast_39 + rotator481_g43882);
				float2 temp_cast_40 = (temp_output_1185_0_g43882).xx;
				float2 panner478_g43882 = ( mulTime806_g43882 * temp_cast_40 + texCoord487_g43882);
				float4 OUT_SWIRLING298_g43882 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43882 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43882 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43882 ) ) );
				float4 m_Swirling278_g43882 = OUT_SWIRLING298_g43882;
				float2 texCoord196_g43884 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43884 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43884 = texCoord196_g43884;
				float2 blendOpDest197_g43884 = (_FLOWMAP_Map89_g43884).xy;
				float2 temp_output_197_0_g43884 = ( saturate( (( blendOpDest197_g43884 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43884 ) * ( 1.0 - blendOpSrc197_g43884 ) ) : ( 2.0 * blendOpDest197_g43884 * blendOpSrc197_g43884 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43884 = _FoamShoreline_Speed;
				float temp_output_182_0_g43884 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43884 );
				float temp_output_194_0_g43884 = (0.0 + (( ( temp_output_182_0_g43884 - floor( ( temp_output_182_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43884 = _FoamShoreline_FlowStrength;
				float _TIME_UV_A199_g43884 = ( -temp_output_194_0_g43884 * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult198_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_A199_g43884);
				float2 texCoord205_g43884 = IN.ase_texcoord8.xyz.xy * temp_output_1196_0_g43882 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43884 = texCoord205_g43884;
				float2 FLOW_A201_g43884 = ( lerpResult198_g43884 + TEXTURE_TILLING211_g43884 );
				float temp_output_225_0_g43884 = (temp_output_182_0_g43884*1.0 + 0.5);
				float _TIME_UV_B214_g43884 = ( -(0.0 + (( ( temp_output_225_0_g43884 - floor( ( temp_output_225_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult229_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_B214_g43884);
				float2 FLOW_B232_g43884 = ( lerpResult229_g43884 + TEXTURE_TILLING211_g43884 );
				float TIME_BLEND235_g43884 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43884 / 0.5 ) ) ) );
				float4 lerpResult1153_g43882 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43884 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43884 ) , TIME_BLEND235_g43884);
				float4 OUT_FLOW_FLOWMAP1156_g43882 = lerpResult1153_g43882;
				float4 m_FlowMap278_g43882 = OUT_FLOW_FLOWMAP1156_g43882;
				float4 localfloat4switch278_g43882 = float4switch278_g43882( m_switch278_g43882 , m_Off278_g43882 , m_Swirling278_g43882 , m_FlowMap278_g43882 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos731_g43882 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43882 = temp_cast_46;
				float4 lerpResult769_g43882 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g43882 * _FoamShoreline_TintStrength ) * temp_cast_43 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g43882.z + temp_cast_44 ) - temp_cast_45 ) * temp_output_294_0_g43882 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * temp_output_294_0_g43882 ) ) ));
				float FlowStrength1182_g43882 = _FoamShoreline_FlowStrength;
				float4 lerpResult761_g43882 = lerp( float4( 0,0,0,0 ) , lerpResult769_g43882 , FlowStrength1182_g43882);
				float4 FOAM_SHORELINE654_g43868 = lerpResult761_g43882;
				float4 temp_output_1492_0_g43868 = ( ( ( lerpResult105_g43868 + FOAM_VERTICAL_OFFSHORE655_g43868 ) + FOAM_HORIZONTAL_OFFSHORE1565_g43868 ) + FOAM_SHORELINE654_g43868 );
				float4 ALBEDO_IN60_g43873 = temp_output_1492_0_g43868;
				float4 m_Off119_g43873 = ALBEDO_IN60_g43873;
				int REFLECTION_MODE_URP123_g43873 = _Reflection_ModeURP;
				int m_switch124_g43873 = REFLECTION_MODE_URP123_g43873;
				float4 m_Off124_g43873 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g43868 = weightedBlend1711_g43868;
				float3 temp_output_53_0_g43873 = NORMAL_OUT_Z505_g43868;
				float3 NORMAL_IN106_g43873 = temp_output_53_0_g43873;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g43873 = clamp( ( (( NORMAL_IN106_g43873 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g43873 = clampResult29_g43873;
				float4 appendResult103_g43873 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g43873.x));
				float3 unpack104_g43873 = UnpackNormalScale( appendResult103_g43873, 0.15 );
				unpack104_g43873.z = lerp( 1, unpack104_g43873.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g43873 = unpack104_g43873;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 worldRefl24_g43873 = reflect( -WorldViewDirection, float3( dot( tanToWorld0, NORMAL_IN_Z54_g43873 ), dot( tanToWorld1, NORMAL_IN_Z54_g43873 ), dot( tanToWorld2, NORMAL_IN_Z54_g43873 ) ) );
				float REFLECTION_WOBBLE13_g43873 = _Reflection_Wobble;
				float4 texCUBENode31_g43873 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat_aniso2, ( float3( REFLECTION_BUMP9_g43873 ,  0.0 ) + worldRefl24_g43873 + REFLECTION_WOBBLE13_g43873 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g43873.r).xxxx;
				float REFLECTION_CLOUD12_g43873 = _Reflection_Cloud;
				float4 lerpResult49_g43873 = lerp( texCUBENode31_g43873 , temp_cast_52 , REFLECTION_CLOUD12_g43873);
				float4 m_ActiveCubeMap124_g43873 = lerpResult49_g43873;
				float3 temp_output_109_0_g43873 = SHADERGRAPH_REFLECTION_PROBE(WorldViewDirection,float3( ( REFLECTION_BUMP9_g43873 + REFLECTION_WOBBLE13_g43873 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g43873.x).xxx;
				float3 lerpResult115_g43873 = lerp( temp_output_109_0_g43873 , temp_cast_55 , REFLECTION_CLOUD12_g43873);
				float4 appendResult127_g43873 = (float4(lerpResult115_g43873 , 0.0));
				float4 m_ActiveProbe124_g43873 = appendResult127_g43873;
				float4 localfloat4switch124_g43873 = float4switch124_g43873( m_switch124_g43873 , m_Off124_g43873 , m_ActiveCubeMap124_g43873 , m_ActiveProbe124_g43873 );
				float fresnelNdotV23_g43873 = dot( WorldNormal, WorldViewDirection );
				float fresnelNode23_g43873 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g43873 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g43873 = ( _Reflection_FresnelStrength * fresnelNode23_g43873 );
				float4 lerpResult73_g43873 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g43873 , REFLECTION_FRESNEL11_g43873);
				float4 lerpResult133_g43873 = lerp( localfloat4switch124_g43873 , lerpResult73_g43873 , _Reflection_FresnelMode);
				float4 switchResult85_g43873 = (((ase_vface>0)?(lerpResult133_g43873):(float4( 0,0,0,0 ))));
				float4 temp_cast_57 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g43873 = temp_cast_57;
				#else
				float4 staticSwitch95_g43873 = ( ( ( 1.0 - 0.5 ) * switchResult85_g43873 ) + ( ALBEDO_IN60_g43873 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g43873 = staticSwitch95_g43873;
				float4 m_ActiveProbe119_g43873 = staticSwitch95_g43873;
				float4 localfloat4switch119_g43873 = float4switch119_g43873( m_switch119_g43873 , m_Off119_g43873 , m_ActiveCubeMap119_g43873 , m_ActiveProbe119_g43873 );
				
				int ModeFlowType1245_g43869 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g43869 = ModeFlowType1245_g43869;
				float3 m_Off1246_g43869 = float3( 0,0,1 );
				float3 temp_output_21_0_g43871 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43871 = cross( WorldNormal , ddy( temp_output_21_0_g43871 ) );
				float3 temp_output_6_0_g43871 = ddx( temp_output_21_0_g43871 );
				float dotResult27_g43871 = dot( temp_output_15_0_g43871 , temp_output_6_0_g43871 );
				float temp_output_14_0_g43871 = abs( dotResult27_g43871 );
				float4 temp_output_8_0_g43871 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g43869 );
				float4 break18_g43871 = ( sign( temp_output_14_0_g43871 ) * ( ( ddx( temp_output_8_0_g43871 ) * float4( temp_output_15_0_g43871 , 0.0 ) ) + ( ddy( temp_output_8_0_g43871 ) * float4( cross( WorldNormal , temp_output_6_0_g43871 ) , 0.0 ) ) ) );
				float3 appendResult7_g43871 = (float3(break18_g43871.x , -break18_g43871.y , break18_g43871.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g43871 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43871 * WorldNormal ) - appendResult7_g43871 )) );
				float3 temp_output_1249_32_g43869 = worldToTangentDir5_g43871;
				float3 m_Swirling1246_g43869 = temp_output_1249_32_g43869;
				float3 m_FlowMap1246_g43869 = temp_output_1249_32_g43869;
				float3 localfloat3switch1246_g43869 = float3switch1246_g43869( m_switch1246_g43869 , m_Off1246_g43869 , m_Swirling1246_g43869 , m_FlowMap1246_g43869 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 = localfloat3switch1246_g43869;
				int ModeFlowType1232_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g43897 = ModeFlowType1232_g43897;
				float3 m_Off1230_g43897 = float3( 0,0,1 );
				float3 temp_output_21_0_g43899 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43899 = cross( WorldNormal , ddy( temp_output_21_0_g43899 ) );
				float3 temp_output_6_0_g43899 = ddx( temp_output_21_0_g43899 );
				float dotResult27_g43899 = dot( temp_output_15_0_g43899 , temp_output_6_0_g43899 );
				float temp_output_14_0_g43899 = abs( dotResult27_g43899 );
				float4 temp_output_8_0_g43899 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g43897 );
				float4 break18_g43899 = ( sign( temp_output_14_0_g43899 ) * ( ( ddx( temp_output_8_0_g43899 ) * float4( temp_output_15_0_g43899 , 0.0 ) ) + ( ddy( temp_output_8_0_g43899 ) * float4( cross( WorldNormal , temp_output_6_0_g43899 ) , 0.0 ) ) ) );
				float3 appendResult7_g43899 = (float3(break18_g43899.x , -break18_g43899.y , break18_g43899.z));
				float3 worldToTangentDir5_g43899 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43899 * WorldNormal ) - appendResult7_g43899 )) );
				float3 temp_output_1233_32_g43897 = worldToTangentDir5_g43899;
				float3 m_Swirling1230_g43897 = temp_output_1233_32_g43897;
				float3 m_FlowMap1230_g43897 = temp_output_1233_32_g43897;
				float3 localfloat3switch1230_g43897 = float3switch1230_g43897( m_switch1230_g43897 , m_Off1230_g43897 , m_Swirling1230_g43897 , m_FlowMap1230_g43897 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 = localfloat3switch1230_g43897;
				int ModeFlowType1225_g43882 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g43882 = ModeFlowType1225_g43882;
				float3 m_Off1223_g43882 = float3( 0,0,1 );
				float3 temp_output_21_0_g43883 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43883 = cross( WorldNormal , ddy( temp_output_21_0_g43883 ) );
				float3 temp_output_6_0_g43883 = ddx( temp_output_21_0_g43883 );
				float dotResult27_g43883 = dot( temp_output_15_0_g43883 , temp_output_6_0_g43883 );
				float temp_output_14_0_g43883 = abs( dotResult27_g43883 );
				float4 temp_output_8_0_g43883 = ( _FoamShoreline_NormalStrength * lerpResult761_g43882 );
				float4 break18_g43883 = ( sign( temp_output_14_0_g43883 ) * ( ( ddx( temp_output_8_0_g43883 ) * float4( temp_output_15_0_g43883 , 0.0 ) ) + ( ddy( temp_output_8_0_g43883 ) * float4( cross( WorldNormal , temp_output_6_0_g43883 ) , 0.0 ) ) ) );
				float3 appendResult7_g43883 = (float3(break18_g43883.x , -break18_g43883.y , break18_g43883.z));
				float3 worldToTangentDir5_g43883 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43883 * WorldNormal ) - appendResult7_g43883 )) );
				float3 temp_output_1222_32_g43882 = worldToTangentDir5_g43883;
				float3 m_Swirling1223_g43882 = temp_output_1222_32_g43882;
				float3 m_FlowMap1223_g43882 = temp_output_1222_32_g43882;
				float3 localfloat3switch1223_g43882 = float3switch1223_g43882( m_switch1223_g43882 , m_Off1223_g43882 , m_Swirling1223_g43882 , m_FlowMap1223_g43882 );
				float3 FOAM_NORMALShorline1208_g43868 = localfloat3switch1223_g43882;
				float3 temp_output_1715_0_g43868 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g43868 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 ) , FOAM_NORMALShorline1208_g43868 );
				float3 worldPosValue71_g43895 = WorldPosition;
				float3 WorldPosition66_g43895 = worldPosValue71_g43895;
				float3 NORMAL_OUT1731_g43868 = temp_output_1715_0_g43868;
				float3 temp_output_16_0_g43895 = NORMAL_OUT1731_g43868;
				float3 lerpResult163_g43895 = lerp( ( WorldTangent * temp_output_16_0_g43895.x ) , ( WorldBiTangent * temp_output_16_0_g43895.y ) , ( WorldNormal * temp_output_16_0_g43895.z ));
				float3 NORMAL_PERPIXEL136_g43895 = lerpResult163_g43895;
				float3 WorldNormal66_g43895 = NORMAL_PERPIXEL136_g43895;
				float3 WorldView66_g43895 = WorldViewDirection;
				float3 temp_output_1_0_g43895 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g43895 = (temp_output_1_0_g43895).xyz;
				float temp_output_173_0_g43895 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g43895 = temp_output_173_0_g43895;
				float4 shadowMaskValue77_g43895 = float4(1,1,1,1);
				float4 ShadowMask66_g43895 = shadowMaskValue77_g43895;
				float3 localAdditionalLightsSpecularMask66_g43895 = AdditionalLightsSpecularMask( WorldPosition66_g43895 , WorldNormal66_g43895 , WorldView66_g43895 , SpecColor66_g43895 , Smoothness66_g43895 , ShadowMask66_g43895 );
				float3 ADDITIONAL_LIGHT1730_g43868 = localAdditionalLightsSpecularMask66_g43895;
				float3 temp_output_1732_0_g43868 = ( temp_output_1715_0_g43868 + ADDITIONAL_LIGHT1730_g43868 );
				
				float temp_output_43_0_g43893 = _SpecularMode;
				float m_switch18_g43893 = temp_output_43_0_g43893;
				float3 m_Off18_g43893 = float3( 0,0,0 );
				float3 tanNormal37_g43893 = temp_output_1732_0_g43868;
				float3 worldNormal37_g43893 = float3(dot(tanToWorld0,tanNormal37_g43893), dot(tanToWorld1,tanNormal37_g43893), dot(tanToWorld2,tanNormal37_g43893));
				float3 normalizeResult20_g43893 = normalize( worldNormal37_g43893 );
				float3 normalizeResult27_g43893 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g43893 = dot( normalizeResult20_g43893 , normalizeResult27_g43893 );
				float temp_output_48_0_g43893 = _SpecularWrap;
				float temp_output_46_0_g43893 = (dotResult19_g43893*temp_output_48_0_g43893 + temp_output_48_0_g43893);
				float saferPower25_g43893 = abs( ( temp_output_46_0_g43893 * temp_output_46_0_g43893 * temp_output_46_0_g43893 ) );
				float _SPECULAR_Mode22_g43893 = temp_output_43_0_g43893;
				float m_switch31_g43893 = _SPECULAR_Mode22_g43893;
				float3 m_Off31_g43893 = float3( 0,0,0 );
				float3 temp_output_16_0_g43893 = (_SpecularColor).rgb;
				float3 m_Active31_g43893 = temp_output_16_0_g43893;
				float3 clampResult5_g43893 = clamp( temp_output_16_0_g43893 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g43893 = clampResult5_g43893;
				float3 localfloat3switch31_g43893 = float3switch31_g43893( m_switch31_g43893 , m_Off31_g43893 , m_Active31_g43893 , m_ActiveClamp31_g43893 );
				float m_switch11_g43893 = _SPECULAR_Mode22_g43893;
				float3 m_Off11_g43893 = float3( 0,0,0 );
				float3 temp_output_4_0_g43893 = (_MainLightColor).rgb;
				float3 m_Active11_g43893 = temp_output_4_0_g43893;
				float3 clampResult9_g43893 = clamp( temp_output_4_0_g43893 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g43893 = clampResult9_g43893;
				float3 localfloat3switch11_g43893 = float3switch11_g43893( m_switch11_g43893 , m_Off11_g43893 , m_Active11_g43893 , m_ActiveClamp11_g43893 );
				float3 temp_output_24_0_g43893 = saturate( ( pow( saferPower25_g43893 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g43893 * localfloat3switch11_g43893 ) ) ) );
				float3 m_Active18_g43893 = temp_output_24_0_g43893;
				float3 m_ActiveClamp18_g43893 = temp_output_24_0_g43893;
				float3 localfloat3switch18_g43893 = float3switch18_g43893( m_switch18_g43893 , m_Off18_g43893 , m_Active18_g43893 , m_ActiveClamp18_g43893 );
				
				float temp_output_1454_0_g43868 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_68 = (temp_output_1454_0_g43868).xxx;
				float3 tanNormal1601_g43868 = NORMAL_OUT_Z505_g43868;
				float3 worldNormal1601_g43868 = float3(dot(tanToWorld0,tanNormal1601_g43868), dot(tanToWorld1,tanNormal1601_g43868), dot(tanToWorld2,tanNormal1601_g43868));
				float fresnelNdotV1412_g43868 = dot( worldNormal1601_g43868, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g43868 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g43868 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g43868 = lerp( temp_cast_68 , ( temp_output_1454_0_g43868 * worldNormal1601_g43868 ) , ( fresnelNode1412_g43868 * ( 1.0 - fresnelNode1412_g43868 ) ));
				float3 clampResult1740_g43868 = clamp( lerpResult1403_g43868 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				
				float3 Albedo = localfloat4switch119_g43873.rgb;
				float3 Normal = temp_output_1732_0_g43868;
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g43893;
				float Metallic = 0;
				float Smoothness = clampResult1740_g43868.x;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif
				
				#ifdef _CLEARCOAT
				float CoatMask = 0;
				float CoatSmoothness = 0;
				#endif


				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif


				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
				inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#endif

				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif

					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = Albedo;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;


				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);


			#if _CASTING_PUNCTUAL_LIGHT_SHADOW
				float3 lightDirectionWS = normalize(_LightPosition - positionWS);
			#else
				float3 lightDirectionWS = _LightDirection;
			#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));
			
			#if UNITY_REVERSED_Z
				clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
			#else
				clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
			#endif


				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}
		
		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature _ EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
				float4 VizUV : TEXCOORD2;
				float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat_aniso2);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g43888( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g43875( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43869( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43897( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43882( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord5.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord9.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord10.xyz = ase_worldBitangent;
				
				o.ase_texcoord5.xyz = v.texcoord0.xyz;
				o.ase_texcoord7 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

			#ifdef EDITOR_VISUALIZATION
				float2 VizUV = 0;
				float4 LightCoord = 0;
				UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
				o.VizUV = float4(VizUV, 0, 0);
				o.LightCoord = LightCoord;
			#endif

			#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = o.clipPos;
				o.shadowCoord = GetShadowCoord( vertexInput );
			#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch119_g43873 = _Reflection_ModeURP;
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g43868 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g43868 = abs( ( screenDepth2_g43868 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g43868 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g43868*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g43868 = lerp( _DepthTint , lerpResult25_g43868 , saturate( (distanceDepth2_g43868*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g43868 = lerpResult27_g43868;
				int m_switch238_g43888 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g43888 = float3(0,0,0.001);
				float mulTime155_g43888 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g43888 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g43888 = ( FlowSpeed365_g43888 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g43888).xx;
				float2 appendResult235_g43888 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g43888 = IN.ase_texcoord5.xyz.xy * ( appendResult235_g43888 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g43888 = cos( _G_FlowSwirling.x );
				float sin62_g43888 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos62_g43888 , -sin62_g43888 , sin62_g43888 , cos62_g43888 )) + float2( 0,0 );
				float2 panner15_g43888 = ( mulTime155_g43888 * temp_cast_0 + rotator62_g43888);
				float2 temp_cast_1 = (temp_output_367_0_g43888).xx;
				float cos8_g43888 = cos( _G_FlowSwirling.y );
				float sin8_g43888 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos8_g43888 , -sin8_g43888 , sin8_g43888 , cos8_g43888 )) + float2( 0,0 );
				float2 panner16_g43888 = ( mulTime155_g43888 * temp_cast_1 + rotator8_g43888);
				float2 temp_cast_2 = (temp_output_367_0_g43888).xx;
				float2 panner17_g43888 = ( mulTime155_g43888 * temp_cast_2 + texCoord23_g43888);
				float2 layeredBlendVar666_g43888 = IN.ase_texcoord5.xyz.xy;
				float4 layeredBlend666_g43888 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43888 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43888 ) , layeredBlendVar666_g43888.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43888 ) , layeredBlendVar666_g43888.y ) );
				float4 temp_output_1_0_g43892 = layeredBlend666_g43888;
				float temp_output_8_0_g43892 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g43892 = UnpackNormalScale( temp_output_1_0_g43892, temp_output_8_0_g43892 );
				unpack52_g43892.z = lerp( 1, unpack52_g43892.z, saturate(temp_output_8_0_g43892) );
				float3 temp_output_699_59_g43888 = unpack52_g43892;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 temp_output_372_0_g43888 = abs( ase_worldNormal );
				float3 break386_g43888 = ( temp_output_372_0_g43888 * temp_output_372_0_g43888 );
				float _MASK_VERTICAL_Z381_g43888 = ( break386_g43888.z + 0.01 );
				float3 lerpResult677_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float _MASK_VERTICAL_X373_g43888 = ( -break386_g43888.x + 0.2 );
				float3 lerpResult681_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float _MASK_VERTICAL_Y_NEG413_g43888 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult677_g43888 + lerpResult681_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_Swirling238_g43888 = lerpResult679_g43888;
				float2 texCoord196_g43890 = IN.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43890 = IN.ase_texcoord7;
				float2 blendOpSrc197_g43890 = texCoord196_g43890;
				float2 blendOpDest197_g43890 = (_FLOWMAP_Map89_g43890).xy;
				float2 temp_output_197_0_g43890 = ( saturate( (( blendOpDest197_g43890 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43890 ) * ( 1.0 - blendOpSrc197_g43890 ) ) : ( 2.0 * blendOpDest197_g43890 * blendOpSrc197_g43890 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43890 = FlowSpeed365_g43888;
				float temp_output_182_0_g43890 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43890 );
				float temp_output_194_0_g43890 = (0.0 + (( ( temp_output_182_0_g43890 - floor( ( temp_output_182_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43890 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g43890 = ( -temp_output_194_0_g43890 * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult198_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_A199_g43890);
				float2 INPUT_MAP_TILLING128_g43888 = appendResult235_g43888;
				float2 texCoord205_g43890 = IN.ase_texcoord5.xyz.xy * INPUT_MAP_TILLING128_g43888 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43890 = texCoord205_g43890;
				float2 FLOW_A201_g43890 = ( lerpResult198_g43890 + TEXTURE_TILLING211_g43890 );
				float temp_output_225_0_g43890 = (temp_output_182_0_g43890*1.0 + 0.5);
				float _TIME_UV_B214_g43890 = ( -(0.0 + (( ( temp_output_225_0_g43890 - floor( ( temp_output_225_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult229_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_B214_g43890);
				float2 FLOW_B232_g43890 = ( lerpResult229_g43890 + TEXTURE_TILLING211_g43890 );
				float TIME_BLEND235_g43890 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43890 / 0.5 ) ) ) );
				float4 lerpResult317_g43888 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43890 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43890 ) , TIME_BLEND235_g43890);
				float4 temp_output_1_0_g43889 = lerpResult317_g43888;
				float NormalStrength152_g43888 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g43889 = NormalStrength152_g43888;
				float3 unpack52_g43889 = UnpackNormalScale( temp_output_1_0_g43889, temp_output_8_0_g43889 );
				unpack52_g43889.z = lerp( 1, unpack52_g43889.z, saturate(temp_output_8_0_g43889) );
				float3 temp_output_701_59_g43888 = unpack52_g43889;
				float3 lerpResult692_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float3 lerpResult691_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float3 lerpResult697_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult692_g43888 + lerpResult691_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_FlowMap238_g43888 = lerpResult697_g43888;
				float3 localfloat3switch238_g43888 = float3switch238_g43888( m_switch238_g43888 , m_Off238_g43888 , m_Swirling238_g43888 , m_FlowMap238_g43888 );
				int m_switch456_g43875 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g43875 = float3(0,0,0.001);
				float mulTime155_g43875 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g43875 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g43875 = ( FlowSpeed365_g43875 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g43875).xx;
				float2 appendResult235_g43875 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g43875 = IN.ase_texcoord5.xyz.xy * ( appendResult235_g43875 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g43875 = cos( _G_FlowSwirling.x );
				float sin62_g43875 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos62_g43875 , -sin62_g43875 , sin62_g43875 , cos62_g43875 )) + float2( 0,0 );
				float2 panner15_g43875 = ( mulTime155_g43875 * temp_cast_5 + rotator62_g43875);
				float2 temp_cast_6 = (temp_output_367_0_g43875).xx;
				float cos8_g43875 = cos( _G_FlowSwirling.y );
				float sin8_g43875 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos8_g43875 , -sin8_g43875 , sin8_g43875 , cos8_g43875 )) + float2( 0,0 );
				float2 panner16_g43875 = ( mulTime155_g43875 * temp_cast_6 + rotator8_g43875);
				float2 temp_cast_7 = (temp_output_367_0_g43875).xx;
				float2 panner17_g43875 = ( mulTime155_g43875 * temp_cast_7 + texCoord23_g43875);
				float2 layeredBlendVar448_g43875 = IN.ase_texcoord5.xyz.xy;
				float4 layeredBlend448_g43875 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43875 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43875 ) , layeredBlendVar448_g43875.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43875 ) , layeredBlendVar448_g43875.y ) );
				float4 temp_output_1_0_g43879 = layeredBlend448_g43875;
				float temp_output_8_0_g43879 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g43879 = UnpackNormalScale( temp_output_1_0_g43879, temp_output_8_0_g43879 );
				unpack52_g43879.z = lerp( 1, unpack52_g43879.z, saturate(temp_output_8_0_g43879) );
				float3 temp_output_481_59_g43875 = unpack52_g43879;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g43875 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g43875 = ( break386_g43875.z + 0.75 );
				float3 lerpResult465_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float _MASK_VERTICAL_X373_g43875 = ( break386_g43875.x + 0.45 );
				float3 lerpResult457_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float _MASK_VERTICAL_Y383_g43875 = ( -break386_g43875.y + 5.0 );
				float3 lerpResult454_g43875 = lerp( lerpResult465_g43875 , ( lerpResult465_g43875 + lerpResult457_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float _MASK_VERTICAL_Y_NEG413_g43875 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g43875 = lerp( float3( 0,0,0 ) , lerpResult454_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_Swirling456_g43875 = lerpResult477_g43875;
				float2 texCoord196_g43876 = IN.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43876 = IN.ase_texcoord7;
				float2 blendOpSrc197_g43876 = texCoord196_g43876;
				float2 blendOpDest197_g43876 = (_FLOWMAP_Map89_g43876).xy;
				float2 temp_output_197_0_g43876 = ( saturate( (( blendOpDest197_g43876 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43876 ) * ( 1.0 - blendOpSrc197_g43876 ) ) : ( 2.0 * blendOpDest197_g43876 * blendOpSrc197_g43876 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43876 = FlowSpeed365_g43875;
				float temp_output_182_0_g43876 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43876 );
				float temp_output_194_0_g43876 = (0.0 + (( ( temp_output_182_0_g43876 - floor( ( temp_output_182_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43876 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g43876 = ( -temp_output_194_0_g43876 * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult198_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_A199_g43876);
				float2 INPUT_MAP_TILLING128_g43875 = appendResult235_g43875;
				float2 texCoord205_g43876 = IN.ase_texcoord5.xyz.xy * INPUT_MAP_TILLING128_g43875 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43876 = texCoord205_g43876;
				float2 FLOW_A201_g43876 = ( lerpResult198_g43876 + TEXTURE_TILLING211_g43876 );
				float temp_output_225_0_g43876 = (temp_output_182_0_g43876*1.0 + 0.5);
				float _TIME_UV_B214_g43876 = ( -(0.0 + (( ( temp_output_225_0_g43876 - floor( ( temp_output_225_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult229_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_B214_g43876);
				float2 FLOW_B232_g43876 = ( lerpResult229_g43876 + TEXTURE_TILLING211_g43876 );
				float TIME_BLEND235_g43876 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43876 / 0.5 ) ) ) );
				float4 lerpResult317_g43875 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43876 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43876 ) , TIME_BLEND235_g43876);
				float4 temp_output_1_0_g43878 = lerpResult317_g43875;
				float NormalStrength152_g43875 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g43878 = NormalStrength152_g43875;
				float3 unpack52_g43878 = UnpackNormalScale( temp_output_1_0_g43878, temp_output_8_0_g43878 );
				unpack52_g43878.z = lerp( 1, unpack52_g43878.z, saturate(temp_output_8_0_g43878) );
				float3 temp_output_483_59_g43875 = unpack52_g43878;
				float3 lerpResult466_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float3 lerpResult453_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float3 lerpResult460_g43875 = lerp( lerpResult466_g43875 , ( lerpResult466_g43875 + lerpResult453_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float3 lerpResult411_g43875 = lerp( float3( 0,0,0 ) , lerpResult460_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_FlowMap456_g43875 = lerpResult411_g43875;
				float3 localfloat3switch456_g43875 = float3switch456_g43875( m_switch456_g43875 , m_Off456_g43875 , m_Swirling456_g43875 , m_FlowMap456_g43875 );
				float2 weightedBlendVar1711_g43868 = IN.ase_texcoord5.xyz.xy;
				float3 weightedBlend1711_g43868 = ( weightedBlendVar1711_g43868.x*localfloat3switch238_g43888 + weightedBlendVar1711_g43868.y*localfloat3switch456_g43875 );
				float3 NORMAL_IN84_g43894 = ( weightedBlend1711_g43868 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g43894 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord5.w;
				float eyeDepth7_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g43894 = ( (NORMAL_IN84_g43894).xy * ( REFACTED_SCALE_FLOAT78_g43894 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g43894 - eyeDepth ) ) );
				float eyeDepth27_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g43894, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g43894 = (( float4( ( temp_output_21_0_g43894 * saturate( ( eyeDepth27_g43894 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g43894 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g43894 ), 1.0 );
				float4 REFRACTED_DEPTH144_g43868 = fetchOpaqueVal89_g43894;
				float temp_output_20_0_g43868 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g43868 = 0.0;
				#else
				float staticSwitch37_g43868 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g43868*-5.0 + 1.0) ) ) ) * temp_output_20_0_g43868 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g43868 = staticSwitch37_g43868;
				float4 lerpResult105_g43868 = lerp( COLOR_TINT161_g43868 , REFRACTED_DEPTH144_g43868 , DEPTH_TINT_ALPHA93_g43868);
				float4 _MaskVector1 = float4(0.001,0.001,0.001,0);
				int m_switch278_g43869 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g43869 = float4( 0,0,0,0 );
				float mulTime806_g43869 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g43869 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g43869 = ( FlowSpeed1146_g43869 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g43869).xx;
				float2 appendResult219_g43869 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g43869 = ( appendResult219_g43869 * float2( 2,2 ) );
				float2 texCoord487_g43869 = IN.ase_texcoord5.xyz.xy * temp_output_1294_0_g43869 + float2( 0,0 );
				float cos485_g43869 = cos( _G_FlowSwirling.x );
				float sin485_g43869 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos485_g43869 , -sin485_g43869 , sin485_g43869 , cos485_g43869 )) + float2( 0,0 );
				float2 panner483_g43869 = ( mulTime806_g43869 * temp_cast_14 + rotator485_g43869);
				float2 temp_cast_15 = (temp_output_1150_0_g43869).xx;
				float cos481_g43869 = cos( _G_FlowSwirling.y );
				float sin481_g43869 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos481_g43869 , -sin481_g43869 , sin481_g43869 , cos481_g43869 )) + float2( 0,0 );
				float2 panner480_g43869 = ( mulTime806_g43869 * temp_cast_15 + rotator481_g43869);
				float2 temp_cast_16 = (temp_output_1150_0_g43869).xx;
				float2 panner478_g43869 = ( mulTime806_g43869 * temp_cast_16 + texCoord487_g43869);
				float4 OUT_SWIRLING298_g43869 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43869 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43869 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43869 ) ) );
				float4 m_Swirling278_g43869 = OUT_SWIRLING298_g43869;
				float2 texCoord196_g43872 = IN.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43872 = IN.ase_texcoord7;
				float2 blendOpSrc197_g43872 = texCoord196_g43872;
				float2 blendOpDest197_g43872 = (_FLOWMAP_Map89_g43872).xy;
				float2 temp_output_197_0_g43872 = ( saturate( (( blendOpDest197_g43872 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43872 ) * ( 1.0 - blendOpSrc197_g43872 ) ) : ( 2.0 * blendOpDest197_g43872 * blendOpSrc197_g43872 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43872 = FlowSpeed1146_g43869;
				float temp_output_182_0_g43872 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43872 );
				float temp_output_194_0_g43872 = (0.0 + (( ( temp_output_182_0_g43872 - floor( ( temp_output_182_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43869 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43872 = FlowStrength1147_g43869;
				float _TIME_UV_A199_g43872 = ( -temp_output_194_0_g43872 * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult198_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_A199_g43872);
				float2 INPUT_MAP_TILLING128_g43869 = temp_output_1294_0_g43869;
				float2 texCoord205_g43872 = IN.ase_texcoord5.xyz.xy * INPUT_MAP_TILLING128_g43869 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43872 = texCoord205_g43872;
				float2 FLOW_A201_g43872 = ( lerpResult198_g43872 + TEXTURE_TILLING211_g43872 );
				float temp_output_225_0_g43872 = (temp_output_182_0_g43872*1.0 + 0.5);
				float _TIME_UV_B214_g43872 = ( -(0.0 + (( ( temp_output_225_0_g43872 - floor( ( temp_output_225_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult229_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_B214_g43872);
				float2 FLOW_B232_g43872 = ( lerpResult229_g43872 + TEXTURE_TILLING211_g43872 );
				float TIME_BLEND235_g43872 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43872 / 0.5 ) ) ) );
				float4 lerpResult1117_g43869 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43872 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43872 ) , TIME_BLEND235_g43872);
				float4 OUT_FLOW_FLOWMAP1119_g43869 = lerpResult1117_g43869;
				float4 m_FlowMap278_g43869 = OUT_FLOW_FLOWMAP1119_g43869;
				float4 localfloat4switch278_g43869 = float4switch278_g43869( m_switch278_g43869 , m_Off278_g43869 , m_Swirling278_g43869 , m_FlowMap278_g43869 );
				float clampDepth2_g43881 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g43881 = clampDepth2_g43881;
				float4 localCalculateObliqueFrustumCorrection3_g43896 = CalculateObliqueFrustumCorrection();
				float dotResult4_g43896 = dot( float4( IN.ase_texcoord8.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g43896 );
				float correctionFactor1_g43881 = dotResult4_g43896;
				float localCorrectedLinearEyeDepth1_g43881 = CorrectedLinearEyeDepth( z1_g43881 , correctionFactor1_g43881 );
				float eyeDepth18_g43881 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g43881 = ( eyeDepth18_g43881 - screenPos.w );
				float temp_output_13_0_g43881 = ( localCorrectedLinearEyeDepth1_g43881 - abs( temp_output_17_0_g43881 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g43868 = saturate( temp_output_13_0_g43881 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43869 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord8.xyz) );
				float GRAB_SCREEN_DEPTH73_g43868 = localCorrectedLinearEyeDepth1_g43881;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g43868 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43869 = temp_cast_23;
				float4 lerpResult281_g43869 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43869 * _FOAMVERTICAL_TintStrength ) * temp_cast_20 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43869.z + temp_cast_21 ) - temp_cast_22 ) * temp_output_294_0_g43869 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * temp_output_294_0_g43869 ) ) ));
				float4 lerpResult265_g43869 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43869 , FlowStrength1147_g43869);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g43869 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g43869 = ( break1161_g43869.z + 0.45 );
				float4 lerpResult1173_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_Z1162_g43869);
				float _MASK_VERTICAL_X1170_g43869 = ( break1161_g43869.x + 0.46 );
				float4 lerpResult1176_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_X1170_g43869);
				float _MASK_VERTICAL_Y1163_g43869 = ( -break1161_g43869.y + 6.5 );
				float4 lerpResult1179_g43869 = lerp( lerpResult1173_g43869 , ( lerpResult1173_g43869 + lerpResult1176_g43869 ) , _MASK_VERTICAL_Y1163_g43869);
				float4 temp_output_1189_0_g43869 = saturate( lerpResult1179_g43869 );
				float4 FOAM_VERTICAL_OFFSHORE655_g43868 = temp_output_1189_0_g43869;
				int m_switch278_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g43897 = float4( 0,0,0,0 );
				float mulTime806_g43897 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g43897 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g43897 = ( Speed1146_g43897 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g43897).xx;
				float2 appendResult219_g43897 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g43897 = ( appendResult219_g43897 * float2( 2,2 ) );
				float2 texCoord487_g43897 = IN.ase_texcoord5.xyz.xy * temp_output_1214_0_g43897 + float2( 0,0 );
				float cos485_g43897 = cos( _G_FlowSwirling.x );
				float sin485_g43897 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos485_g43897 , -sin485_g43897 , sin485_g43897 , cos485_g43897 )) + float2( 0,0 );
				float2 panner483_g43897 = ( mulTime806_g43897 * temp_cast_27 + rotator485_g43897);
				float2 temp_cast_28 = (temp_output_1150_0_g43897).xx;
				float cos481_g43897 = cos( _G_FlowSwirling.y );
				float sin481_g43897 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos481_g43897 , -sin481_g43897 , sin481_g43897 , cos481_g43897 )) + float2( 0,0 );
				float2 panner480_g43897 = ( mulTime806_g43897 * temp_cast_28 + rotator481_g43897);
				float2 temp_cast_29 = (temp_output_1150_0_g43897).xx;
				float2 panner478_g43897 = ( mulTime806_g43897 * temp_cast_29 + texCoord487_g43897);
				float4 OUT_SWIRLING298_g43897 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43897 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43897 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43897 ) ) );
				float4 m_Swirling278_g43897 = OUT_SWIRLING298_g43897;
				float2 texCoord196_g43898 = IN.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43898 = IN.ase_texcoord7;
				float2 blendOpSrc197_g43898 = texCoord196_g43898;
				float2 blendOpDest197_g43898 = (_FLOWMAP_Map89_g43898).xy;
				float2 temp_output_197_0_g43898 = ( saturate( (( blendOpDest197_g43898 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43898 ) * ( 1.0 - blendOpSrc197_g43898 ) ) : ( 2.0 * blendOpDest197_g43898 * blendOpSrc197_g43898 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43898 = Speed1146_g43897;
				float temp_output_182_0_g43898 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43898 );
				float temp_output_194_0_g43898 = (0.0 + (( ( temp_output_182_0_g43898 - floor( ( temp_output_182_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43897 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43898 = FlowStrength1147_g43897;
				float _TIME_UV_A199_g43898 = ( -temp_output_194_0_g43898 * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult198_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_A199_g43898);
				float2 INPUT_MAP_TILLING128_g43897 = temp_output_1214_0_g43897;
				float2 texCoord205_g43898 = IN.ase_texcoord5.xyz.xy * INPUT_MAP_TILLING128_g43897 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43898 = texCoord205_g43898;
				float2 FLOW_A201_g43898 = ( lerpResult198_g43898 + TEXTURE_TILLING211_g43898 );
				float temp_output_225_0_g43898 = (temp_output_182_0_g43898*1.0 + 0.5);
				float _TIME_UV_B214_g43898 = ( -(0.0 + (( ( temp_output_225_0_g43898 - floor( ( temp_output_225_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult229_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_B214_g43898);
				float2 FLOW_B232_g43898 = ( lerpResult229_g43898 + TEXTURE_TILLING211_g43898 );
				float TIME_BLEND235_g43898 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43898 / 0.5 ) ) ) );
				float4 lerpResult1117_g43897 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43898 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43898 ) , TIME_BLEND235_g43898);
				float4 OUT_FLOW_FLOWMAP1119_g43897 = lerpResult1117_g43897;
				float4 m_FlowMap278_g43897 = OUT_FLOW_FLOWMAP1119_g43897;
				float4 localfloat4switch278_g43897 = float4switch278_g43897( m_switch278_g43897 , m_Off278_g43897 , m_Swirling278_g43897 , m_FlowMap278_g43897 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43897 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord8.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43897 = temp_cast_35;
				float4 lerpResult281_g43897 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43897 * _FOAMHORIZONTAL_TintStrength ) * temp_cast_32 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43897.z + temp_cast_33 ) - temp_cast_34 ) * temp_output_294_0_g43897 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * temp_output_294_0_g43897 ) ) ));
				float4 lerpResult265_g43897 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43897 , FlowStrength1147_g43897);
				float _MASK_HORIZONTAL1160_g43897 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g43897 = lerp( float4(0.001,0.001,0.001,0) , lerpResult265_g43897 , _MASK_HORIZONTAL1160_g43897);
				float4 temp_output_1188_0_g43897 = saturate( lerpResult1185_g43897 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g43868 = temp_output_1188_0_g43897;
				int m_switch278_g43882 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g43882 = float4( 0,0,0,0 );
				float mulTime806_g43882 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g43882 = _FoamShoreline_Speed;
				float temp_output_1185_0_g43882 = ( FlowSpeed1179_g43882 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g43882).xx;
				float2 appendResult219_g43882 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g43882 = ( appendResult219_g43882 * float2( 2,2 ) );
				float2 INPUT_MAP_TILLING128_g43882 = temp_output_1196_0_g43882;
				float2 texCoord487_g43882 = IN.ase_texcoord5.xyz.xy * INPUT_MAP_TILLING128_g43882 + float2( 0,0 );
				float cos485_g43882 = cos( _G_FlowSwirling.x );
				float sin485_g43882 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos485_g43882 , -sin485_g43882 , sin485_g43882 , cos485_g43882 )) + float2( 0,0 );
				float2 panner483_g43882 = ( mulTime806_g43882 * temp_cast_38 + rotator485_g43882);
				float2 temp_cast_39 = (temp_output_1185_0_g43882).xx;
				float cos481_g43882 = cos( _G_FlowSwirling.y );
				float sin481_g43882 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos481_g43882 , -sin481_g43882 , sin481_g43882 , cos481_g43882 )) + float2( 0,0 );
				float2 panner480_g43882 = ( mulTime806_g43882 * temp_cast_39 + rotator481_g43882);
				float2 temp_cast_40 = (temp_output_1185_0_g43882).xx;
				float2 panner478_g43882 = ( mulTime806_g43882 * temp_cast_40 + texCoord487_g43882);
				float4 OUT_SWIRLING298_g43882 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43882 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43882 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43882 ) ) );
				float4 m_Swirling278_g43882 = OUT_SWIRLING298_g43882;
				float2 texCoord196_g43884 = IN.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43884 = IN.ase_texcoord7;
				float2 blendOpSrc197_g43884 = texCoord196_g43884;
				float2 blendOpDest197_g43884 = (_FLOWMAP_Map89_g43884).xy;
				float2 temp_output_197_0_g43884 = ( saturate( (( blendOpDest197_g43884 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43884 ) * ( 1.0 - blendOpSrc197_g43884 ) ) : ( 2.0 * blendOpDest197_g43884 * blendOpSrc197_g43884 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43884 = _FoamShoreline_Speed;
				float temp_output_182_0_g43884 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43884 );
				float temp_output_194_0_g43884 = (0.0 + (( ( temp_output_182_0_g43884 - floor( ( temp_output_182_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43884 = _FoamShoreline_FlowStrength;
				float _TIME_UV_A199_g43884 = ( -temp_output_194_0_g43884 * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult198_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_A199_g43884);
				float2 texCoord205_g43884 = IN.ase_texcoord5.xyz.xy * temp_output_1196_0_g43882 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43884 = texCoord205_g43884;
				float2 FLOW_A201_g43884 = ( lerpResult198_g43884 + TEXTURE_TILLING211_g43884 );
				float temp_output_225_0_g43884 = (temp_output_182_0_g43884*1.0 + 0.5);
				float _TIME_UV_B214_g43884 = ( -(0.0 + (( ( temp_output_225_0_g43884 - floor( ( temp_output_225_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult229_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_B214_g43884);
				float2 FLOW_B232_g43884 = ( lerpResult229_g43884 + TEXTURE_TILLING211_g43884 );
				float TIME_BLEND235_g43884 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43884 / 0.5 ) ) ) );
				float4 lerpResult1153_g43882 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43884 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43884 ) , TIME_BLEND235_g43884);
				float4 OUT_FLOW_FLOWMAP1156_g43882 = lerpResult1153_g43882;
				float4 m_FlowMap278_g43882 = OUT_FLOW_FLOWMAP1156_g43882;
				float4 localfloat4switch278_g43882 = float4switch278_g43882( m_switch278_g43882 , m_Off278_g43882 , m_Swirling278_g43882 , m_FlowMap278_g43882 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos731_g43882 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord8.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43882 = temp_cast_46;
				float4 lerpResult769_g43882 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g43882 * _FoamShoreline_TintStrength ) * temp_cast_43 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g43882.z + temp_cast_44 ) - temp_cast_45 ) * temp_output_294_0_g43882 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * temp_output_294_0_g43882 ) ) ));
				float FlowStrength1182_g43882 = _FoamShoreline_FlowStrength;
				float4 lerpResult761_g43882 = lerp( float4( 0,0,0,0 ) , lerpResult769_g43882 , FlowStrength1182_g43882);
				float4 FOAM_SHORELINE654_g43868 = lerpResult761_g43882;
				float4 temp_output_1492_0_g43868 = ( ( ( lerpResult105_g43868 + FOAM_VERTICAL_OFFSHORE655_g43868 ) + FOAM_HORIZONTAL_OFFSHORE1565_g43868 ) + FOAM_SHORELINE654_g43868 );
				float4 ALBEDO_IN60_g43873 = temp_output_1492_0_g43868;
				float4 m_Off119_g43873 = ALBEDO_IN60_g43873;
				int REFLECTION_MODE_URP123_g43873 = _Reflection_ModeURP;
				int m_switch124_g43873 = REFLECTION_MODE_URP123_g43873;
				float4 m_Off124_g43873 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g43868 = weightedBlend1711_g43868;
				float3 temp_output_53_0_g43873 = NORMAL_OUT_Z505_g43868;
				float3 NORMAL_IN106_g43873 = temp_output_53_0_g43873;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g43873 = clamp( ( (( NORMAL_IN106_g43873 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g43873 = clampResult29_g43873;
				float4 appendResult103_g43873 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g43873.x));
				float3 unpack104_g43873 = UnpackNormalScale( appendResult103_g43873, 0.15 );
				unpack104_g43873.z = lerp( 1, unpack104_g43873.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g43873 = unpack104_g43873;
				float3 ase_worldTangent = IN.ase_texcoord9.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord10.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g43873 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN_Z54_g43873 ), dot( tanToWorld1, NORMAL_IN_Z54_g43873 ), dot( tanToWorld2, NORMAL_IN_Z54_g43873 ) ) );
				float REFLECTION_WOBBLE13_g43873 = _Reflection_Wobble;
				float4 texCUBENode31_g43873 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat_aniso2, ( float3( REFLECTION_BUMP9_g43873 ,  0.0 ) + worldRefl24_g43873 + REFLECTION_WOBBLE13_g43873 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g43873.r).xxxx;
				float REFLECTION_CLOUD12_g43873 = _Reflection_Cloud;
				float4 lerpResult49_g43873 = lerp( texCUBENode31_g43873 , temp_cast_52 , REFLECTION_CLOUD12_g43873);
				float4 m_ActiveCubeMap124_g43873 = lerpResult49_g43873;
				float3 temp_output_109_0_g43873 = SHADERGRAPH_REFLECTION_PROBE(ase_worldViewDir,float3( ( REFLECTION_BUMP9_g43873 + REFLECTION_WOBBLE13_g43873 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g43873.x).xxx;
				float3 lerpResult115_g43873 = lerp( temp_output_109_0_g43873 , temp_cast_55 , REFLECTION_CLOUD12_g43873);
				float4 appendResult127_g43873 = (float4(lerpResult115_g43873 , 0.0));
				float4 m_ActiveProbe124_g43873 = appendResult127_g43873;
				float4 localfloat4switch124_g43873 = float4switch124_g43873( m_switch124_g43873 , m_Off124_g43873 , m_ActiveCubeMap124_g43873 , m_ActiveProbe124_g43873 );
				float fresnelNdotV23_g43873 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g43873 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g43873 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g43873 = ( _Reflection_FresnelStrength * fresnelNode23_g43873 );
				float4 lerpResult73_g43873 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g43873 , REFLECTION_FRESNEL11_g43873);
				float4 lerpResult133_g43873 = lerp( localfloat4switch124_g43873 , lerpResult73_g43873 , _Reflection_FresnelMode);
				float4 switchResult85_g43873 = (((ase_vface>0)?(lerpResult133_g43873):(float4( 0,0,0,0 ))));
				float4 temp_cast_57 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g43873 = temp_cast_57;
				#else
				float4 staticSwitch95_g43873 = ( ( ( 1.0 - 0.5 ) * switchResult85_g43873 ) + ( ALBEDO_IN60_g43873 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g43873 = staticSwitch95_g43873;
				float4 m_ActiveProbe119_g43873 = staticSwitch95_g43873;
				float4 localfloat4switch119_g43873 = float4switch119_g43873( m_switch119_g43873 , m_Off119_g43873 , m_ActiveCubeMap119_g43873 , m_ActiveProbe119_g43873 );
				
				
				float3 Albedo = localfloat4switch119_g43873.rgb;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = IN.VizUV.xy;
				metaInput.LightCoord = IN.LightCoord;
			#endif
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ColorMask [_ColorMask]

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat_aniso2);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g43888( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g43875( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43869( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43897( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43882( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord3.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xyz = v.ase_texcoord.xyz;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch119_g43873 = _Reflection_ModeURP;
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g43868 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g43868 = abs( ( screenDepth2_g43868 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g43868 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g43868*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g43868 = lerp( _DepthTint , lerpResult25_g43868 , saturate( (distanceDepth2_g43868*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g43868 = lerpResult27_g43868;
				int m_switch238_g43888 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g43888 = float3(0,0,0.001);
				float mulTime155_g43888 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g43888 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g43888 = ( FlowSpeed365_g43888 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g43888).xx;
				float2 appendResult235_g43888 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g43888 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g43888 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g43888 = cos( _G_FlowSwirling.x );
				float sin62_g43888 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos62_g43888 , -sin62_g43888 , sin62_g43888 , cos62_g43888 )) + float2( 0,0 );
				float2 panner15_g43888 = ( mulTime155_g43888 * temp_cast_0 + rotator62_g43888);
				float2 temp_cast_1 = (temp_output_367_0_g43888).xx;
				float cos8_g43888 = cos( _G_FlowSwirling.y );
				float sin8_g43888 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos8_g43888 , -sin8_g43888 , sin8_g43888 , cos8_g43888 )) + float2( 0,0 );
				float2 panner16_g43888 = ( mulTime155_g43888 * temp_cast_1 + rotator8_g43888);
				float2 temp_cast_2 = (temp_output_367_0_g43888).xx;
				float2 panner17_g43888 = ( mulTime155_g43888 * temp_cast_2 + texCoord23_g43888);
				float2 layeredBlendVar666_g43888 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend666_g43888 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43888 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43888 ) , layeredBlendVar666_g43888.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43888 ) , layeredBlendVar666_g43888.y ) );
				float4 temp_output_1_0_g43892 = layeredBlend666_g43888;
				float temp_output_8_0_g43892 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g43892 = UnpackNormalScale( temp_output_1_0_g43892, temp_output_8_0_g43892 );
				unpack52_g43892.z = lerp( 1, unpack52_g43892.z, saturate(temp_output_8_0_g43892) );
				float3 temp_output_699_59_g43888 = unpack52_g43892;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 temp_output_372_0_g43888 = abs( ase_worldNormal );
				float3 break386_g43888 = ( temp_output_372_0_g43888 * temp_output_372_0_g43888 );
				float _MASK_VERTICAL_Z381_g43888 = ( break386_g43888.z + 0.01 );
				float3 lerpResult677_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float _MASK_VERTICAL_X373_g43888 = ( -break386_g43888.x + 0.2 );
				float3 lerpResult681_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float _MASK_VERTICAL_Y_NEG413_g43888 = ( ( ase_worldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult677_g43888 + lerpResult681_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_Swirling238_g43888 = lerpResult679_g43888;
				float2 texCoord196_g43890 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43890 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43890 = texCoord196_g43890;
				float2 blendOpDest197_g43890 = (_FLOWMAP_Map89_g43890).xy;
				float2 temp_output_197_0_g43890 = ( saturate( (( blendOpDest197_g43890 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43890 ) * ( 1.0 - blendOpSrc197_g43890 ) ) : ( 2.0 * blendOpDest197_g43890 * blendOpSrc197_g43890 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43890 = FlowSpeed365_g43888;
				float temp_output_182_0_g43890 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43890 );
				float temp_output_194_0_g43890 = (0.0 + (( ( temp_output_182_0_g43890 - floor( ( temp_output_182_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43890 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g43890 = ( -temp_output_194_0_g43890 * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult198_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_A199_g43890);
				float2 INPUT_MAP_TILLING128_g43888 = appendResult235_g43888;
				float2 texCoord205_g43890 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g43888 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43890 = texCoord205_g43890;
				float2 FLOW_A201_g43890 = ( lerpResult198_g43890 + TEXTURE_TILLING211_g43890 );
				float temp_output_225_0_g43890 = (temp_output_182_0_g43890*1.0 + 0.5);
				float _TIME_UV_B214_g43890 = ( -(0.0 + (( ( temp_output_225_0_g43890 - floor( ( temp_output_225_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult229_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_B214_g43890);
				float2 FLOW_B232_g43890 = ( lerpResult229_g43890 + TEXTURE_TILLING211_g43890 );
				float TIME_BLEND235_g43890 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43890 / 0.5 ) ) ) );
				float4 lerpResult317_g43888 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43890 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43890 ) , TIME_BLEND235_g43890);
				float4 temp_output_1_0_g43889 = lerpResult317_g43888;
				float NormalStrength152_g43888 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g43889 = NormalStrength152_g43888;
				float3 unpack52_g43889 = UnpackNormalScale( temp_output_1_0_g43889, temp_output_8_0_g43889 );
				unpack52_g43889.z = lerp( 1, unpack52_g43889.z, saturate(temp_output_8_0_g43889) );
				float3 temp_output_701_59_g43888 = unpack52_g43889;
				float3 lerpResult692_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float3 lerpResult691_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float3 lerpResult697_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult692_g43888 + lerpResult691_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_FlowMap238_g43888 = lerpResult697_g43888;
				float3 localfloat3switch238_g43888 = float3switch238_g43888( m_switch238_g43888 , m_Off238_g43888 , m_Swirling238_g43888 , m_FlowMap238_g43888 );
				int m_switch456_g43875 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g43875 = float3(0,0,0.001);
				float mulTime155_g43875 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g43875 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g43875 = ( FlowSpeed365_g43875 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g43875).xx;
				float2 appendResult235_g43875 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g43875 = IN.ase_texcoord3.xyz.xy * ( appendResult235_g43875 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g43875 = cos( _G_FlowSwirling.x );
				float sin62_g43875 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos62_g43875 , -sin62_g43875 , sin62_g43875 , cos62_g43875 )) + float2( 0,0 );
				float2 panner15_g43875 = ( mulTime155_g43875 * temp_cast_5 + rotator62_g43875);
				float2 temp_cast_6 = (temp_output_367_0_g43875).xx;
				float cos8_g43875 = cos( _G_FlowSwirling.y );
				float sin8_g43875 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos8_g43875 , -sin8_g43875 , sin8_g43875 , cos8_g43875 )) + float2( 0,0 );
				float2 panner16_g43875 = ( mulTime155_g43875 * temp_cast_6 + rotator8_g43875);
				float2 temp_cast_7 = (temp_output_367_0_g43875).xx;
				float2 panner17_g43875 = ( mulTime155_g43875 * temp_cast_7 + texCoord23_g43875);
				float2 layeredBlendVar448_g43875 = IN.ase_texcoord3.xyz.xy;
				float4 layeredBlend448_g43875 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43875 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43875 ) , layeredBlendVar448_g43875.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43875 ) , layeredBlendVar448_g43875.y ) );
				float4 temp_output_1_0_g43879 = layeredBlend448_g43875;
				float temp_output_8_0_g43879 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g43879 = UnpackNormalScale( temp_output_1_0_g43879, temp_output_8_0_g43879 );
				unpack52_g43879.z = lerp( 1, unpack52_g43879.z, saturate(temp_output_8_0_g43879) );
				float3 temp_output_481_59_g43875 = unpack52_g43879;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g43875 = ( abs( ase_worldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g43875 = ( break386_g43875.z + 0.75 );
				float3 lerpResult465_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float _MASK_VERTICAL_X373_g43875 = ( break386_g43875.x + 0.45 );
				float3 lerpResult457_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float _MASK_VERTICAL_Y383_g43875 = ( -break386_g43875.y + 5.0 );
				float3 lerpResult454_g43875 = lerp( lerpResult465_g43875 , ( lerpResult465_g43875 + lerpResult457_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float _MASK_VERTICAL_Y_NEG413_g43875 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.0 );
				float3 lerpResult477_g43875 = lerp( float3( 0,0,0 ) , lerpResult454_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_Swirling456_g43875 = lerpResult477_g43875;
				float2 texCoord196_g43876 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43876 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43876 = texCoord196_g43876;
				float2 blendOpDest197_g43876 = (_FLOWMAP_Map89_g43876).xy;
				float2 temp_output_197_0_g43876 = ( saturate( (( blendOpDest197_g43876 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43876 ) * ( 1.0 - blendOpSrc197_g43876 ) ) : ( 2.0 * blendOpDest197_g43876 * blendOpSrc197_g43876 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43876 = FlowSpeed365_g43875;
				float temp_output_182_0_g43876 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43876 );
				float temp_output_194_0_g43876 = (0.0 + (( ( temp_output_182_0_g43876 - floor( ( temp_output_182_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43876 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g43876 = ( -temp_output_194_0_g43876 * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult198_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_A199_g43876);
				float2 INPUT_MAP_TILLING128_g43875 = appendResult235_g43875;
				float2 texCoord205_g43876 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g43875 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43876 = texCoord205_g43876;
				float2 FLOW_A201_g43876 = ( lerpResult198_g43876 + TEXTURE_TILLING211_g43876 );
				float temp_output_225_0_g43876 = (temp_output_182_0_g43876*1.0 + 0.5);
				float _TIME_UV_B214_g43876 = ( -(0.0 + (( ( temp_output_225_0_g43876 - floor( ( temp_output_225_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult229_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_B214_g43876);
				float2 FLOW_B232_g43876 = ( lerpResult229_g43876 + TEXTURE_TILLING211_g43876 );
				float TIME_BLEND235_g43876 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43876 / 0.5 ) ) ) );
				float4 lerpResult317_g43875 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43876 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43876 ) , TIME_BLEND235_g43876);
				float4 temp_output_1_0_g43878 = lerpResult317_g43875;
				float NormalStrength152_g43875 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g43878 = NormalStrength152_g43875;
				float3 unpack52_g43878 = UnpackNormalScale( temp_output_1_0_g43878, temp_output_8_0_g43878 );
				unpack52_g43878.z = lerp( 1, unpack52_g43878.z, saturate(temp_output_8_0_g43878) );
				float3 temp_output_483_59_g43875 = unpack52_g43878;
				float3 lerpResult466_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float3 lerpResult453_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float3 lerpResult460_g43875 = lerp( lerpResult466_g43875 , ( lerpResult466_g43875 + lerpResult453_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float3 lerpResult411_g43875 = lerp( float3( 0,0,0 ) , lerpResult460_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_FlowMap456_g43875 = lerpResult411_g43875;
				float3 localfloat3switch456_g43875 = float3switch456_g43875( m_switch456_g43875 , m_Off456_g43875 , m_Swirling456_g43875 , m_FlowMap456_g43875 );
				float2 weightedBlendVar1711_g43868 = IN.ase_texcoord3.xyz.xy;
				float3 weightedBlend1711_g43868 = ( weightedBlendVar1711_g43868.x*localfloat3switch238_g43888 + weightedBlendVar1711_g43868.y*localfloat3switch456_g43875 );
				float3 NORMAL_IN84_g43894 = ( weightedBlend1711_g43868 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g43894 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord3.w;
				float eyeDepth7_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g43894 = ( (NORMAL_IN84_g43894).xy * ( REFACTED_SCALE_FLOAT78_g43894 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g43894 - eyeDepth ) ) );
				float eyeDepth27_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g43894, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g43894 = (( float4( ( temp_output_21_0_g43894 * saturate( ( eyeDepth27_g43894 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g43894 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g43894 ), 1.0 );
				float4 REFRACTED_DEPTH144_g43868 = fetchOpaqueVal89_g43894;
				float temp_output_20_0_g43868 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g43868 = 0.0;
				#else
				float staticSwitch37_g43868 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g43868*-5.0 + 1.0) ) ) ) * temp_output_20_0_g43868 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g43868 = staticSwitch37_g43868;
				float4 lerpResult105_g43868 = lerp( COLOR_TINT161_g43868 , REFRACTED_DEPTH144_g43868 , DEPTH_TINT_ALPHA93_g43868);
				float4 _MaskVector1 = float4(0.001,0.001,0.001,0);
				int m_switch278_g43869 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g43869 = float4( 0,0,0,0 );
				float mulTime806_g43869 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g43869 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g43869 = ( FlowSpeed1146_g43869 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g43869).xx;
				float2 appendResult219_g43869 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g43869 = ( appendResult219_g43869 * float2( 2,2 ) );
				float2 texCoord487_g43869 = IN.ase_texcoord3.xyz.xy * temp_output_1294_0_g43869 + float2( 0,0 );
				float cos485_g43869 = cos( _G_FlowSwirling.x );
				float sin485_g43869 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos485_g43869 , -sin485_g43869 , sin485_g43869 , cos485_g43869 )) + float2( 0,0 );
				float2 panner483_g43869 = ( mulTime806_g43869 * temp_cast_14 + rotator485_g43869);
				float2 temp_cast_15 = (temp_output_1150_0_g43869).xx;
				float cos481_g43869 = cos( _G_FlowSwirling.y );
				float sin481_g43869 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos481_g43869 , -sin481_g43869 , sin481_g43869 , cos481_g43869 )) + float2( 0,0 );
				float2 panner480_g43869 = ( mulTime806_g43869 * temp_cast_15 + rotator481_g43869);
				float2 temp_cast_16 = (temp_output_1150_0_g43869).xx;
				float2 panner478_g43869 = ( mulTime806_g43869 * temp_cast_16 + texCoord487_g43869);
				float4 OUT_SWIRLING298_g43869 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43869 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43869 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43869 ) ) );
				float4 m_Swirling278_g43869 = OUT_SWIRLING298_g43869;
				float2 texCoord196_g43872 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43872 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43872 = texCoord196_g43872;
				float2 blendOpDest197_g43872 = (_FLOWMAP_Map89_g43872).xy;
				float2 temp_output_197_0_g43872 = ( saturate( (( blendOpDest197_g43872 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43872 ) * ( 1.0 - blendOpSrc197_g43872 ) ) : ( 2.0 * blendOpDest197_g43872 * blendOpSrc197_g43872 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43872 = FlowSpeed1146_g43869;
				float temp_output_182_0_g43872 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43872 );
				float temp_output_194_0_g43872 = (0.0 + (( ( temp_output_182_0_g43872 - floor( ( temp_output_182_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43869 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43872 = FlowStrength1147_g43869;
				float _TIME_UV_A199_g43872 = ( -temp_output_194_0_g43872 * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult198_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_A199_g43872);
				float2 INPUT_MAP_TILLING128_g43869 = temp_output_1294_0_g43869;
				float2 texCoord205_g43872 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g43869 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43872 = texCoord205_g43872;
				float2 FLOW_A201_g43872 = ( lerpResult198_g43872 + TEXTURE_TILLING211_g43872 );
				float temp_output_225_0_g43872 = (temp_output_182_0_g43872*1.0 + 0.5);
				float _TIME_UV_B214_g43872 = ( -(0.0 + (( ( temp_output_225_0_g43872 - floor( ( temp_output_225_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult229_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_B214_g43872);
				float2 FLOW_B232_g43872 = ( lerpResult229_g43872 + TEXTURE_TILLING211_g43872 );
				float TIME_BLEND235_g43872 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43872 / 0.5 ) ) ) );
				float4 lerpResult1117_g43869 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43872 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43872 ) , TIME_BLEND235_g43872);
				float4 OUT_FLOW_FLOWMAP1119_g43869 = lerpResult1117_g43869;
				float4 m_FlowMap278_g43869 = OUT_FLOW_FLOWMAP1119_g43869;
				float4 localfloat4switch278_g43869 = float4switch278_g43869( m_switch278_g43869 , m_Off278_g43869 , m_Swirling278_g43869 , m_FlowMap278_g43869 );
				float clampDepth2_g43881 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g43881 = clampDepth2_g43881;
				float4 localCalculateObliqueFrustumCorrection3_g43896 = CalculateObliqueFrustumCorrection();
				float dotResult4_g43896 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g43896 );
				float correctionFactor1_g43881 = dotResult4_g43896;
				float localCorrectedLinearEyeDepth1_g43881 = CorrectedLinearEyeDepth( z1_g43881 , correctionFactor1_g43881 );
				float eyeDepth18_g43881 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g43881 = ( eyeDepth18_g43881 - screenPos.w );
				float temp_output_13_0_g43881 = ( localCorrectedLinearEyeDepth1_g43881 - abs( temp_output_17_0_g43881 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g43868 = saturate( temp_output_13_0_g43881 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43869 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g43868 = localCorrectedLinearEyeDepth1_g43881;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g43868 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43869 = temp_cast_23;
				float4 lerpResult281_g43869 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43869 * _FOAMVERTICAL_TintStrength ) * temp_cast_20 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43869.z + temp_cast_21 ) - temp_cast_22 ) * temp_output_294_0_g43869 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * temp_output_294_0_g43869 ) ) ));
				float4 lerpResult265_g43869 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43869 , FlowStrength1147_g43869);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g43869 = ( abs( ase_worldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g43869 = ( break1161_g43869.z + 0.45 );
				float4 lerpResult1173_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_Z1162_g43869);
				float _MASK_VERTICAL_X1170_g43869 = ( break1161_g43869.x + 0.46 );
				float4 lerpResult1176_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_X1170_g43869);
				float _MASK_VERTICAL_Y1163_g43869 = ( -break1161_g43869.y + 6.5 );
				float4 lerpResult1179_g43869 = lerp( lerpResult1173_g43869 , ( lerpResult1173_g43869 + lerpResult1176_g43869 ) , _MASK_VERTICAL_Y1163_g43869);
				float4 temp_output_1189_0_g43869 = saturate( lerpResult1179_g43869 );
				float4 FOAM_VERTICAL_OFFSHORE655_g43868 = temp_output_1189_0_g43869;
				int m_switch278_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g43897 = float4( 0,0,0,0 );
				float mulTime806_g43897 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g43897 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g43897 = ( Speed1146_g43897 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g43897).xx;
				float2 appendResult219_g43897 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g43897 = ( appendResult219_g43897 * float2( 2,2 ) );
				float2 texCoord487_g43897 = IN.ase_texcoord3.xyz.xy * temp_output_1214_0_g43897 + float2( 0,0 );
				float cos485_g43897 = cos( _G_FlowSwirling.x );
				float sin485_g43897 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos485_g43897 , -sin485_g43897 , sin485_g43897 , cos485_g43897 )) + float2( 0,0 );
				float2 panner483_g43897 = ( mulTime806_g43897 * temp_cast_27 + rotator485_g43897);
				float2 temp_cast_28 = (temp_output_1150_0_g43897).xx;
				float cos481_g43897 = cos( _G_FlowSwirling.y );
				float sin481_g43897 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos481_g43897 , -sin481_g43897 , sin481_g43897 , cos481_g43897 )) + float2( 0,0 );
				float2 panner480_g43897 = ( mulTime806_g43897 * temp_cast_28 + rotator481_g43897);
				float2 temp_cast_29 = (temp_output_1150_0_g43897).xx;
				float2 panner478_g43897 = ( mulTime806_g43897 * temp_cast_29 + texCoord487_g43897);
				float4 OUT_SWIRLING298_g43897 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43897 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43897 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43897 ) ) );
				float4 m_Swirling278_g43897 = OUT_SWIRLING298_g43897;
				float2 texCoord196_g43898 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43898 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43898 = texCoord196_g43898;
				float2 blendOpDest197_g43898 = (_FLOWMAP_Map89_g43898).xy;
				float2 temp_output_197_0_g43898 = ( saturate( (( blendOpDest197_g43898 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43898 ) * ( 1.0 - blendOpSrc197_g43898 ) ) : ( 2.0 * blendOpDest197_g43898 * blendOpSrc197_g43898 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43898 = Speed1146_g43897;
				float temp_output_182_0_g43898 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43898 );
				float temp_output_194_0_g43898 = (0.0 + (( ( temp_output_182_0_g43898 - floor( ( temp_output_182_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43897 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43898 = FlowStrength1147_g43897;
				float _TIME_UV_A199_g43898 = ( -temp_output_194_0_g43898 * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult198_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_A199_g43898);
				float2 INPUT_MAP_TILLING128_g43897 = temp_output_1214_0_g43897;
				float2 texCoord205_g43898 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g43897 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43898 = texCoord205_g43898;
				float2 FLOW_A201_g43898 = ( lerpResult198_g43898 + TEXTURE_TILLING211_g43898 );
				float temp_output_225_0_g43898 = (temp_output_182_0_g43898*1.0 + 0.5);
				float _TIME_UV_B214_g43898 = ( -(0.0 + (( ( temp_output_225_0_g43898 - floor( ( temp_output_225_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult229_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_B214_g43898);
				float2 FLOW_B232_g43898 = ( lerpResult229_g43898 + TEXTURE_TILLING211_g43898 );
				float TIME_BLEND235_g43898 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43898 / 0.5 ) ) ) );
				float4 lerpResult1117_g43897 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43898 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43898 ) , TIME_BLEND235_g43898);
				float4 OUT_FLOW_FLOWMAP1119_g43897 = lerpResult1117_g43897;
				float4 m_FlowMap278_g43897 = OUT_FLOW_FLOWMAP1119_g43897;
				float4 localfloat4switch278_g43897 = float4switch278_g43897( m_switch278_g43897 , m_Off278_g43897 , m_Swirling278_g43897 , m_FlowMap278_g43897 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43897 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43897 = temp_cast_35;
				float4 lerpResult281_g43897 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43897 * _FOAMHORIZONTAL_TintStrength ) * temp_cast_32 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43897.z + temp_cast_33 ) - temp_cast_34 ) * temp_output_294_0_g43897 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * temp_output_294_0_g43897 ) ) ));
				float4 lerpResult265_g43897 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43897 , FlowStrength1147_g43897);
				float _MASK_HORIZONTAL1160_g43897 = ( ( ase_worldNormal.y + ase_worldNormal.y ) - 1.7 );
				float4 lerpResult1185_g43897 = lerp( float4(0.001,0.001,0.001,0) , lerpResult265_g43897 , _MASK_HORIZONTAL1160_g43897);
				float4 temp_output_1188_0_g43897 = saturate( lerpResult1185_g43897 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g43868 = temp_output_1188_0_g43897;
				int m_switch278_g43882 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g43882 = float4( 0,0,0,0 );
				float mulTime806_g43882 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g43882 = _FoamShoreline_Speed;
				float temp_output_1185_0_g43882 = ( FlowSpeed1179_g43882 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g43882).xx;
				float2 appendResult219_g43882 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g43882 = ( appendResult219_g43882 * float2( 2,2 ) );
				float2 INPUT_MAP_TILLING128_g43882 = temp_output_1196_0_g43882;
				float2 texCoord487_g43882 = IN.ase_texcoord3.xyz.xy * INPUT_MAP_TILLING128_g43882 + float2( 0,0 );
				float cos485_g43882 = cos( _G_FlowSwirling.x );
				float sin485_g43882 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos485_g43882 , -sin485_g43882 , sin485_g43882 , cos485_g43882 )) + float2( 0,0 );
				float2 panner483_g43882 = ( mulTime806_g43882 * temp_cast_38 + rotator485_g43882);
				float2 temp_cast_39 = (temp_output_1185_0_g43882).xx;
				float cos481_g43882 = cos( _G_FlowSwirling.y );
				float sin481_g43882 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos481_g43882 , -sin481_g43882 , sin481_g43882 , cos481_g43882 )) + float2( 0,0 );
				float2 panner480_g43882 = ( mulTime806_g43882 * temp_cast_39 + rotator481_g43882);
				float2 temp_cast_40 = (temp_output_1185_0_g43882).xx;
				float2 panner478_g43882 = ( mulTime806_g43882 * temp_cast_40 + texCoord487_g43882);
				float4 OUT_SWIRLING298_g43882 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43882 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43882 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43882 ) ) );
				float4 m_Swirling278_g43882 = OUT_SWIRLING298_g43882;
				float2 texCoord196_g43884 = IN.ase_texcoord3.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43884 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43884 = texCoord196_g43884;
				float2 blendOpDest197_g43884 = (_FLOWMAP_Map89_g43884).xy;
				float2 temp_output_197_0_g43884 = ( saturate( (( blendOpDest197_g43884 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43884 ) * ( 1.0 - blendOpSrc197_g43884 ) ) : ( 2.0 * blendOpDest197_g43884 * blendOpSrc197_g43884 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43884 = _FoamShoreline_Speed;
				float temp_output_182_0_g43884 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43884 );
				float temp_output_194_0_g43884 = (0.0 + (( ( temp_output_182_0_g43884 - floor( ( temp_output_182_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43884 = _FoamShoreline_FlowStrength;
				float _TIME_UV_A199_g43884 = ( -temp_output_194_0_g43884 * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult198_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_A199_g43884);
				float2 texCoord205_g43884 = IN.ase_texcoord3.xyz.xy * temp_output_1196_0_g43882 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43884 = texCoord205_g43884;
				float2 FLOW_A201_g43884 = ( lerpResult198_g43884 + TEXTURE_TILLING211_g43884 );
				float temp_output_225_0_g43884 = (temp_output_182_0_g43884*1.0 + 0.5);
				float _TIME_UV_B214_g43884 = ( -(0.0 + (( ( temp_output_225_0_g43884 - floor( ( temp_output_225_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult229_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_B214_g43884);
				float2 FLOW_B232_g43884 = ( lerpResult229_g43884 + TEXTURE_TILLING211_g43884 );
				float TIME_BLEND235_g43884 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43884 / 0.5 ) ) ) );
				float4 lerpResult1153_g43882 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43884 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43884 ) , TIME_BLEND235_g43884);
				float4 OUT_FLOW_FLOWMAP1156_g43882 = lerpResult1153_g43882;
				float4 m_FlowMap278_g43882 = OUT_FLOW_FLOWMAP1156_g43882;
				float4 localfloat4switch278_g43882 = float4switch278_g43882( m_switch278_g43882 , m_Off278_g43882 , m_Swirling278_g43882 , m_FlowMap278_g43882 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos731_g43882 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43882 = temp_cast_46;
				float4 lerpResult769_g43882 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g43882 * _FoamShoreline_TintStrength ) * temp_cast_43 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g43882.z + temp_cast_44 ) - temp_cast_45 ) * temp_output_294_0_g43882 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * temp_output_294_0_g43882 ) ) ));
				float FlowStrength1182_g43882 = _FoamShoreline_FlowStrength;
				float4 lerpResult761_g43882 = lerp( float4( 0,0,0,0 ) , lerpResult769_g43882 , FlowStrength1182_g43882);
				float4 FOAM_SHORELINE654_g43868 = lerpResult761_g43882;
				float4 temp_output_1492_0_g43868 = ( ( ( lerpResult105_g43868 + FOAM_VERTICAL_OFFSHORE655_g43868 ) + FOAM_HORIZONTAL_OFFSHORE1565_g43868 ) + FOAM_SHORELINE654_g43868 );
				float4 ALBEDO_IN60_g43873 = temp_output_1492_0_g43868;
				float4 m_Off119_g43873 = ALBEDO_IN60_g43873;
				int REFLECTION_MODE_URP123_g43873 = _Reflection_ModeURP;
				int m_switch124_g43873 = REFLECTION_MODE_URP123_g43873;
				float4 m_Off124_g43873 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g43868 = weightedBlend1711_g43868;
				float3 temp_output_53_0_g43873 = NORMAL_OUT_Z505_g43868;
				float3 NORMAL_IN106_g43873 = temp_output_53_0_g43873;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g43873 = clamp( ( (( NORMAL_IN106_g43873 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g43873 = clampResult29_g43873;
				float4 appendResult103_g43873 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g43873.x));
				float3 unpack104_g43873 = UnpackNormalScale( appendResult103_g43873, 0.15 );
				unpack104_g43873.z = lerp( 1, unpack104_g43873.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g43873 = unpack104_g43873;
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g43873 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN_Z54_g43873 ), dot( tanToWorld1, NORMAL_IN_Z54_g43873 ), dot( tanToWorld2, NORMAL_IN_Z54_g43873 ) ) );
				float REFLECTION_WOBBLE13_g43873 = _Reflection_Wobble;
				float4 texCUBENode31_g43873 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat_aniso2, ( float3( REFLECTION_BUMP9_g43873 ,  0.0 ) + worldRefl24_g43873 + REFLECTION_WOBBLE13_g43873 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g43873.r).xxxx;
				float REFLECTION_CLOUD12_g43873 = _Reflection_Cloud;
				float4 lerpResult49_g43873 = lerp( texCUBENode31_g43873 , temp_cast_52 , REFLECTION_CLOUD12_g43873);
				float4 m_ActiveCubeMap124_g43873 = lerpResult49_g43873;
				float3 temp_output_109_0_g43873 = SHADERGRAPH_REFLECTION_PROBE(ase_worldViewDir,float3( ( REFLECTION_BUMP9_g43873 + REFLECTION_WOBBLE13_g43873 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g43873.x).xxx;
				float3 lerpResult115_g43873 = lerp( temp_output_109_0_g43873 , temp_cast_55 , REFLECTION_CLOUD12_g43873);
				float4 appendResult127_g43873 = (float4(lerpResult115_g43873 , 0.0));
				float4 m_ActiveProbe124_g43873 = appendResult127_g43873;
				float4 localfloat4switch124_g43873 = float4switch124_g43873( m_switch124_g43873 , m_Off124_g43873 , m_ActiveCubeMap124_g43873 , m_ActiveProbe124_g43873 );
				float fresnelNdotV23_g43873 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g43873 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g43873 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g43873 = ( _Reflection_FresnelStrength * fresnelNode23_g43873 );
				float4 lerpResult73_g43873 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g43873 , REFLECTION_FRESNEL11_g43873);
				float4 lerpResult133_g43873 = lerp( localfloat4switch124_g43873 , lerpResult73_g43873 , _Reflection_FresnelMode);
				float4 switchResult85_g43873 = (((ase_vface>0)?(lerpResult133_g43873):(float4( 0,0,0,0 ))));
				float4 temp_cast_57 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g43873 = temp_cast_57;
				#else
				float4 staticSwitch95_g43873 = ( ( ( 1.0 - 0.5 ) * switchResult85_g43873 ) + ( ALBEDO_IN60_g43873 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g43873 = staticSwitch95_g43873;
				float4 m_ActiveProbe119_g43873 = staticSwitch95_g43873;
				float4 localfloat4switch119_g43873 = float4switch119_g43873( m_switch119_g43873 , m_Off119_g43873 , m_ActiveCubeMap119_g43873 , m_ActiveProbe119_g43873 );
				
				
				float3 Albedo = localfloat4switch119_g43873.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
            ZTest LEqual
            ZWrite On

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float3 worldNormal : TEXCOORD2;
				float4 worldTangent : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat_aniso2);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g43888( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g43875( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43869( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g43869( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43897( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch1230_g43897( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43882( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch1223_g43882( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsSpecularMask( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				#endif
				return Color;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xyz = v.ase_texcoord.xyz;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch238_g43888 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g43888 = float3(0,0,0.001);
				float mulTime155_g43888 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g43888 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g43888 = ( FlowSpeed365_g43888 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g43888).xx;
				float2 appendResult235_g43888 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g43888 = IN.ase_texcoord4.xyz.xy * ( appendResult235_g43888 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g43888 = cos( _G_FlowSwirling.x );
				float sin62_g43888 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos62_g43888 , -sin62_g43888 , sin62_g43888 , cos62_g43888 )) + float2( 0,0 );
				float2 panner15_g43888 = ( mulTime155_g43888 * temp_cast_0 + rotator62_g43888);
				float2 temp_cast_1 = (temp_output_367_0_g43888).xx;
				float cos8_g43888 = cos( _G_FlowSwirling.y );
				float sin8_g43888 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos8_g43888 , -sin8_g43888 , sin8_g43888 , cos8_g43888 )) + float2( 0,0 );
				float2 panner16_g43888 = ( mulTime155_g43888 * temp_cast_1 + rotator8_g43888);
				float2 temp_cast_2 = (temp_output_367_0_g43888).xx;
				float2 panner17_g43888 = ( mulTime155_g43888 * temp_cast_2 + texCoord23_g43888);
				float2 layeredBlendVar666_g43888 = IN.ase_texcoord4.xyz.xy;
				float4 layeredBlend666_g43888 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43888 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43888 ) , layeredBlendVar666_g43888.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43888 ) , layeredBlendVar666_g43888.y ) );
				float4 temp_output_1_0_g43892 = layeredBlend666_g43888;
				float temp_output_8_0_g43892 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g43892 = UnpackNormalScale( temp_output_1_0_g43892, temp_output_8_0_g43892 );
				unpack52_g43892.z = lerp( 1, unpack52_g43892.z, saturate(temp_output_8_0_g43892) );
				float3 temp_output_699_59_g43888 = unpack52_g43892;
				float3 temp_output_372_0_g43888 = abs( WorldNormal );
				float3 break386_g43888 = ( temp_output_372_0_g43888 * temp_output_372_0_g43888 );
				float _MASK_VERTICAL_Z381_g43888 = ( break386_g43888.z + 0.01 );
				float3 lerpResult677_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float _MASK_VERTICAL_X373_g43888 = ( -break386_g43888.x + 0.2 );
				float3 lerpResult681_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float _MASK_VERTICAL_Y_NEG413_g43888 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult677_g43888 + lerpResult681_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_Swirling238_g43888 = lerpResult679_g43888;
				float2 texCoord196_g43890 = IN.ase_texcoord4.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43890 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43890 = texCoord196_g43890;
				float2 blendOpDest197_g43890 = (_FLOWMAP_Map89_g43890).xy;
				float2 temp_output_197_0_g43890 = ( saturate( (( blendOpDest197_g43890 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43890 ) * ( 1.0 - blendOpSrc197_g43890 ) ) : ( 2.0 * blendOpDest197_g43890 * blendOpSrc197_g43890 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43890 = FlowSpeed365_g43888;
				float temp_output_182_0_g43890 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43890 );
				float temp_output_194_0_g43890 = (0.0 + (( ( temp_output_182_0_g43890 - floor( ( temp_output_182_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43890 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g43890 = ( -temp_output_194_0_g43890 * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult198_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_A199_g43890);
				float2 INPUT_MAP_TILLING128_g43888 = appendResult235_g43888;
				float2 texCoord205_g43890 = IN.ase_texcoord4.xyz.xy * INPUT_MAP_TILLING128_g43888 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43890 = texCoord205_g43890;
				float2 FLOW_A201_g43890 = ( lerpResult198_g43890 + TEXTURE_TILLING211_g43890 );
				float temp_output_225_0_g43890 = (temp_output_182_0_g43890*1.0 + 0.5);
				float _TIME_UV_B214_g43890 = ( -(0.0 + (( ( temp_output_225_0_g43890 - floor( ( temp_output_225_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult229_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_B214_g43890);
				float2 FLOW_B232_g43890 = ( lerpResult229_g43890 + TEXTURE_TILLING211_g43890 );
				float TIME_BLEND235_g43890 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43890 / 0.5 ) ) ) );
				float4 lerpResult317_g43888 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43890 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43890 ) , TIME_BLEND235_g43890);
				float4 temp_output_1_0_g43889 = lerpResult317_g43888;
				float NormalStrength152_g43888 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g43889 = NormalStrength152_g43888;
				float3 unpack52_g43889 = UnpackNormalScale( temp_output_1_0_g43889, temp_output_8_0_g43889 );
				unpack52_g43889.z = lerp( 1, unpack52_g43889.z, saturate(temp_output_8_0_g43889) );
				float3 temp_output_701_59_g43888 = unpack52_g43889;
				float3 lerpResult692_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float3 lerpResult691_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float3 lerpResult697_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult692_g43888 + lerpResult691_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_FlowMap238_g43888 = lerpResult697_g43888;
				float3 localfloat3switch238_g43888 = float3switch238_g43888( m_switch238_g43888 , m_Off238_g43888 , m_Swirling238_g43888 , m_FlowMap238_g43888 );
				int m_switch456_g43875 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g43875 = float3(0,0,0.001);
				float mulTime155_g43875 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g43875 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g43875 = ( FlowSpeed365_g43875 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g43875).xx;
				float2 appendResult235_g43875 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g43875 = IN.ase_texcoord4.xyz.xy * ( appendResult235_g43875 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g43875 = cos( _G_FlowSwirling.x );
				float sin62_g43875 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos62_g43875 , -sin62_g43875 , sin62_g43875 , cos62_g43875 )) + float2( 0,0 );
				float2 panner15_g43875 = ( mulTime155_g43875 * temp_cast_5 + rotator62_g43875);
				float2 temp_cast_6 = (temp_output_367_0_g43875).xx;
				float cos8_g43875 = cos( _G_FlowSwirling.y );
				float sin8_g43875 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos8_g43875 , -sin8_g43875 , sin8_g43875 , cos8_g43875 )) + float2( 0,0 );
				float2 panner16_g43875 = ( mulTime155_g43875 * temp_cast_6 + rotator8_g43875);
				float2 temp_cast_7 = (temp_output_367_0_g43875).xx;
				float2 panner17_g43875 = ( mulTime155_g43875 * temp_cast_7 + texCoord23_g43875);
				float2 layeredBlendVar448_g43875 = IN.ase_texcoord4.xyz.xy;
				float4 layeredBlend448_g43875 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43875 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43875 ) , layeredBlendVar448_g43875.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43875 ) , layeredBlendVar448_g43875.y ) );
				float4 temp_output_1_0_g43879 = layeredBlend448_g43875;
				float temp_output_8_0_g43879 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g43879 = UnpackNormalScale( temp_output_1_0_g43879, temp_output_8_0_g43879 );
				unpack52_g43879.z = lerp( 1, unpack52_g43879.z, saturate(temp_output_8_0_g43879) );
				float3 temp_output_481_59_g43875 = unpack52_g43879;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g43875 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g43875 = ( break386_g43875.z + 0.75 );
				float3 lerpResult465_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float _MASK_VERTICAL_X373_g43875 = ( break386_g43875.x + 0.45 );
				float3 lerpResult457_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float _MASK_VERTICAL_Y383_g43875 = ( -break386_g43875.y + 5.0 );
				float3 lerpResult454_g43875 = lerp( lerpResult465_g43875 , ( lerpResult465_g43875 + lerpResult457_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float _MASK_VERTICAL_Y_NEG413_g43875 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g43875 = lerp( float3( 0,0,0 ) , lerpResult454_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_Swirling456_g43875 = lerpResult477_g43875;
				float2 texCoord196_g43876 = IN.ase_texcoord4.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43876 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43876 = texCoord196_g43876;
				float2 blendOpDest197_g43876 = (_FLOWMAP_Map89_g43876).xy;
				float2 temp_output_197_0_g43876 = ( saturate( (( blendOpDest197_g43876 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43876 ) * ( 1.0 - blendOpSrc197_g43876 ) ) : ( 2.0 * blendOpDest197_g43876 * blendOpSrc197_g43876 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43876 = FlowSpeed365_g43875;
				float temp_output_182_0_g43876 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43876 );
				float temp_output_194_0_g43876 = (0.0 + (( ( temp_output_182_0_g43876 - floor( ( temp_output_182_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43876 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g43876 = ( -temp_output_194_0_g43876 * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult198_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_A199_g43876);
				float2 INPUT_MAP_TILLING128_g43875 = appendResult235_g43875;
				float2 texCoord205_g43876 = IN.ase_texcoord4.xyz.xy * INPUT_MAP_TILLING128_g43875 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43876 = texCoord205_g43876;
				float2 FLOW_A201_g43876 = ( lerpResult198_g43876 + TEXTURE_TILLING211_g43876 );
				float temp_output_225_0_g43876 = (temp_output_182_0_g43876*1.0 + 0.5);
				float _TIME_UV_B214_g43876 = ( -(0.0 + (( ( temp_output_225_0_g43876 - floor( ( temp_output_225_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult229_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_B214_g43876);
				float2 FLOW_B232_g43876 = ( lerpResult229_g43876 + TEXTURE_TILLING211_g43876 );
				float TIME_BLEND235_g43876 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43876 / 0.5 ) ) ) );
				float4 lerpResult317_g43875 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43876 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43876 ) , TIME_BLEND235_g43876);
				float4 temp_output_1_0_g43878 = lerpResult317_g43875;
				float NormalStrength152_g43875 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g43878 = NormalStrength152_g43875;
				float3 unpack52_g43878 = UnpackNormalScale( temp_output_1_0_g43878, temp_output_8_0_g43878 );
				unpack52_g43878.z = lerp( 1, unpack52_g43878.z, saturate(temp_output_8_0_g43878) );
				float3 temp_output_483_59_g43875 = unpack52_g43878;
				float3 lerpResult466_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float3 lerpResult453_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float3 lerpResult460_g43875 = lerp( lerpResult466_g43875 , ( lerpResult466_g43875 + lerpResult453_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float3 lerpResult411_g43875 = lerp( float3( 0,0,0 ) , lerpResult460_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_FlowMap456_g43875 = lerpResult411_g43875;
				float3 localfloat3switch456_g43875 = float3switch456_g43875( m_switch456_g43875 , m_Off456_g43875 , m_Swirling456_g43875 , m_FlowMap456_g43875 );
				float2 weightedBlendVar1711_g43868 = IN.ase_texcoord4.xyz.xy;
				float3 weightedBlend1711_g43868 = ( weightedBlendVar1711_g43868.x*localfloat3switch238_g43888 + weightedBlendVar1711_g43868.y*localfloat3switch456_g43875 );
				int ModeFlowType1245_g43869 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g43869 = ModeFlowType1245_g43869;
				float3 m_Off1246_g43869 = float3( 0,0,1 );
				float3 temp_output_21_0_g43871 = ( IN.ase_texcoord6.xyz * 500.0 );
				float3 temp_output_15_0_g43871 = cross( WorldNormal , ddy( temp_output_21_0_g43871 ) );
				float3 temp_output_6_0_g43871 = ddx( temp_output_21_0_g43871 );
				float dotResult27_g43871 = dot( temp_output_15_0_g43871 , temp_output_6_0_g43871 );
				float temp_output_14_0_g43871 = abs( dotResult27_g43871 );
				float4 _MaskVector1 = float4(0.001,0.001,0.001,0);
				int m_switch278_g43869 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g43869 = float4( 0,0,0,0 );
				float mulTime806_g43869 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g43869 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g43869 = ( FlowSpeed1146_g43869 * 1.0 );
				float2 temp_cast_12 = (temp_output_1150_0_g43869).xx;
				float2 appendResult219_g43869 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g43869 = ( appendResult219_g43869 * float2( 2,2 ) );
				float2 texCoord487_g43869 = IN.ase_texcoord4.xyz.xy * temp_output_1294_0_g43869 + float2( 0,0 );
				float cos485_g43869 = cos( _G_FlowSwirling.x );
				float sin485_g43869 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos485_g43869 , -sin485_g43869 , sin485_g43869 , cos485_g43869 )) + float2( 0,0 );
				float2 panner483_g43869 = ( mulTime806_g43869 * temp_cast_12 + rotator485_g43869);
				float2 temp_cast_13 = (temp_output_1150_0_g43869).xx;
				float cos481_g43869 = cos( _G_FlowSwirling.y );
				float sin481_g43869 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos481_g43869 , -sin481_g43869 , sin481_g43869 , cos481_g43869 )) + float2( 0,0 );
				float2 panner480_g43869 = ( mulTime806_g43869 * temp_cast_13 + rotator481_g43869);
				float2 temp_cast_14 = (temp_output_1150_0_g43869).xx;
				float2 panner478_g43869 = ( mulTime806_g43869 * temp_cast_14 + texCoord487_g43869);
				float4 OUT_SWIRLING298_g43869 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43869 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43869 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43869 ) ) );
				float4 m_Swirling278_g43869 = OUT_SWIRLING298_g43869;
				float2 texCoord196_g43872 = IN.ase_texcoord4.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43872 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43872 = texCoord196_g43872;
				float2 blendOpDest197_g43872 = (_FLOWMAP_Map89_g43872).xy;
				float2 temp_output_197_0_g43872 = ( saturate( (( blendOpDest197_g43872 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43872 ) * ( 1.0 - blendOpSrc197_g43872 ) ) : ( 2.0 * blendOpDest197_g43872 * blendOpSrc197_g43872 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43872 = FlowSpeed1146_g43869;
				float temp_output_182_0_g43872 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43872 );
				float temp_output_194_0_g43872 = (0.0 + (( ( temp_output_182_0_g43872 - floor( ( temp_output_182_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43869 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43872 = FlowStrength1147_g43869;
				float _TIME_UV_A199_g43872 = ( -temp_output_194_0_g43872 * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult198_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_A199_g43872);
				float2 INPUT_MAP_TILLING128_g43869 = temp_output_1294_0_g43869;
				float2 texCoord205_g43872 = IN.ase_texcoord4.xyz.xy * INPUT_MAP_TILLING128_g43869 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43872 = texCoord205_g43872;
				float2 FLOW_A201_g43872 = ( lerpResult198_g43872 + TEXTURE_TILLING211_g43872 );
				float temp_output_225_0_g43872 = (temp_output_182_0_g43872*1.0 + 0.5);
				float _TIME_UV_B214_g43872 = ( -(0.0 + (( ( temp_output_225_0_g43872 - floor( ( temp_output_225_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult229_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_B214_g43872);
				float2 FLOW_B232_g43872 = ( lerpResult229_g43872 + TEXTURE_TILLING211_g43872 );
				float TIME_BLEND235_g43872 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43872 / 0.5 ) ) ) );
				float4 lerpResult1117_g43869 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43872 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43872 ) , TIME_BLEND235_g43872);
				float4 OUT_FLOW_FLOWMAP1119_g43869 = lerpResult1117_g43869;
				float4 m_FlowMap278_g43869 = OUT_FLOW_FLOWMAP1119_g43869;
				float4 localfloat4switch278_g43869 = float4switch278_g43869( m_switch278_g43869 , m_Off278_g43869 , m_Swirling278_g43869 , m_FlowMap278_g43869 );
				float4 screenPos = IN.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float clampDepth2_g43881 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g43881 = clampDepth2_g43881;
				float4 localCalculateObliqueFrustumCorrection3_g43896 = CalculateObliqueFrustumCorrection();
				float dotResult4_g43896 = dot( float4( IN.ase_texcoord6.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g43896 );
				float correctionFactor1_g43881 = dotResult4_g43896;
				float localCorrectedLinearEyeDepth1_g43881 = CorrectedLinearEyeDepth( z1_g43881 , correctionFactor1_g43881 );
				float eyeDepth18_g43881 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g43881 = ( eyeDepth18_g43881 - screenPos.w );
				float temp_output_13_0_g43881 = ( localCorrectedLinearEyeDepth1_g43881 - abs( temp_output_17_0_g43881 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g43868 = saturate( temp_output_13_0_g43881 );
				float4 temp_cast_18 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43869 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float GRAB_SCREEN_DEPTH73_g43868 = localCorrectedLinearEyeDepth1_g43881;
				float4 temp_cast_19 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_20 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g43868 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_21 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43869 = temp_cast_21;
				float4 lerpResult281_g43869 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43869 * _FOAMVERTICAL_TintStrength ) * temp_cast_18 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43869.z + temp_cast_19 ) - temp_cast_20 ) * temp_output_294_0_g43869 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * temp_output_294_0_g43869 ) ) ));
				float4 lerpResult265_g43869 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43869 , FlowStrength1147_g43869);
				float3 temp_cast_22 = (0.5).xxx;
				float3 break1161_g43869 = ( abs( WorldNormal ) - temp_cast_22 );
				float _MASK_VERTICAL_Z1162_g43869 = ( break1161_g43869.z + 0.45 );
				float4 lerpResult1173_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_Z1162_g43869);
				float _MASK_VERTICAL_X1170_g43869 = ( break1161_g43869.x + 0.46 );
				float4 lerpResult1176_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_X1170_g43869);
				float _MASK_VERTICAL_Y1163_g43869 = ( -break1161_g43869.y + 6.5 );
				float4 lerpResult1179_g43869 = lerp( lerpResult1173_g43869 , ( lerpResult1173_g43869 + lerpResult1176_g43869 ) , _MASK_VERTICAL_Y1163_g43869);
				float4 temp_output_1189_0_g43869 = saturate( lerpResult1179_g43869 );
				float4 temp_output_8_0_g43871 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g43869 );
				float4 break18_g43871 = ( sign( temp_output_14_0_g43871 ) * ( ( ddx( temp_output_8_0_g43871 ) * float4( temp_output_15_0_g43871 , 0.0 ) ) + ( ddy( temp_output_8_0_g43871 ) * float4( cross( WorldNormal , temp_output_6_0_g43871 ) , 0.0 ) ) ) );
				float3 appendResult7_g43871 = (float3(break18_g43871.x , -break18_g43871.y , break18_g43871.z));
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float3 worldToTangentDir5_g43871 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43871 * WorldNormal ) - appendResult7_g43871 )) );
				float3 temp_output_1249_32_g43869 = worldToTangentDir5_g43871;
				float3 m_Swirling1246_g43869 = temp_output_1249_32_g43869;
				float3 m_FlowMap1246_g43869 = temp_output_1249_32_g43869;
				float3 localfloat3switch1246_g43869 = float3switch1246_g43869( m_switch1246_g43869 , m_Off1246_g43869 , m_Swirling1246_g43869 , m_FlowMap1246_g43869 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 = localfloat3switch1246_g43869;
				int ModeFlowType1232_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g43897 = ModeFlowType1232_g43897;
				float3 m_Off1230_g43897 = float3( 0,0,1 );
				float3 temp_output_21_0_g43899 = ( IN.ase_texcoord6.xyz * 500.0 );
				float3 temp_output_15_0_g43899 = cross( WorldNormal , ddy( temp_output_21_0_g43899 ) );
				float3 temp_output_6_0_g43899 = ddx( temp_output_21_0_g43899 );
				float dotResult27_g43899 = dot( temp_output_15_0_g43899 , temp_output_6_0_g43899 );
				float temp_output_14_0_g43899 = abs( dotResult27_g43899 );
				int m_switch278_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g43897 = float4( 0,0,0,0 );
				float mulTime806_g43897 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g43897 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g43897 = ( Speed1146_g43897 * 1.0 );
				float2 temp_cast_26 = (temp_output_1150_0_g43897).xx;
				float2 appendResult219_g43897 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g43897 = ( appendResult219_g43897 * float2( 2,2 ) );
				float2 texCoord487_g43897 = IN.ase_texcoord4.xyz.xy * temp_output_1214_0_g43897 + float2( 0,0 );
				float cos485_g43897 = cos( _G_FlowSwirling.x );
				float sin485_g43897 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos485_g43897 , -sin485_g43897 , sin485_g43897 , cos485_g43897 )) + float2( 0,0 );
				float2 panner483_g43897 = ( mulTime806_g43897 * temp_cast_26 + rotator485_g43897);
				float2 temp_cast_27 = (temp_output_1150_0_g43897).xx;
				float cos481_g43897 = cos( _G_FlowSwirling.y );
				float sin481_g43897 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos481_g43897 , -sin481_g43897 , sin481_g43897 , cos481_g43897 )) + float2( 0,0 );
				float2 panner480_g43897 = ( mulTime806_g43897 * temp_cast_27 + rotator481_g43897);
				float2 temp_cast_28 = (temp_output_1150_0_g43897).xx;
				float2 panner478_g43897 = ( mulTime806_g43897 * temp_cast_28 + texCoord487_g43897);
				float4 OUT_SWIRLING298_g43897 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43897 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43897 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43897 ) ) );
				float4 m_Swirling278_g43897 = OUT_SWIRLING298_g43897;
				float2 texCoord196_g43898 = IN.ase_texcoord4.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43898 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43898 = texCoord196_g43898;
				float2 blendOpDest197_g43898 = (_FLOWMAP_Map89_g43898).xy;
				float2 temp_output_197_0_g43898 = ( saturate( (( blendOpDest197_g43898 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43898 ) * ( 1.0 - blendOpSrc197_g43898 ) ) : ( 2.0 * blendOpDest197_g43898 * blendOpSrc197_g43898 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43898 = Speed1146_g43897;
				float temp_output_182_0_g43898 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43898 );
				float temp_output_194_0_g43898 = (0.0 + (( ( temp_output_182_0_g43898 - floor( ( temp_output_182_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43897 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43898 = FlowStrength1147_g43897;
				float _TIME_UV_A199_g43898 = ( -temp_output_194_0_g43898 * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult198_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_A199_g43898);
				float2 INPUT_MAP_TILLING128_g43897 = temp_output_1214_0_g43897;
				float2 texCoord205_g43898 = IN.ase_texcoord4.xyz.xy * INPUT_MAP_TILLING128_g43897 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43898 = texCoord205_g43898;
				float2 FLOW_A201_g43898 = ( lerpResult198_g43898 + TEXTURE_TILLING211_g43898 );
				float temp_output_225_0_g43898 = (temp_output_182_0_g43898*1.0 + 0.5);
				float _TIME_UV_B214_g43898 = ( -(0.0 + (( ( temp_output_225_0_g43898 - floor( ( temp_output_225_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult229_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_B214_g43898);
				float2 FLOW_B232_g43898 = ( lerpResult229_g43898 + TEXTURE_TILLING211_g43898 );
				float TIME_BLEND235_g43898 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43898 / 0.5 ) ) ) );
				float4 lerpResult1117_g43897 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43898 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43898 ) , TIME_BLEND235_g43898);
				float4 OUT_FLOW_FLOWMAP1119_g43897 = lerpResult1117_g43897;
				float4 m_FlowMap278_g43897 = OUT_FLOW_FLOWMAP1119_g43897;
				float4 localfloat4switch278_g43897 = float4switch278_g43897( m_switch278_g43897 , m_Off278_g43897 , m_Swirling278_g43897 , m_FlowMap278_g43897 );
				float4 temp_cast_31 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43897 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_33 = (0.001).xxxx;
				float4 temp_cast_34 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43897 = temp_cast_34;
				float4 lerpResult281_g43897 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43897 * _FOAMHORIZONTAL_TintStrength ) * temp_cast_31 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43897.z + temp_cast_32 ) - temp_cast_33 ) * temp_output_294_0_g43897 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * temp_output_294_0_g43897 ) ) ));
				float4 lerpResult265_g43897 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43897 , FlowStrength1147_g43897);
				float _MASK_HORIZONTAL1160_g43897 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g43897 = lerp( float4(0.001,0.001,0.001,0) , lerpResult265_g43897 , _MASK_HORIZONTAL1160_g43897);
				float4 temp_output_1188_0_g43897 = saturate( lerpResult1185_g43897 );
				float4 temp_output_8_0_g43899 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g43897 );
				float4 break18_g43899 = ( sign( temp_output_14_0_g43899 ) * ( ( ddx( temp_output_8_0_g43899 ) * float4( temp_output_15_0_g43899 , 0.0 ) ) + ( ddy( temp_output_8_0_g43899 ) * float4( cross( WorldNormal , temp_output_6_0_g43899 ) , 0.0 ) ) ) );
				float3 appendResult7_g43899 = (float3(break18_g43899.x , -break18_g43899.y , break18_g43899.z));
				float3 worldToTangentDir5_g43899 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43899 * WorldNormal ) - appendResult7_g43899 )) );
				float3 temp_output_1233_32_g43897 = worldToTangentDir5_g43899;
				float3 m_Swirling1230_g43897 = temp_output_1233_32_g43897;
				float3 m_FlowMap1230_g43897 = temp_output_1233_32_g43897;
				float3 localfloat3switch1230_g43897 = float3switch1230_g43897( m_switch1230_g43897 , m_Off1230_g43897 , m_Swirling1230_g43897 , m_FlowMap1230_g43897 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 = localfloat3switch1230_g43897;
				int ModeFlowType1225_g43882 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g43882 = ModeFlowType1225_g43882;
				float3 m_Off1223_g43882 = float3( 0,0,1 );
				float3 temp_output_21_0_g43883 = ( IN.ase_texcoord6.xyz * 500.0 );
				float3 temp_output_15_0_g43883 = cross( WorldNormal , ddy( temp_output_21_0_g43883 ) );
				float3 temp_output_6_0_g43883 = ddx( temp_output_21_0_g43883 );
				float dotResult27_g43883 = dot( temp_output_15_0_g43883 , temp_output_6_0_g43883 );
				float temp_output_14_0_g43883 = abs( dotResult27_g43883 );
				int m_switch278_g43882 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g43882 = float4( 0,0,0,0 );
				float mulTime806_g43882 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g43882 = _FoamShoreline_Speed;
				float temp_output_1185_0_g43882 = ( FlowSpeed1179_g43882 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g43882).xx;
				float2 appendResult219_g43882 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g43882 = ( appendResult219_g43882 * float2( 2,2 ) );
				float2 INPUT_MAP_TILLING128_g43882 = temp_output_1196_0_g43882;
				float2 texCoord487_g43882 = IN.ase_texcoord4.xyz.xy * INPUT_MAP_TILLING128_g43882 + float2( 0,0 );
				float cos485_g43882 = cos( _G_FlowSwirling.x );
				float sin485_g43882 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos485_g43882 , -sin485_g43882 , sin485_g43882 , cos485_g43882 )) + float2( 0,0 );
				float2 panner483_g43882 = ( mulTime806_g43882 * temp_cast_38 + rotator485_g43882);
				float2 temp_cast_39 = (temp_output_1185_0_g43882).xx;
				float cos481_g43882 = cos( _G_FlowSwirling.y );
				float sin481_g43882 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos481_g43882 , -sin481_g43882 , sin481_g43882 , cos481_g43882 )) + float2( 0,0 );
				float2 panner480_g43882 = ( mulTime806_g43882 * temp_cast_39 + rotator481_g43882);
				float2 temp_cast_40 = (temp_output_1185_0_g43882).xx;
				float2 panner478_g43882 = ( mulTime806_g43882 * temp_cast_40 + texCoord487_g43882);
				float4 OUT_SWIRLING298_g43882 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43882 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43882 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43882 ) ) );
				float4 m_Swirling278_g43882 = OUT_SWIRLING298_g43882;
				float2 texCoord196_g43884 = IN.ase_texcoord4.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43884 = IN.ase_texcoord5;
				float2 blendOpSrc197_g43884 = texCoord196_g43884;
				float2 blendOpDest197_g43884 = (_FLOWMAP_Map89_g43884).xy;
				float2 temp_output_197_0_g43884 = ( saturate( (( blendOpDest197_g43884 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43884 ) * ( 1.0 - blendOpSrc197_g43884 ) ) : ( 2.0 * blendOpDest197_g43884 * blendOpSrc197_g43884 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43884 = _FoamShoreline_Speed;
				float temp_output_182_0_g43884 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43884 );
				float temp_output_194_0_g43884 = (0.0 + (( ( temp_output_182_0_g43884 - floor( ( temp_output_182_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43884 = _FoamShoreline_FlowStrength;
				float _TIME_UV_A199_g43884 = ( -temp_output_194_0_g43884 * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult198_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_A199_g43884);
				float2 texCoord205_g43884 = IN.ase_texcoord4.xyz.xy * temp_output_1196_0_g43882 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43884 = texCoord205_g43884;
				float2 FLOW_A201_g43884 = ( lerpResult198_g43884 + TEXTURE_TILLING211_g43884 );
				float temp_output_225_0_g43884 = (temp_output_182_0_g43884*1.0 + 0.5);
				float _TIME_UV_B214_g43884 = ( -(0.0 + (( ( temp_output_225_0_g43884 - floor( ( temp_output_225_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult229_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_B214_g43884);
				float2 FLOW_B232_g43884 = ( lerpResult229_g43884 + TEXTURE_TILLING211_g43884 );
				float TIME_BLEND235_g43884 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43884 / 0.5 ) ) ) );
				float4 lerpResult1153_g43882 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43884 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43884 ) , TIME_BLEND235_g43884);
				float4 OUT_FLOW_FLOWMAP1156_g43882 = lerpResult1153_g43882;
				float4 m_FlowMap278_g43882 = OUT_FLOW_FLOWMAP1156_g43882;
				float4 localfloat4switch278_g43882 = float4switch278_g43882( m_switch278_g43882 , m_Off278_g43882 , m_Swirling278_g43882 , m_FlowMap278_g43882 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos731_g43882 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord6.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43882 = temp_cast_46;
				float4 lerpResult769_g43882 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g43882 * _FoamShoreline_TintStrength ) * temp_cast_43 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g43882.z + temp_cast_44 ) - temp_cast_45 ) * temp_output_294_0_g43882 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * temp_output_294_0_g43882 ) ) ));
				float FlowStrength1182_g43882 = _FoamShoreline_FlowStrength;
				float4 lerpResult761_g43882 = lerp( float4( 0,0,0,0 ) , lerpResult769_g43882 , FlowStrength1182_g43882);
				float4 temp_output_8_0_g43883 = ( _FoamShoreline_NormalStrength * lerpResult761_g43882 );
				float4 break18_g43883 = ( sign( temp_output_14_0_g43883 ) * ( ( ddx( temp_output_8_0_g43883 ) * float4( temp_output_15_0_g43883 , 0.0 ) ) + ( ddy( temp_output_8_0_g43883 ) * float4( cross( WorldNormal , temp_output_6_0_g43883 ) , 0.0 ) ) ) );
				float3 appendResult7_g43883 = (float3(break18_g43883.x , -break18_g43883.y , break18_g43883.z));
				float3 worldToTangentDir5_g43883 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43883 * WorldNormal ) - appendResult7_g43883 )) );
				float3 temp_output_1222_32_g43882 = worldToTangentDir5_g43883;
				float3 m_Swirling1223_g43882 = temp_output_1222_32_g43882;
				float3 m_FlowMap1223_g43882 = temp_output_1222_32_g43882;
				float3 localfloat3switch1223_g43882 = float3switch1223_g43882( m_switch1223_g43882 , m_Off1223_g43882 , m_Swirling1223_g43882 , m_FlowMap1223_g43882 );
				float3 FOAM_NORMALShorline1208_g43868 = localfloat3switch1223_g43882;
				float3 temp_output_1715_0_g43868 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g43868 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 ) , FOAM_NORMALShorline1208_g43868 );
				float3 worldPosValue71_g43895 = WorldPosition;
				float3 WorldPosition66_g43895 = worldPosValue71_g43895;
				float3 NORMAL_OUT1731_g43868 = temp_output_1715_0_g43868;
				float3 temp_output_16_0_g43895 = NORMAL_OUT1731_g43868;
				float3 lerpResult163_g43895 = lerp( ( WorldTangent.xyz * temp_output_16_0_g43895.x ) , ( ase_worldBitangent * temp_output_16_0_g43895.y ) , ( WorldNormal * temp_output_16_0_g43895.z ));
				float3 NORMAL_PERPIXEL136_g43895 = lerpResult163_g43895;
				float3 WorldNormal66_g43895 = NORMAL_PERPIXEL136_g43895;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 WorldView66_g43895 = ase_worldViewDir;
				float3 temp_output_1_0_g43895 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g43895 = (temp_output_1_0_g43895).xyz;
				float temp_output_173_0_g43895 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g43895 = temp_output_173_0_g43895;
				float4 shadowMaskValue77_g43895 = float4(1,1,1,1);
				float4 ShadowMask66_g43895 = shadowMaskValue77_g43895;
				float3 localAdditionalLightsSpecularMask66_g43895 = AdditionalLightsSpecularMask( WorldPosition66_g43895 , WorldNormal66_g43895 , WorldView66_g43895 , SpecColor66_g43895 , Smoothness66_g43895 , ShadowMask66_g43895 );
				float3 ADDITIONAL_LIGHT1730_g43868 = localAdditionalLightsSpecularMask66_g43895;
				float3 temp_output_1732_0_g43868 = ( temp_output_1715_0_g43868 + ADDITIONAL_LIGHT1730_g43868 );
				
				float3 Normal = temp_output_1732_0_g43868;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				
				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					return half4(packedNormalWS, 0.0);
				#else
					
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif

					return half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }
			
			Blend One Zero, One Zero
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			
			#pragma multi_compile _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile _ _REFLECTION_PROBE_BOX_PROJECTION

			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile _ _RENDER_PASS_ENABLED

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"


			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_WaterNormal_Horizontal_Vertical_NormalMap);
			SAMPLER(sampler_trilinear_repeat_aniso2);
			TEXTURE2D(_WaterNormal_Vertical_NormalMap);
			TEXTURE2D(_FOAMVERTICAL_FoamMap);
			TEXTURE2D(_FOAMHORIZONTAL_FoamMap);
			TEXTURE2D(_FoamShoreline_FoamMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float3 float3switch238_g43888( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch456_g43875( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch278_g43869( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43897( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch278_g43882( int m_switch, float4 m_Off, float4 m_Swirling, float4 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch124_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch119_g43873( int m_switch, float4 m_Off, float4 m_ActiveCubeMap, float4 m_ActiveProbe )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveCubeMap;
				else if(m_switch ==2)
					return m_ActiveProbe;
				else
				return float4(0,0,0,0);
			}
			
			real3 ASESafeNormalize(float3 inVec)
			{
				real dp3 = max(FLT_MIN, dot(inVec, inVec));
				return inVec* rsqrt( dp3);
			}
			
			float3 float3switch1246_g43869( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1230_g43897( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch1223_g43882( int m_switch, float3 m_Off, float3 m_Swirling, float3 m_FlowMap )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else if(m_switch ==2)
					return m_FlowMap;
				else
				return float3(0,0,0);
			}
			
			float3 AdditionalLightsSpecularMask( float3 WorldPosition, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				Smoothness = exp2(10 * Smoothness + 1);
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color += LightingSpecular(AttLightColor, light.direction, WorldNormal, WorldView, half4(SpecColor, 0), Smoothness);	
				}
				#endif
				return Color;
			}
			
			float3 float3switch31_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch11_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch18_g43893( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveClamp )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveClamp;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord8.w = eyeDepth;
				
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord10 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#if defined(DYNAMICLIGHTMAP_ON)
				o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			FragmentOutput frag ( VertexOutput IN 
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif


	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int m_switch119_g43873 = _Reflection_ModeURP;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth2_g43868 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth2_g43868 = abs( ( screenDepth2_g43868 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g43868 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth2_g43868*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g43868 = lerp( _DepthTint , lerpResult25_g43868 , saturate( (distanceDepth2_g43868*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g43868 = lerpResult27_g43868;
				int m_switch238_g43888 = _WaterNormal_Horizontal_FlowType;
				float3 m_Off238_g43888 = float3(0,0,0.001);
				float mulTime155_g43888 = _TimeParameters.x * _WaterNormal_Horizontal_Timescale;
				float FlowSpeed365_g43888 = _WaterNormal_Horizontal_Speed;
				float temp_output_367_0_g43888 = ( FlowSpeed365_g43888 * 1.0 );
				float2 temp_cast_0 = (temp_output_367_0_g43888).xx;
				float2 appendResult235_g43888 = (float2(_WaterNormal_Horizontal_TilingX , _WaterNormal_Horizontal_TilingY));
				float2 texCoord23_g43888 = IN.ase_texcoord8.xyz.xy * ( appendResult235_g43888 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling = float2(2,4);
				float cos62_g43888 = cos( _G_FlowSwirling.x );
				float sin62_g43888 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos62_g43888 , -sin62_g43888 , sin62_g43888 , cos62_g43888 )) + float2( 0,0 );
				float2 panner15_g43888 = ( mulTime155_g43888 * temp_cast_0 + rotator62_g43888);
				float2 temp_cast_1 = (temp_output_367_0_g43888).xx;
				float cos8_g43888 = cos( _G_FlowSwirling.y );
				float sin8_g43888 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43888 = mul( texCoord23_g43888 - float2( 0,0 ) , float2x2( cos8_g43888 , -sin8_g43888 , sin8_g43888 , cos8_g43888 )) + float2( 0,0 );
				float2 panner16_g43888 = ( mulTime155_g43888 * temp_cast_1 + rotator8_g43888);
				float2 temp_cast_2 = (temp_output_367_0_g43888).xx;
				float2 panner17_g43888 = ( mulTime155_g43888 * temp_cast_2 + texCoord23_g43888);
				float2 layeredBlendVar666_g43888 = IN.ase_texcoord8.xyz.xy;
				float4 layeredBlend666_g43888 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43888 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43888 ) , layeredBlendVar666_g43888.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43888 ) , layeredBlendVar666_g43888.y ) );
				float4 temp_output_1_0_g43892 = layeredBlend666_g43888;
				float temp_output_8_0_g43892 = _WaterNormal_Horizontal_NormalStrength;
				float3 unpack52_g43892 = UnpackNormalScale( temp_output_1_0_g43892, temp_output_8_0_g43892 );
				unpack52_g43892.z = lerp( 1, unpack52_g43892.z, saturate(temp_output_8_0_g43892) );
				float3 temp_output_699_59_g43888 = unpack52_g43892;
				float3 temp_output_372_0_g43888 = abs( WorldNormal );
				float3 break386_g43888 = ( temp_output_372_0_g43888 * temp_output_372_0_g43888 );
				float _MASK_VERTICAL_Z381_g43888 = ( break386_g43888.z + 0.01 );
				float3 lerpResult677_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float _MASK_VERTICAL_X373_g43888 = ( -break386_g43888.x + 0.2 );
				float3 lerpResult681_g43888 = lerp( float3( 0,0,0 ) , temp_output_699_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float _MASK_VERTICAL_Y_NEG413_g43888 = ( ( WorldNormal.y + -0.5 ) * 0.5 );
				float3 lerpResult679_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult677_g43888 + lerpResult681_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_Swirling238_g43888 = lerpResult679_g43888;
				float2 texCoord196_g43890 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43890 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43890 = texCoord196_g43890;
				float2 blendOpDest197_g43890 = (_FLOWMAP_Map89_g43890).xy;
				float2 temp_output_197_0_g43890 = ( saturate( (( blendOpDest197_g43890 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43890 ) * ( 1.0 - blendOpSrc197_g43890 ) ) : ( 2.0 * blendOpDest197_g43890 * blendOpSrc197_g43890 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43890 = FlowSpeed365_g43888;
				float temp_output_182_0_g43890 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43890 );
				float temp_output_194_0_g43890 = (0.0 + (( ( temp_output_182_0_g43890 - floor( ( temp_output_182_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43890 = _WaterNormal_Horizontal_FlowStrength;
				float _TIME_UV_A199_g43890 = ( -temp_output_194_0_g43890 * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult198_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_A199_g43890);
				float2 INPUT_MAP_TILLING128_g43888 = appendResult235_g43888;
				float2 texCoord205_g43890 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43888 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43890 = texCoord205_g43890;
				float2 FLOW_A201_g43890 = ( lerpResult198_g43890 + TEXTURE_TILLING211_g43890 );
				float temp_output_225_0_g43890 = (temp_output_182_0_g43890*1.0 + 0.5);
				float _TIME_UV_B214_g43890 = ( -(0.0 + (( ( temp_output_225_0_g43890 - floor( ( temp_output_225_0_g43890 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43890 );
				float2 lerpResult229_g43890 = lerp( temp_output_197_0_g43890 , texCoord196_g43890 , _TIME_UV_B214_g43890);
				float2 FLOW_B232_g43890 = ( lerpResult229_g43890 + TEXTURE_TILLING211_g43890 );
				float TIME_BLEND235_g43890 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43890 / 0.5 ) ) ) );
				float4 lerpResult317_g43888 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43890 ) , SAMPLE_TEXTURE2D( _WaterNormal_Horizontal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43890 ) , TIME_BLEND235_g43890);
				float4 temp_output_1_0_g43889 = lerpResult317_g43888;
				float NormalStrength152_g43888 = _WaterNormal_Horizontal_NormalStrength;
				float temp_output_8_0_g43889 = NormalStrength152_g43888;
				float3 unpack52_g43889 = UnpackNormalScale( temp_output_1_0_g43889, temp_output_8_0_g43889 );
				unpack52_g43889.z = lerp( 1, unpack52_g43889.z, saturate(temp_output_8_0_g43889) );
				float3 temp_output_701_59_g43888 = unpack52_g43889;
				float3 lerpResult692_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_Z381_g43888);
				float3 lerpResult691_g43888 = lerp( float3( 0,0,0 ) , temp_output_701_59_g43888 , _MASK_VERTICAL_X373_g43888);
				float3 lerpResult697_g43888 = lerp( float3( 0,0,0 ) , ( lerpResult692_g43888 + lerpResult691_g43888 ) , _MASK_VERTICAL_Y_NEG413_g43888);
				float3 m_FlowMap238_g43888 = lerpResult697_g43888;
				float3 localfloat3switch238_g43888 = float3switch238_g43888( m_switch238_g43888 , m_Off238_g43888 , m_Swirling238_g43888 , m_FlowMap238_g43888 );
				int m_switch456_g43875 = _WaterNormal_Vertical_FlowType;
				float3 m_Off456_g43875 = float3(0,0,0.001);
				float mulTime155_g43875 = _TimeParameters.x * _WaterNormal_Vertical_Timescale;
				float FlowSpeed365_g43875 = _WaterNormal_Vertical_Speed;
				float temp_output_367_0_g43875 = ( FlowSpeed365_g43875 * 1.0 );
				float2 temp_cast_5 = (temp_output_367_0_g43875).xx;
				float2 appendResult235_g43875 = (float2(_WaterNormal_Vertical_TilingX , _WaterNormal_Vertical_TilingY));
				float2 texCoord23_g43875 = IN.ase_texcoord8.xyz.xy * ( appendResult235_g43875 * float2( 2,2 ) ) + float2( 0,0 );
				float cos62_g43875 = cos( _G_FlowSwirling.x );
				float sin62_g43875 = sin( _G_FlowSwirling.x );
				float2 rotator62_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos62_g43875 , -sin62_g43875 , sin62_g43875 , cos62_g43875 )) + float2( 0,0 );
				float2 panner15_g43875 = ( mulTime155_g43875 * temp_cast_5 + rotator62_g43875);
				float2 temp_cast_6 = (temp_output_367_0_g43875).xx;
				float cos8_g43875 = cos( _G_FlowSwirling.y );
				float sin8_g43875 = sin( _G_FlowSwirling.y );
				float2 rotator8_g43875 = mul( texCoord23_g43875 - float2( 0,0 ) , float2x2( cos8_g43875 , -sin8_g43875 , sin8_g43875 , cos8_g43875 )) + float2( 0,0 );
				float2 panner16_g43875 = ( mulTime155_g43875 * temp_cast_6 + rotator8_g43875);
				float2 temp_cast_7 = (temp_output_367_0_g43875).xx;
				float2 panner17_g43875 = ( mulTime155_g43875 * temp_cast_7 + texCoord23_g43875);
				float2 layeredBlendVar448_g43875 = IN.ase_texcoord8.xyz.xy;
				float4 layeredBlend448_g43875 = ( lerp( lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner15_g43875 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner16_g43875 ) , layeredBlendVar448_g43875.x ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, panner17_g43875 ) , layeredBlendVar448_g43875.y ) );
				float4 temp_output_1_0_g43879 = layeredBlend448_g43875;
				float temp_output_8_0_g43879 = _WaterNormal_Vertical_NormalStrength;
				float3 unpack52_g43879 = UnpackNormalScale( temp_output_1_0_g43879, temp_output_8_0_g43879 );
				unpack52_g43879.z = lerp( 1, unpack52_g43879.z, saturate(temp_output_8_0_g43879) );
				float3 temp_output_481_59_g43875 = unpack52_g43879;
				float3 temp_cast_9 = (0.5).xxx;
				float3 break386_g43875 = ( abs( WorldNormal ) - temp_cast_9 );
				float _MASK_VERTICAL_Z381_g43875 = ( break386_g43875.z + 0.75 );
				float3 lerpResult465_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float _MASK_VERTICAL_X373_g43875 = ( break386_g43875.x + 0.45 );
				float3 lerpResult457_g43875 = lerp( float3( 0,0,0 ) , temp_output_481_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float _MASK_VERTICAL_Y383_g43875 = ( -break386_g43875.y + 5.0 );
				float3 lerpResult454_g43875 = lerp( lerpResult465_g43875 , ( lerpResult465_g43875 + lerpResult457_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float _MASK_VERTICAL_Y_NEG413_g43875 = ( ( WorldNormal.y + WorldNormal.y ) - 1.0 );
				float3 lerpResult477_g43875 = lerp( float3( 0,0,0 ) , lerpResult454_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_Swirling456_g43875 = lerpResult477_g43875;
				float2 texCoord196_g43876 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43876 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43876 = texCoord196_g43876;
				float2 blendOpDest197_g43876 = (_FLOWMAP_Map89_g43876).xy;
				float2 temp_output_197_0_g43876 = ( saturate( (( blendOpDest197_g43876 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43876 ) * ( 1.0 - blendOpSrc197_g43876 ) ) : ( 2.0 * blendOpDest197_g43876 * blendOpSrc197_g43876 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43876 = FlowSpeed365_g43875;
				float temp_output_182_0_g43876 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43876 );
				float temp_output_194_0_g43876 = (0.0 + (( ( temp_output_182_0_g43876 - floor( ( temp_output_182_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43876 = _WaterNormal_Vertical_FlowStrength;
				float _TIME_UV_A199_g43876 = ( -temp_output_194_0_g43876 * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult198_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_A199_g43876);
				float2 INPUT_MAP_TILLING128_g43875 = appendResult235_g43875;
				float2 texCoord205_g43876 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43875 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43876 = texCoord205_g43876;
				float2 FLOW_A201_g43876 = ( lerpResult198_g43876 + TEXTURE_TILLING211_g43876 );
				float temp_output_225_0_g43876 = (temp_output_182_0_g43876*1.0 + 0.5);
				float _TIME_UV_B214_g43876 = ( -(0.0 + (( ( temp_output_225_0_g43876 - floor( ( temp_output_225_0_g43876 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43876 );
				float2 lerpResult229_g43876 = lerp( temp_output_197_0_g43876 , texCoord196_g43876 , _TIME_UV_B214_g43876);
				float2 FLOW_B232_g43876 = ( lerpResult229_g43876 + TEXTURE_TILLING211_g43876 );
				float TIME_BLEND235_g43876 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43876 / 0.5 ) ) ) );
				float4 lerpResult317_g43875 = lerp( SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43876 ) , SAMPLE_TEXTURE2D( _WaterNormal_Vertical_NormalMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43876 ) , TIME_BLEND235_g43876);
				float4 temp_output_1_0_g43878 = lerpResult317_g43875;
				float NormalStrength152_g43875 = _WaterNormal_Vertical_NormalStrength;
				float temp_output_8_0_g43878 = NormalStrength152_g43875;
				float3 unpack52_g43878 = UnpackNormalScale( temp_output_1_0_g43878, temp_output_8_0_g43878 );
				unpack52_g43878.z = lerp( 1, unpack52_g43878.z, saturate(temp_output_8_0_g43878) );
				float3 temp_output_483_59_g43875 = unpack52_g43878;
				float3 lerpResult466_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_Z381_g43875);
				float3 lerpResult453_g43875 = lerp( float3( 0,0,0 ) , temp_output_483_59_g43875 , _MASK_VERTICAL_X373_g43875);
				float3 lerpResult460_g43875 = lerp( lerpResult466_g43875 , ( lerpResult466_g43875 + lerpResult453_g43875 ) , _MASK_VERTICAL_Y383_g43875);
				float3 lerpResult411_g43875 = lerp( float3( 0,0,0 ) , lerpResult460_g43875 , ( 1.0 - _MASK_VERTICAL_Y_NEG413_g43875 ));
				float3 m_FlowMap456_g43875 = lerpResult411_g43875;
				float3 localfloat3switch456_g43875 = float3switch456_g43875( m_switch456_g43875 , m_Off456_g43875 , m_Swirling456_g43875 , m_FlowMap456_g43875 );
				float2 weightedBlendVar1711_g43868 = IN.ase_texcoord8.xyz.xy;
				float3 weightedBlend1711_g43868 = ( weightedBlendVar1711_g43868.x*localfloat3switch238_g43888 + weightedBlendVar1711_g43868.y*localfloat3switch456_g43875 );
				float3 NORMAL_IN84_g43894 = ( weightedBlend1711_g43868 * 10.0 );
				float REFACTED_SCALE_FLOAT78_g43894 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord8.w;
				float eyeDepth7_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g43894 = ( (NORMAL_IN84_g43894).xy * ( REFACTED_SCALE_FLOAT78_g43894 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g43894 - eyeDepth ) ) );
				float eyeDepth27_g43894 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g43894, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g43894 = (( float4( ( temp_output_21_0_g43894 * saturate( ( eyeDepth27_g43894 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g43894 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g43894 ), 1.0 );
				float4 REFRACTED_DEPTH144_g43868 = fetchOpaqueVal89_g43894;
				float temp_output_20_0_g43868 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g43868 = 0.0;
				#else
				float staticSwitch37_g43868 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth2_g43868*-5.0 + 1.0) ) ) ) * temp_output_20_0_g43868 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g43868 = staticSwitch37_g43868;
				float4 lerpResult105_g43868 = lerp( COLOR_TINT161_g43868 , REFRACTED_DEPTH144_g43868 , DEPTH_TINT_ALPHA93_g43868);
				float4 _MaskVector1 = float4(0.001,0.001,0.001,0);
				int m_switch278_g43869 = _FOAMVERTICAL_ModeFlowType;
				float4 m_Off278_g43869 = float4( 0,0,0,0 );
				float mulTime806_g43869 = _TimeParameters.x * _FOAMVERTICAL_Timescale;
				float FlowSpeed1146_g43869 = _FOAMVERTICAL_Speed;
				float temp_output_1150_0_g43869 = ( FlowSpeed1146_g43869 * 1.0 );
				float2 temp_cast_14 = (temp_output_1150_0_g43869).xx;
				float2 appendResult219_g43869 = (float2(_FOAMVERTICAL_TilingX , _FOAMVERTICAL_TilingY));
				float2 temp_output_1294_0_g43869 = ( appendResult219_g43869 * float2( 2,2 ) );
				float2 texCoord487_g43869 = IN.ase_texcoord8.xyz.xy * temp_output_1294_0_g43869 + float2( 0,0 );
				float cos485_g43869 = cos( _G_FlowSwirling.x );
				float sin485_g43869 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos485_g43869 , -sin485_g43869 , sin485_g43869 , cos485_g43869 )) + float2( 0,0 );
				float2 panner483_g43869 = ( mulTime806_g43869 * temp_cast_14 + rotator485_g43869);
				float2 temp_cast_15 = (temp_output_1150_0_g43869).xx;
				float cos481_g43869 = cos( _G_FlowSwirling.y );
				float sin481_g43869 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43869 = mul( texCoord487_g43869 - float2( 0,0 ) , float2x2( cos481_g43869 , -sin481_g43869 , sin481_g43869 , cos481_g43869 )) + float2( 0,0 );
				float2 panner480_g43869 = ( mulTime806_g43869 * temp_cast_15 + rotator481_g43869);
				float2 temp_cast_16 = (temp_output_1150_0_g43869).xx;
				float2 panner478_g43869 = ( mulTime806_g43869 * temp_cast_16 + texCoord487_g43869);
				float4 OUT_SWIRLING298_g43869 = ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43869 ) + ( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43869 ) + SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43869 ) ) );
				float4 m_Swirling278_g43869 = OUT_SWIRLING298_g43869;
				float2 texCoord196_g43872 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43872 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43872 = texCoord196_g43872;
				float2 blendOpDest197_g43872 = (_FLOWMAP_Map89_g43872).xy;
				float2 temp_output_197_0_g43872 = ( saturate( (( blendOpDest197_g43872 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43872 ) * ( 1.0 - blendOpSrc197_g43872 ) ) : ( 2.0 * blendOpDest197_g43872 * blendOpSrc197_g43872 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43872 = FlowSpeed1146_g43869;
				float temp_output_182_0_g43872 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43872 );
				float temp_output_194_0_g43872 = (0.0 + (( ( temp_output_182_0_g43872 - floor( ( temp_output_182_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43869 = _FOAMVERTICAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43872 = FlowStrength1147_g43869;
				float _TIME_UV_A199_g43872 = ( -temp_output_194_0_g43872 * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult198_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_A199_g43872);
				float2 INPUT_MAP_TILLING128_g43869 = temp_output_1294_0_g43869;
				float2 texCoord205_g43872 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43869 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43872 = texCoord205_g43872;
				float2 FLOW_A201_g43872 = ( lerpResult198_g43872 + TEXTURE_TILLING211_g43872 );
				float temp_output_225_0_g43872 = (temp_output_182_0_g43872*1.0 + 0.5);
				float _TIME_UV_B214_g43872 = ( -(0.0 + (( ( temp_output_225_0_g43872 - floor( ( temp_output_225_0_g43872 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43872 );
				float2 lerpResult229_g43872 = lerp( temp_output_197_0_g43872 , texCoord196_g43872 , _TIME_UV_B214_g43872);
				float2 FLOW_B232_g43872 = ( lerpResult229_g43872 + TEXTURE_TILLING211_g43872 );
				float TIME_BLEND235_g43872 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43872 / 0.5 ) ) ) );
				float4 lerpResult1117_g43869 = lerp( SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43872 ) , SAMPLE_TEXTURE2D( _FOAMVERTICAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43872 ) , TIME_BLEND235_g43872);
				float4 OUT_FLOW_FLOWMAP1119_g43869 = lerpResult1117_g43869;
				float4 m_FlowMap278_g43869 = OUT_FLOW_FLOWMAP1119_g43869;
				float4 localfloat4switch278_g43869 = float4switch278_g43869( m_switch278_g43869 , m_Off278_g43869 , m_Swirling278_g43869 , m_FlowMap278_g43869 );
				float clampDepth2_g43881 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z1_g43881 = clampDepth2_g43881;
				float4 localCalculateObliqueFrustumCorrection3_g43896 = CalculateObliqueFrustumCorrection();
				float dotResult4_g43896 = dot( float4( IN.ase_texcoord10.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection3_g43896 );
				float correctionFactor1_g43881 = dotResult4_g43896;
				float localCorrectedLinearEyeDepth1_g43881 = CorrectedLinearEyeDepth( z1_g43881 , correctionFactor1_g43881 );
				float eyeDepth18_g43881 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_17_0_g43881 = ( eyeDepth18_g43881 - ScreenPos.w );
				float temp_output_13_0_g43881 = ( localCorrectedLinearEyeDepth1_g43881 - abs( temp_output_17_0_g43881 ) );
				float GRAB_SCREEN_DEPTH_BEHIND80_g43868 = saturate( temp_output_13_0_g43881 );
				float4 temp_cast_20 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43869 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float GRAB_SCREEN_DEPTH73_g43868 = localCorrectedLinearEyeDepth1_g43881;
				float4 temp_cast_21 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_22 = (0.001).xxxx;
				float GRAB_SCREEN_CLOSENESS83_g43868 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float4 temp_cast_23 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43869 = temp_cast_23;
				float4 lerpResult281_g43869 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMVERTICAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43869 * _FOAMVERTICAL_TintStrength ) * temp_cast_20 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43869.z + temp_cast_21 ) - temp_cast_22 ) * temp_output_294_0_g43869 ) / ( ( _FOAMVERTICAL_Distance - 0.001 ) * temp_output_294_0_g43869 ) ) ));
				float4 lerpResult265_g43869 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43869 , FlowStrength1147_g43869);
				float3 temp_cast_24 = (0.5).xxx;
				float3 break1161_g43869 = ( abs( WorldNormal ) - temp_cast_24 );
				float _MASK_VERTICAL_Z1162_g43869 = ( break1161_g43869.z + 0.45 );
				float4 lerpResult1173_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_Z1162_g43869);
				float _MASK_VERTICAL_X1170_g43869 = ( break1161_g43869.x + 0.46 );
				float4 lerpResult1176_g43869 = lerp( _MaskVector1 , lerpResult265_g43869 , _MASK_VERTICAL_X1170_g43869);
				float _MASK_VERTICAL_Y1163_g43869 = ( -break1161_g43869.y + 6.5 );
				float4 lerpResult1179_g43869 = lerp( lerpResult1173_g43869 , ( lerpResult1173_g43869 + lerpResult1176_g43869 ) , _MASK_VERTICAL_Y1163_g43869);
				float4 temp_output_1189_0_g43869 = saturate( lerpResult1179_g43869 );
				float4 FOAM_VERTICAL_OFFSHORE655_g43868 = temp_output_1189_0_g43869;
				int m_switch278_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				float4 m_Off278_g43897 = float4( 0,0,0,0 );
				float mulTime806_g43897 = _TimeParameters.x * _FOAMHORIZONTAL_Timescale;
				float Speed1146_g43897 = _FOAMHORIZONTAL_Speed;
				float temp_output_1150_0_g43897 = ( Speed1146_g43897 * 1.0 );
				float2 temp_cast_27 = (temp_output_1150_0_g43897).xx;
				float2 appendResult219_g43897 = (float2(_FOAMHORIZONTAL_TilingX , _FOAMHORIZONTAL_TilingY));
				float2 temp_output_1214_0_g43897 = ( appendResult219_g43897 * float2( 2,2 ) );
				float2 texCoord487_g43897 = IN.ase_texcoord8.xyz.xy * temp_output_1214_0_g43897 + float2( 0,0 );
				float cos485_g43897 = cos( _G_FlowSwirling.x );
				float sin485_g43897 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos485_g43897 , -sin485_g43897 , sin485_g43897 , cos485_g43897 )) + float2( 0,0 );
				float2 panner483_g43897 = ( mulTime806_g43897 * temp_cast_27 + rotator485_g43897);
				float2 temp_cast_28 = (temp_output_1150_0_g43897).xx;
				float cos481_g43897 = cos( _G_FlowSwirling.y );
				float sin481_g43897 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43897 = mul( texCoord487_g43897 - float2( 0,0 ) , float2x2( cos481_g43897 , -sin481_g43897 , sin481_g43897 , cos481_g43897 )) + float2( 0,0 );
				float2 panner480_g43897 = ( mulTime806_g43897 * temp_cast_28 + rotator481_g43897);
				float2 temp_cast_29 = (temp_output_1150_0_g43897).xx;
				float2 panner478_g43897 = ( mulTime806_g43897 * temp_cast_29 + texCoord487_g43897);
				float4 OUT_SWIRLING298_g43897 = ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43897 ) + ( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43897 ) + SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43897 ) ) );
				float4 m_Swirling278_g43897 = OUT_SWIRLING298_g43897;
				float2 texCoord196_g43898 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43898 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43898 = texCoord196_g43898;
				float2 blendOpDest197_g43898 = (_FLOWMAP_Map89_g43898).xy;
				float2 temp_output_197_0_g43898 = ( saturate( (( blendOpDest197_g43898 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43898 ) * ( 1.0 - blendOpSrc197_g43898 ) ) : ( 2.0 * blendOpDest197_g43898 * blendOpSrc197_g43898 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43898 = Speed1146_g43897;
				float temp_output_182_0_g43898 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43898 );
				float temp_output_194_0_g43898 = (0.0 + (( ( temp_output_182_0_g43898 - floor( ( temp_output_182_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float FlowStrength1147_g43897 = _FOAMHORIZONTAL_FlowStrength;
				float _FLOWMAP_FlowStrength146_g43898 = FlowStrength1147_g43897;
				float _TIME_UV_A199_g43898 = ( -temp_output_194_0_g43898 * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult198_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_A199_g43898);
				float2 INPUT_MAP_TILLING128_g43897 = temp_output_1214_0_g43897;
				float2 texCoord205_g43898 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43897 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43898 = texCoord205_g43898;
				float2 FLOW_A201_g43898 = ( lerpResult198_g43898 + TEXTURE_TILLING211_g43898 );
				float temp_output_225_0_g43898 = (temp_output_182_0_g43898*1.0 + 0.5);
				float _TIME_UV_B214_g43898 = ( -(0.0 + (( ( temp_output_225_0_g43898 - floor( ( temp_output_225_0_g43898 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43898 );
				float2 lerpResult229_g43898 = lerp( temp_output_197_0_g43898 , texCoord196_g43898 , _TIME_UV_B214_g43898);
				float2 FLOW_B232_g43898 = ( lerpResult229_g43898 + TEXTURE_TILLING211_g43898 );
				float TIME_BLEND235_g43898 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43898 / 0.5 ) ) ) );
				float4 lerpResult1117_g43897 = lerp( SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43898 ) , SAMPLE_TEXTURE2D( _FOAMHORIZONTAL_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43898 ) , TIME_BLEND235_g43898);
				float4 OUT_FLOW_FLOWMAP1119_g43897 = lerpResult1117_g43897;
				float4 m_FlowMap278_g43897 = OUT_FLOW_FLOWMAP1119_g43897;
				float4 localfloat4switch278_g43897 = float4switch278_g43897( m_switch278_g43897 , m_Off278_g43897 , m_Swirling278_g43897 , m_FlowMap278_g43897 );
				float4 temp_cast_32 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos262_g43897 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float4 temp_cast_33 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_34 = (0.001).xxxx;
				float4 temp_cast_35 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43897 = temp_cast_35;
				float4 lerpResult281_g43897 = lerp( float4( 0,0,0,0 ) , ( ( ( float4( (_FOAMHORIZONTAL_Tint).rgb , 0.0 ) * localfloat4switch278_g43897 * _FOAMHORIZONTAL_TintStrength ) * temp_cast_32 ) / 3.0 ) , saturate( ( ( ( ( unityObjectToViewPos262_g43897.z + temp_cast_33 ) - temp_cast_34 ) * temp_output_294_0_g43897 ) / ( ( _FOAMHORIZONTAL_Distance - 0.001 ) * temp_output_294_0_g43897 ) ) ));
				float4 lerpResult265_g43897 = lerp( float4( 0,0,0,0 ) , lerpResult281_g43897 , FlowStrength1147_g43897);
				float _MASK_HORIZONTAL1160_g43897 = ( ( WorldNormal.y + WorldNormal.y ) - 1.7 );
				float4 lerpResult1185_g43897 = lerp( float4(0.001,0.001,0.001,0) , lerpResult265_g43897 , _MASK_HORIZONTAL1160_g43897);
				float4 temp_output_1188_0_g43897 = saturate( lerpResult1185_g43897 );
				float4 FOAM_HORIZONTAL_OFFSHORE1565_g43868 = temp_output_1188_0_g43897;
				int m_switch278_g43882 = _FoamShoreline_ModeFlowType;
				float4 m_Off278_g43882 = float4( 0,0,0,0 );
				float mulTime806_g43882 = _TimeParameters.x * _FoamShoreline_Timescale;
				float FlowSpeed1179_g43882 = _FoamShoreline_Speed;
				float temp_output_1185_0_g43882 = ( FlowSpeed1179_g43882 * 1.0 );
				float2 temp_cast_38 = (temp_output_1185_0_g43882).xx;
				float2 appendResult219_g43882 = (float2(_TilingX_Shoreline , _TilingY_Shoreline));
				float2 temp_output_1196_0_g43882 = ( appendResult219_g43882 * float2( 2,2 ) );
				float2 INPUT_MAP_TILLING128_g43882 = temp_output_1196_0_g43882;
				float2 texCoord487_g43882 = IN.ase_texcoord8.xyz.xy * INPUT_MAP_TILLING128_g43882 + float2( 0,0 );
				float cos485_g43882 = cos( _G_FlowSwirling.x );
				float sin485_g43882 = sin( _G_FlowSwirling.x );
				float2 rotator485_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos485_g43882 , -sin485_g43882 , sin485_g43882 , cos485_g43882 )) + float2( 0,0 );
				float2 panner483_g43882 = ( mulTime806_g43882 * temp_cast_38 + rotator485_g43882);
				float2 temp_cast_39 = (temp_output_1185_0_g43882).xx;
				float cos481_g43882 = cos( _G_FlowSwirling.y );
				float sin481_g43882 = sin( _G_FlowSwirling.y );
				float2 rotator481_g43882 = mul( texCoord487_g43882 - float2( 0,0 ) , float2x2( cos481_g43882 , -sin481_g43882 , sin481_g43882 , cos481_g43882 )) + float2( 0,0 );
				float2 panner480_g43882 = ( mulTime806_g43882 * temp_cast_39 + rotator481_g43882);
				float2 temp_cast_40 = (temp_output_1185_0_g43882).xx;
				float2 panner478_g43882 = ( mulTime806_g43882 * temp_cast_40 + texCoord487_g43882);
				float4 OUT_SWIRLING298_g43882 = ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner483_g43882 ) + ( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner480_g43882 ) + SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, panner478_g43882 ) ) );
				float4 m_Swirling278_g43882 = OUT_SWIRLING298_g43882;
				float2 texCoord196_g43884 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float4 _FLOWMAP_Map89_g43884 = IN.ase_texcoord9;
				float2 blendOpSrc197_g43884 = texCoord196_g43884;
				float2 blendOpDest197_g43884 = (_FLOWMAP_Map89_g43884).xy;
				float2 temp_output_197_0_g43884 = ( saturate( (( blendOpDest197_g43884 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest197_g43884 ) * ( 1.0 - blendOpSrc197_g43884 ) ) : ( 2.0 * blendOpDest197_g43884 * blendOpSrc197_g43884 ) ) ));
				float _FLOWMAP_FlowSpeed148_g43884 = _FoamShoreline_Speed;
				float temp_output_182_0_g43884 = ( _TimeParameters.x * _FLOWMAP_FlowSpeed148_g43884 );
				float temp_output_194_0_g43884 = (0.0 + (( ( temp_output_182_0_g43884 - floor( ( temp_output_182_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float _FLOWMAP_FlowStrength146_g43884 = _FoamShoreline_FlowStrength;
				float _TIME_UV_A199_g43884 = ( -temp_output_194_0_g43884 * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult198_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_A199_g43884);
				float2 texCoord205_g43884 = IN.ase_texcoord8.xyz.xy * temp_output_1196_0_g43882 + float2( 0,0 );
				float2 TEXTURE_TILLING211_g43884 = texCoord205_g43884;
				float2 FLOW_A201_g43884 = ( lerpResult198_g43884 + TEXTURE_TILLING211_g43884 );
				float temp_output_225_0_g43884 = (temp_output_182_0_g43884*1.0 + 0.5);
				float _TIME_UV_B214_g43884 = ( -(0.0 + (( ( temp_output_225_0_g43884 - floor( ( temp_output_225_0_g43884 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _FLOWMAP_FlowStrength146_g43884 );
				float2 lerpResult229_g43884 = lerp( temp_output_197_0_g43884 , texCoord196_g43884 , _TIME_UV_B214_g43884);
				float2 FLOW_B232_g43884 = ( lerpResult229_g43884 + TEXTURE_TILLING211_g43884 );
				float TIME_BLEND235_g43884 = saturate( abs( ( 1.0 - ( temp_output_194_0_g43884 / 0.5 ) ) ) );
				float4 lerpResult1153_g43882 = lerp( SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_A201_g43884 ) , SAMPLE_TEXTURE2D( _FoamShoreline_FoamMap, sampler_trilinear_repeat_aniso2, FLOW_B232_g43884 ) , TIME_BLEND235_g43884);
				float4 OUT_FLOW_FLOWMAP1156_g43882 = lerpResult1153_g43882;
				float4 m_FlowMap278_g43882 = OUT_FLOW_FLOWMAP1156_g43882;
				float4 localfloat4switch278_g43882 = float4switch278_g43882( m_switch278_g43882 , m_Off278_g43882 , m_Swirling278_g43882 , m_FlowMap278_g43882 );
				float4 temp_cast_43 = (GRAB_SCREEN_DEPTH_BEHIND80_g43868).xxxx;
				float3 unityObjectToViewPos731_g43882 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord10.xyz) );
				float4 temp_cast_44 = (GRAB_SCREEN_DEPTH73_g43868).xxxx;
				float4 temp_cast_45 = (0.4125228).xxxx;
				float4 temp_cast_46 = (GRAB_SCREEN_CLOSENESS83_g43868).xxxx;
				float4 temp_output_294_0_g43882 = temp_cast_46;
				float4 lerpResult769_g43882 = lerp( ( ( float4( (_FoamShoreline_Tint).rgb , 0.0 ) * localfloat4switch278_g43882 * _FoamShoreline_TintStrength ) * temp_cast_43 ) , float4( 0,0,0,0 ) , saturate( ( ( ( ( unityObjectToViewPos731_g43882.z + temp_cast_44 ) - temp_cast_45 ) * temp_output_294_0_g43882 ) / ( ( _FoamShoreline_Distance - 0.4125228 ) * temp_output_294_0_g43882 ) ) ));
				float FlowStrength1182_g43882 = _FoamShoreline_FlowStrength;
				float4 lerpResult761_g43882 = lerp( float4( 0,0,0,0 ) , lerpResult769_g43882 , FlowStrength1182_g43882);
				float4 FOAM_SHORELINE654_g43868 = lerpResult761_g43882;
				float4 temp_output_1492_0_g43868 = ( ( ( lerpResult105_g43868 + FOAM_VERTICAL_OFFSHORE655_g43868 ) + FOAM_HORIZONTAL_OFFSHORE1565_g43868 ) + FOAM_SHORELINE654_g43868 );
				float4 ALBEDO_IN60_g43873 = temp_output_1492_0_g43868;
				float4 m_Off119_g43873 = ALBEDO_IN60_g43873;
				int REFLECTION_MODE_URP123_g43873 = _Reflection_ModeURP;
				int m_switch124_g43873 = REFLECTION_MODE_URP123_g43873;
				float4 m_Off124_g43873 = float4( 0,0,0,0 );
				float3 NORMAL_OUT_Z505_g43868 = weightedBlend1711_g43868;
				float3 temp_output_53_0_g43873 = NORMAL_OUT_Z505_g43868;
				float3 NORMAL_IN106_g43873 = temp_output_53_0_g43873;
				float2 temp_cast_49 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_50 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g43873 = clamp( ( (( NORMAL_IN106_g43873 * 50.0 )).xy * _Reflection_BumpScale ) , temp_cast_49 , temp_cast_50 );
				float2 REFLECTION_BUMP9_g43873 = clampResult29_g43873;
				float4 appendResult103_g43873 = (float4(1.0 , 0.0 , 1.0 , temp_output_53_0_g43873.x));
				float3 unpack104_g43873 = UnpackNormalScale( appendResult103_g43873, 0.15 );
				unpack104_g43873.z = lerp( 1, unpack104_g43873.z, saturate(0.15) );
				float3 NORMAL_IN_Z54_g43873 = unpack104_g43873;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 worldRefl24_g43873 = reflect( -WorldViewDirection, float3( dot( tanToWorld0, NORMAL_IN_Z54_g43873 ), dot( tanToWorld1, NORMAL_IN_Z54_g43873 ), dot( tanToWorld2, NORMAL_IN_Z54_g43873 ) ) );
				float REFLECTION_WOBBLE13_g43873 = _Reflection_Wobble;
				float4 texCUBENode31_g43873 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat_aniso2, ( float3( REFLECTION_BUMP9_g43873 ,  0.0 ) + worldRefl24_g43873 + REFLECTION_WOBBLE13_g43873 ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_52 = (texCUBENode31_g43873.r).xxxx;
				float REFLECTION_CLOUD12_g43873 = _Reflection_Cloud;
				float4 lerpResult49_g43873 = lerp( texCUBENode31_g43873 , temp_cast_52 , REFLECTION_CLOUD12_g43873);
				float4 m_ActiveCubeMap124_g43873 = lerpResult49_g43873;
				float3 temp_output_109_0_g43873 = SHADERGRAPH_REFLECTION_PROBE(WorldViewDirection,float3( ( REFLECTION_BUMP9_g43873 + REFLECTION_WOBBLE13_g43873 ) ,  0.0 ),_Reflection_LOD);
				float3 temp_cast_55 = (temp_output_109_0_g43873.x).xxx;
				float3 lerpResult115_g43873 = lerp( temp_output_109_0_g43873 , temp_cast_55 , REFLECTION_CLOUD12_g43873);
				float4 appendResult127_g43873 = (float4(lerpResult115_g43873 , 0.0));
				float4 m_ActiveProbe124_g43873 = appendResult127_g43873;
				float4 localfloat4switch124_g43873 = float4switch124_g43873( m_switch124_g43873 , m_Off124_g43873 , m_ActiveCubeMap124_g43873 , m_ActiveProbe124_g43873 );
				float fresnelNdotV23_g43873 = dot( WorldNormal, WorldViewDirection );
				float fresnelNode23_g43873 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g43873 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g43873 = ( _Reflection_FresnelStrength * fresnelNode23_g43873 );
				float4 lerpResult73_g43873 = lerp( float4( 0,0,0,0 ) , localfloat4switch124_g43873 , REFLECTION_FRESNEL11_g43873);
				float4 lerpResult133_g43873 = lerp( localfloat4switch124_g43873 , lerpResult73_g43873 , _Reflection_FresnelMode);
				float4 switchResult85_g43873 = (((ase_vface>0)?(lerpResult133_g43873):(float4( 0,0,0,0 ))));
				float4 temp_cast_57 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch95_g43873 = temp_cast_57;
				#else
				float4 staticSwitch95_g43873 = ( ( ( 1.0 - 0.5 ) * switchResult85_g43873 ) + ( ALBEDO_IN60_g43873 * 0.5 ) );
				#endif
				float4 m_ActiveCubeMap119_g43873 = staticSwitch95_g43873;
				float4 m_ActiveProbe119_g43873 = staticSwitch95_g43873;
				float4 localfloat4switch119_g43873 = float4switch119_g43873( m_switch119_g43873 , m_Off119_g43873 , m_ActiveCubeMap119_g43873 , m_ActiveProbe119_g43873 );
				
				int ModeFlowType1245_g43869 = _FOAMVERTICAL_ModeFlowType;
				int m_switch1246_g43869 = ModeFlowType1245_g43869;
				float3 m_Off1246_g43869 = float3( 0,0,1 );
				float3 temp_output_21_0_g43871 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43871 = cross( WorldNormal , ddy( temp_output_21_0_g43871 ) );
				float3 temp_output_6_0_g43871 = ddx( temp_output_21_0_g43871 );
				float dotResult27_g43871 = dot( temp_output_15_0_g43871 , temp_output_6_0_g43871 );
				float temp_output_14_0_g43871 = abs( dotResult27_g43871 );
				float4 temp_output_8_0_g43871 = ( _FOAMVERTICAL_NormalStrength * temp_output_1189_0_g43869 );
				float4 break18_g43871 = ( sign( temp_output_14_0_g43871 ) * ( ( ddx( temp_output_8_0_g43871 ) * float4( temp_output_15_0_g43871 , 0.0 ) ) + ( ddy( temp_output_8_0_g43871 ) * float4( cross( WorldNormal , temp_output_6_0_g43871 ) , 0.0 ) ) ) );
				float3 appendResult7_g43871 = (float3(break18_g43871.x , -break18_g43871.y , break18_g43871.z));
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir5_g43871 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43871 * WorldNormal ) - appendResult7_g43871 )) );
				float3 temp_output_1249_32_g43869 = worldToTangentDir5_g43871;
				float3 m_Swirling1246_g43869 = temp_output_1249_32_g43869;
				float3 m_FlowMap1246_g43869 = temp_output_1249_32_g43869;
				float3 localfloat3switch1246_g43869 = float3switch1246_g43869( m_switch1246_g43869 , m_Off1246_g43869 , m_Swirling1246_g43869 , m_FlowMap1246_g43869 );
				float3 FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 = localfloat3switch1246_g43869;
				int ModeFlowType1232_g43897 = _FOAMHORIZONTAL_ModeFlowType;
				int m_switch1230_g43897 = ModeFlowType1232_g43897;
				float3 m_Off1230_g43897 = float3( 0,0,1 );
				float3 temp_output_21_0_g43899 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43899 = cross( WorldNormal , ddy( temp_output_21_0_g43899 ) );
				float3 temp_output_6_0_g43899 = ddx( temp_output_21_0_g43899 );
				float dotResult27_g43899 = dot( temp_output_15_0_g43899 , temp_output_6_0_g43899 );
				float temp_output_14_0_g43899 = abs( dotResult27_g43899 );
				float4 temp_output_8_0_g43899 = ( _FOAMHORIZONTAL_NormalStrength * temp_output_1188_0_g43897 );
				float4 break18_g43899 = ( sign( temp_output_14_0_g43899 ) * ( ( ddx( temp_output_8_0_g43899 ) * float4( temp_output_15_0_g43899 , 0.0 ) ) + ( ddy( temp_output_8_0_g43899 ) * float4( cross( WorldNormal , temp_output_6_0_g43899 ) , 0.0 ) ) ) );
				float3 appendResult7_g43899 = (float3(break18_g43899.x , -break18_g43899.y , break18_g43899.z));
				float3 worldToTangentDir5_g43899 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43899 * WorldNormal ) - appendResult7_g43899 )) );
				float3 temp_output_1233_32_g43897 = worldToTangentDir5_g43899;
				float3 m_Swirling1230_g43897 = temp_output_1233_32_g43897;
				float3 m_FlowMap1230_g43897 = temp_output_1233_32_g43897;
				float3 localfloat3switch1230_g43897 = float3switch1230_g43897( m_switch1230_g43897 , m_Off1230_g43897 , m_Swirling1230_g43897 , m_FlowMap1230_g43897 );
				float3 FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 = localfloat3switch1230_g43897;
				int ModeFlowType1225_g43882 = _FoamShoreline_ModeFlowType;
				int m_switch1223_g43882 = ModeFlowType1225_g43882;
				float3 m_Off1223_g43882 = float3( 0,0,1 );
				float3 temp_output_21_0_g43883 = ( IN.ase_texcoord10.xyz * 500.0 );
				float3 temp_output_15_0_g43883 = cross( WorldNormal , ddy( temp_output_21_0_g43883 ) );
				float3 temp_output_6_0_g43883 = ddx( temp_output_21_0_g43883 );
				float dotResult27_g43883 = dot( temp_output_15_0_g43883 , temp_output_6_0_g43883 );
				float temp_output_14_0_g43883 = abs( dotResult27_g43883 );
				float4 temp_output_8_0_g43883 = ( _FoamShoreline_NormalStrength * lerpResult761_g43882 );
				float4 break18_g43883 = ( sign( temp_output_14_0_g43883 ) * ( ( ddx( temp_output_8_0_g43883 ) * float4( temp_output_15_0_g43883 , 0.0 ) ) + ( ddy( temp_output_8_0_g43883 ) * float4( cross( WorldNormal , temp_output_6_0_g43883 ) , 0.0 ) ) ) );
				float3 appendResult7_g43883 = (float3(break18_g43883.x , -break18_g43883.y , break18_g43883.z));
				float3 worldToTangentDir5_g43883 = ASESafeNormalize( mul( ase_worldToTangent, ( ( temp_output_14_0_g43883 * WorldNormal ) - appendResult7_g43883 )) );
				float3 temp_output_1222_32_g43882 = worldToTangentDir5_g43883;
				float3 m_Swirling1223_g43882 = temp_output_1222_32_g43882;
				float3 m_FlowMap1223_g43882 = temp_output_1222_32_g43882;
				float3 localfloat3switch1223_g43882 = float3switch1223_g43882( m_switch1223_g43882 , m_Off1223_g43882 , m_Swirling1223_g43882 , m_FlowMap1223_g43882 );
				float3 FOAM_NORMALShorline1208_g43868 = localfloat3switch1223_g43882;
				float3 temp_output_1715_0_g43868 = BlendNormal( BlendNormal( BlendNormal( weightedBlend1711_g43868 , FOAM_VERTICAL_OFFSHORE_NORMAL1192_g43868 ) , FOAM_HORIZONTAL_OFFSHORE_NORMAL1564_g43868 ) , FOAM_NORMALShorline1208_g43868 );
				float3 worldPosValue71_g43895 = WorldPosition;
				float3 WorldPosition66_g43895 = worldPosValue71_g43895;
				float3 NORMAL_OUT1731_g43868 = temp_output_1715_0_g43868;
				float3 temp_output_16_0_g43895 = NORMAL_OUT1731_g43868;
				float3 lerpResult163_g43895 = lerp( ( WorldTangent * temp_output_16_0_g43895.x ) , ( WorldBiTangent * temp_output_16_0_g43895.y ) , ( WorldNormal * temp_output_16_0_g43895.z ));
				float3 NORMAL_PERPIXEL136_g43895 = lerpResult163_g43895;
				float3 WorldNormal66_g43895 = NORMAL_PERPIXEL136_g43895;
				float3 WorldView66_g43895 = WorldViewDirection;
				float3 temp_output_1_0_g43895 = _URP_SpecularColor.rgb;
				float3 SpecColor66_g43895 = (temp_output_1_0_g43895).xyz;
				float temp_output_173_0_g43895 = ( 1.0 - _URP_SpecularStrength );
				float Smoothness66_g43895 = temp_output_173_0_g43895;
				float4 shadowMaskValue77_g43895 = float4(1,1,1,1);
				float4 ShadowMask66_g43895 = shadowMaskValue77_g43895;
				float3 localAdditionalLightsSpecularMask66_g43895 = AdditionalLightsSpecularMask( WorldPosition66_g43895 , WorldNormal66_g43895 , WorldView66_g43895 , SpecColor66_g43895 , Smoothness66_g43895 , ShadowMask66_g43895 );
				float3 ADDITIONAL_LIGHT1730_g43868 = localAdditionalLightsSpecularMask66_g43895;
				float3 temp_output_1732_0_g43868 = ( temp_output_1715_0_g43868 + ADDITIONAL_LIGHT1730_g43868 );
				
				float temp_output_43_0_g43893 = _SpecularMode;
				float m_switch18_g43893 = temp_output_43_0_g43893;
				float3 m_Off18_g43893 = float3( 0,0,0 );
				float3 tanNormal37_g43893 = temp_output_1732_0_g43868;
				float3 worldNormal37_g43893 = float3(dot(tanToWorld0,tanNormal37_g43893), dot(tanToWorld1,tanNormal37_g43893), dot(tanToWorld2,tanNormal37_g43893));
				float3 normalizeResult20_g43893 = normalize( worldNormal37_g43893 );
				float3 normalizeResult27_g43893 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult19_g43893 = dot( normalizeResult20_g43893 , normalizeResult27_g43893 );
				float temp_output_48_0_g43893 = _SpecularWrap;
				float temp_output_46_0_g43893 = (dotResult19_g43893*temp_output_48_0_g43893 + temp_output_48_0_g43893);
				float saferPower25_g43893 = abs( ( temp_output_46_0_g43893 * temp_output_46_0_g43893 * temp_output_46_0_g43893 ) );
				float _SPECULAR_Mode22_g43893 = temp_output_43_0_g43893;
				float m_switch31_g43893 = _SPECULAR_Mode22_g43893;
				float3 m_Off31_g43893 = float3( 0,0,0 );
				float3 temp_output_16_0_g43893 = (_SpecularColor).rgb;
				float3 m_Active31_g43893 = temp_output_16_0_g43893;
				float3 clampResult5_g43893 = clamp( temp_output_16_0_g43893 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp31_g43893 = clampResult5_g43893;
				float3 localfloat3switch31_g43893 = float3switch31_g43893( m_switch31_g43893 , m_Off31_g43893 , m_Active31_g43893 , m_ActiveClamp31_g43893 );
				float m_switch11_g43893 = _SPECULAR_Mode22_g43893;
				float3 m_Off11_g43893 = float3( 0,0,0 );
				float3 temp_output_4_0_g43893 = (_MainLightColor).rgb;
				float3 m_Active11_g43893 = temp_output_4_0_g43893;
				float3 clampResult9_g43893 = clamp( temp_output_4_0_g43893 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 m_ActiveClamp11_g43893 = clampResult9_g43893;
				float3 localfloat3switch11_g43893 = float3switch11_g43893( m_switch11_g43893 , m_Off11_g43893 , m_Active11_g43893 , m_ActiveClamp11_g43893 );
				float3 temp_output_24_0_g43893 = saturate( ( pow( saferPower25_g43893 , ( 1.0 - _Shininess ) ) * saturate( ( localfloat3switch31_g43893 * localfloat3switch11_g43893 ) ) ) );
				float3 m_Active18_g43893 = temp_output_24_0_g43893;
				float3 m_ActiveClamp18_g43893 = temp_output_24_0_g43893;
				float3 localfloat3switch18_g43893 = float3switch18_g43893( m_switch18_g43893 , m_Off18_g43893 , m_Active18_g43893 , m_ActiveClamp18_g43893 );
				
				float temp_output_1454_0_g43868 = ( _SMOOTHNESS_Strength * _SMOOTHNESS_Strength );
				float3 temp_cast_68 = (temp_output_1454_0_g43868).xxx;
				float3 tanNormal1601_g43868 = NORMAL_OUT_Z505_g43868;
				float3 worldNormal1601_g43868 = float3(dot(tanToWorld0,tanNormal1601_g43868), dot(tanToWorld1,tanNormal1601_g43868), dot(tanToWorld2,tanNormal1601_g43868));
				float fresnelNdotV1412_g43868 = dot( worldNormal1601_g43868, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1412_g43868 = ( _SMOOTHNESS_FresnelBias + _SMOOTHNESS_FresnelScale * pow( max( 1.0 - fresnelNdotV1412_g43868 , 0.0001 ), _SMOOTHNESS_FresnelPower ) );
				float3 lerpResult1403_g43868 = lerp( temp_cast_68 , ( temp_output_1454_0_g43868 * worldNormal1601_g43868 ) , ( fresnelNode1412_g43868 * ( 1.0 - fresnelNode1412_g43868 ) ));
				float3 clampResult1740_g43868 = clamp( lerpResult1403_g43868 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				
				float3 Albedo = localfloat4switch119_g43873.rgb;
				float3 Normal = temp_output_1732_0_g43868;
				float3 Emission = 0;
				float3 Specular = localfloat3switch18_g43893;
				float Metallic = 0;
				float Smoothness = clampResult1740_g43868.x;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.clipPos;
				inputData.shadowCoord = ShadowCoords;



				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif
					
				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );



				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(WorldPosition, 1.0),  IN.fogFactorAndVertexLight.x);
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				

				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.clipPos,
						Albedo,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(Albedo, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;
				
				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif
				
				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				
				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb);
			}

			ENDHLSL
		}

		
        Pass
        {
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }
        
			Cull Off

			HLSLPROGRAM
        
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define ASE_USING_SAMPLING_MACROS 1

        
			#pragma only_renderers d3d11 glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);


				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif
			
			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;


				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}

			ENDHLSL
        }

		
        Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }
        
			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma only_renderers d3d11 glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag

        
			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY
			

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _CLUSTERED_RENDERING
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma instancing_options renderinglayer


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _FOAMHORIZONTAL_Tint;
			half4 _SpecularColor;
			float4 _DepthTint;
			float4 _ShorelineTint;
			float4 _MidwaterTint;
			float4 _FoamShoreline_Tint;
			half4 _URP_SpecularColor;
			float4 _FOAMVERTICAL_Tint;
			half _EmissionFlags;
			float _FoamShoreline_Distance;
			float _FoamShoreline_TintStrength;
			float _FoamShoreline_FlowStrength;
			float _TilingY_Shoreline;
			float _TilingX_Shoreline;
			int _FoamShoreline_ModeFlowType;
			float _FoamShoreline_Timescale;
			float _Reflection_BumpScale;
			float _FOAMHORIZONTAL_Distance;
			float _FOAMHORIZONTAL_TintStrength;
			float _FOAMHORIZONTAL_FlowStrength;
			float _FoamShoreline_Speed;
			float _Reflection_BumpClamp;
			float _Reflection_Cloud;
			float _Reflection_Smoothness;
			float _SMOOTHNESS_FresnelBias;
			float _SMOOTHNESS_Strength;
			half _Shininess;
			float _SpecularWrap;
			half _SpecularMode;
			float _URP_SpecularStrength;
			float _FoamShoreline_NormalStrength;
			float _FOAMHORIZONTAL_NormalStrength;
			float _FOAMVERTICAL_NormalStrength;
			float _Reflection_FresnelMode;
			float _Reflection_FresnelScale;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelStrength;
			float _Reflection_LOD;
			float _FOAMHORIZONTAL_TilingY;
			float _Reflection_Wobble;
			float _FOAMHORIZONTAL_TilingX;
			int _FOAMHORIZONTAL_ModeFlowType;
			float _FOAMHORIZONTAL_Timescale;
			float _WaterNormal_Horizontal_FlowStrength;
			float _WaterNormal_Horizontal_NormalStrength;
			float _WaterNormal_Horizontal_TilingY;
			float _WaterNormal_Horizontal_TilingX;
			float _WaterNormal_Horizontal_Speed;
			float _WaterNormal_Horizontal_Timescale;
			int _WaterNormal_Horizontal_FlowType;
			float _DepthOffset;
			float _ShorelineOffset;
			float _ShorelineDepth;
			int _Reflection_ModeURP;
			int _ColorMask;
			int _ZWriteMode;
			int _RenderFace;
			float _AlphatoCoverage;
			int _WaterNormal_Vertical_FlowType;
			float _FOAMHORIZONTAL_Speed;
			float _WaterNormal_Vertical_Timescale;
			float _WaterNormal_Vertical_TilingX;
			float _SMOOTHNESS_FresnelScale;
			float _FOAMVERTICAL_Distance;
			float _FOAMVERTICAL_TintStrength;
			float _FOAMVERTICAL_FlowStrength;
			float _FOAMVERTICAL_TilingY;
			float _FOAMVERTICAL_TilingX;
			float _FOAMVERTICAL_Speed;
			float _FOAMVERTICAL_Timescale;
			int _FOAMVERTICAL_ModeFlowType;
			float _Opacity;
			float _OpacityShoreline;
			float _RefractionScale;
			float _WaterNormal_Vertical_FlowStrength;
			float _WaterNormal_Vertical_NormalStrength;
			float _WaterNormal_Vertical_TilingY;
			float _WaterNormal_Vertical_Speed;
			float _SMOOTHNESS_FresnelPower;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

        
			float4 _SelectionID;

        
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);


				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;


				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;
				
				return outColor;
			}
        
			ENDHLSL
        }
		
	}
	
	CustomEditor "DE_ShaderGUI"
	
	
}
/*ASEBEGIN
Version=18934
71;29.5;1654.5;850.5;560.1722;3516.432;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;1011;200.1968,-2582.621;Inherit;False;295.6667;110;DESF Utility ASE Compile Shaders;1;1012;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1018;534.1652,-3244.926;Inherit;False;255.6026;356.7736;DEBUG SETTINGS ;4;700;698;993;964;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1017;200.0641,-3247.029;Inherit;False;328.6918;357.9233;GLOBAL SETTINGS ;2;1021;1024;;0,0,0,1;0;0
Node;AmplifyShaderEditor.IntNode;698;566.8671,-3134.187;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;700;568.6641,-3206.174;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;993;569.6803,-3064.164;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1010;-110.4706,-2872.287;Inherit;False;DESF Core Water URP;9;;43868;2ce30b88128d2f64bb175b3da03ff631;9,1745,7,169,1,212,1,1081,0,440,0,438,0,310,0,1078,0,1079,0;0;7;COLOR;0;FLOAT3;123;FLOAT3;1651;FLOAT3;122;FLOAT;419;FLOAT;417;FLOAT;1080
Node;AmplifyShaderEditor.RangedFloatNode;964;568.2931,-2994.947;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1012;211.1968,-2544.621;Inherit;False;DESF Utility ASE Compile Shaders;-1;;43867;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1021;223.0778,-3130.432;Inherit;False;DESF GUI URP Surface 12x;4;;43866;5d06ad93833bfc946bb66c05fd580bef;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1024;222.8279,-3206.182;Inherit;False;Property;_RenderFace;Render Face;3;2;[Header];[Enum];Create;False;1;SURFACE OPTIONS;0;1;Front,2,Back,1,Both,0;True;0;False;2;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1007;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;True;2;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;987;98.13091,-3049.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;988;198.1309,-2867.459;Float;False;True;-1;2;DE_ShaderGUI;0;2;DEC/Water/Water Lake Simple;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;19;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;964;True;True;0;True;1024;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;4;True;18;all;0;False;True;2;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;False;False;False;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;40;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,-1;0;Translucency;0;0;  Translucency Strength;1,False,-1;0;  Normal Distortion;0.5,False,-1;0;  Scattering;2,False,-1;0;  Direct;0.9,False,-1;0;  Ambient;0.1,False,-1;0;  Shadow;0.5,False,-1;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,388;0;  Type;0;0;  Tess;16,True,386;0;  Min;10,True,387;0;  Max;25,True,385;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;992;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;True;2;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1022;198.1309,-2787.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;True;4;d3d11;glcore;gles;gles3;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1006;198.1309,-2807.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;990;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1023;198.1309,-2787.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;True;4;d3d11;glcore;gles;gles3;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;991;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;989;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;988;0;1010;0
WireConnection;988;1;1010;123
WireConnection;988;9;1010;1651
WireConnection;988;4;1010;122
ASEEND*/
//CHKSM=E340AAEF7CC672A3F21F9836B7E184A0F4898FDD