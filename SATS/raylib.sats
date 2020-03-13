(**
 ** [ raylib ]
 **  
 ** raw raylib bindings for ATS2
 **
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)
%{#
#include "raylib.h"
%}

macdef RLAPI = $extval(int, "RLAPI")

macdef MAX_TOUCH_POINTS = $extval(int, "MAX_TOUCH_POINTS")

macdef PI = $extval(float, "PI")
macdef RAD2DEG = $extval(float, "RAD2DEG")
macdef DEG2RAD = $extval(float, "DEG2RAD")

//macdef SubText = $extval(int, "SubText")
//macdef ShowWindow = $extval(int, "ShowWindow")
//macdef FormatText = $extval(int, "FormatText")



//macdef RL_MALLOC(sz) = $extval(int, "RL_MALLOC(sz)")
//macdef RL_CALLOC(n,sz) = $extval(int, "RL_CALLOC(n,sz)")
//macdef RL_FREE(ptr) = $extval(int, "RL_FREE(ptr)")
//macdef RL_REALLOC(ptr,sz) = $extval(int, "RL_REALLOC(ptr,sz)")
(**  **)

typedef Vector2 = $extype_struct"Vector2" of {
   x = float
 , y = float
}

typedef Vector3 = $extype_struct"Vector3" of {
   x = float
 , y = float
 , z = float
}

typedef Vector4 = $extype_struct"Vector4" of {
   x = float
 , y = float
 , z = float
 , w = float
}

typedef Quaternion = Vector4

(** NOTE:
    These were added for dependently-typed uniform vars.
    See `ShaderUniformDataType`
 **)
typedef IVector2 = @{
   x = int32
 , y = int32
}

typedef IVector3 = @{
   x = int32
 , y = int32
 , z = int32
}

typedef IVector4 = @{
   x = int32
 , y = int32
 , z = int32
 , w = int32
}

typedef Matrix = $extype_struct"Matrix" of {
   m0 = float
 , m4 = float
 , m8 = float
 , m12 = float
 , m1 = float
 , m5 = float
 , m9 = float
 , m13 = float
 , m2 = float
 , m6 = float
 , m10 = float
 , m14 = float
 , m3 = float
 , m7 = float
 , m11 = float
 , m15 = float
}

typedef Color = $extype_struct"Color" of {
   r = uchar
 , g = uchar
 , b = uchar
 , a = uchar
}

macdef RAYWHITE = $extval(Color, "RAYWHITE")
macdef ORANGE = $extval(Color, "ORANGE")
macdef PINK = $extval(Color, "PINK")
macdef DARKPURPLE = $extval(Color, "DARKPURPLE")
macdef WHITE = $extval(Color, "WHITE")
macdef MAROON = $extval(Color, "MAROON")
macdef DARKGREEN = $extval(Color, "DARKGREEN")
macdef GRAY = $extval(Color, "GRAY")
macdef RED = $extval(Color, "RED")
macdef SKYBLUE = $extval(Color, "SKYBLUE")
macdef MAGENTA = $extval(Color, "MAGENTA")
macdef DARKBROWN = $extval(Color, "DARKBROWN")
macdef YELLOW = $extval(Color, "YELLOW")
macdef PURPLE = $extval(Color, "PURPLE")
macdef BEIGE = $extval(Color, "BEIGE")
macdef DARKBLUE = $extval(Color, "DARKBLUE")
macdef GREEN = $extval(Color, "GREEN")
macdef DARKGRAY = $extval(Color, "DARKGRAY")
macdef VIOLET = $extval(Color, "VIOLET")
macdef BLACK = $extval(Color, "BLACK")
macdef BLANK = $extval(Color, "BLANK")
macdef BROWN = $extval(Color, "BROWN")
macdef BLUE = $extval(Color, "BLUE")
macdef GOLD = $extval(Color, "GOLD")
macdef LIGHTGRAY = $extval(Color, "LIGHTGRAY")
macdef LIME = $extval(Color, "LIME")

typedef Rectangle = $extype_struct"Rectangle" of {
   x = float
 , y = float
 , width = float
 , height = float
}

abst@ype PixelFormat = $extype"PixelFormat"

macdef UNCOMPRESSED_GRAYSCALE = $extval(PixelFormat,"UNCOMPRESSED_GRAYSCALE")
macdef UNCOMPRESSED_GRAY_ALPHA = $extval(PixelFormat,"UNCOMPRESSED_GRAY_ALPHA")
macdef UNCOMPRESSED_R5G6B5 = $extval(PixelFormat,"UNCOMPRESSED_R5G6B5")
macdef UNCOMPRESSED_R8G8B8 = $extval(PixelFormat,"UNCOMPRESSED_R8G8B8")
macdef UNCOMPRESSED_R5G5B5A1 = $extval(PixelFormat,"UNCOMPRESSED_R5G5B5A1")
macdef UNCOMPRESSED_R4G4B4A4 = $extval(PixelFormat,"UNCOMPRESSED_R4G4B4A4")
macdef UNCOMPRESSED_R8G8B8A8 = $extval(PixelFormat,"UNCOMPRESSED_R8G8B8A8")
macdef UNCOMPRESSED_R32 = $extval(PixelFormat,"UNCOMPRESSED_R32")
macdef UNCOMPRESSED_R32G32B32 = $extval(PixelFormat,"UNCOMPRESSED_R32G32B32")
macdef UNCOMPRESSED_R32G32B32A32 = $extval(PixelFormat,"UNCOMPRESSED_R32G32B32A32")
macdef COMPRESSED_DXT1_RGB = $extval(PixelFormat,"COMPRESSED_DXT1_RGB")
macdef COMPRESSED_DXT1_RGBA = $extval(PixelFormat,"COMPRESSED_DXT1_RGBA")
macdef COMPRESSED_DXT3_RGBA = $extval(PixelFormat,"COMPRESSED_DXT3_RGBA")
macdef COMPRESSED_DXT5_RGBA = $extval(PixelFormat,"COMPRESSED_DXT5_RGBA")
macdef COMPRESSED_ETC1_RGB = $extval(PixelFormat,"COMPRESSED_ETC1_RGB")
macdef COMPRESSED_ETC2_RGB = $extval(PixelFormat,"COMPRESSED_ETC2_RGB")
macdef COMPRESSED_ETC2_EAC_RGBA = $extval(PixelFormat,"COMPRESSED_ETC2_EAC_RGBA")
macdef COMPRESSED_PVRT_RGB = $extval(PixelFormat,"COMPRESSED_PVRT_RGB")
macdef COMPRESSED_PVRT_RGBA = $extval(PixelFormat,"COMPRESSED_PVRT_RGBA")
macdef COMPRESSED_ASTC_4x4_RGBA = $extval(PixelFormat,"COMPRESSED_ASTC_4x4_RGBA")
macdef COMPRESSED_ASTC_8x8_RGBA = $extval(PixelFormat,"COMPRESSED_ASTC_8x8_RGBA")

absvtype PixelData(l:addr) = ptr l
vtypedef Image(l:addr) = $extype_struct"Image" of {
   data = PixelData(l)
 , width = int
 , height = int
 , mipmaps = int
 , format = PixelFormat
}
vtypedef Image = [l:addr] Image(l)

absvt@ype TextureId = uint
vtypedef Texture2D = $extype_struct"Texture2D" of {
   id = TextureId
 , width = int
 , height = int
 , mipmaps = int
 , format = PixelFormat
}

vtypedef Texture = Texture2D

vtypedef TextureCubemap = Texture2D

absvt@ype FrameBufferId = uint
vtypedef RenderTexture2D = $extype_struct"RenderTexture2D" of {
   id = FrameBufferId
 , texture = Texture2D
 , depth = Texture2D
 , depthTexture = bool
}

vtypedef RenderTexture = RenderTexture2D

abst@ype NPatchType = $extype"NPatchType"

macdef NPT_9PATCH = $extval(NPatchType,"NPT_9PATCH")
macdef NPT_3PATCH_VERTICAL = $extval(NPatchType,"NPT_3PATCH_VERTICAL")
macdef NPT_3PATCH_HORIZONTAL = $extval(NPatchType,"NPT_3PATCH_HORIZONTAL")

typedef NPatchInfo = $extype_struct"NPatchInfo" of {
   sourceRec = Rectangle
 , left = int
 , top = int
 , right = int
 , bottom = int
 , type = NPatchType
}

vtypedef CharInfo = $extype_struct"CharInfo" of {
   value = int
 , offsetX = int
 , offsetY = int
 , advanceX = int
 , image = Image
}

vtypedef Font(n:int) = $extype_struct"Font" of {
   baseSize = int
 , charsCount = int
 , texture = Texture2D
 , recs = arrayptr(Rectangle,n)
 , chars = arrayptr(CharInfo,n)
}
vtypedef Font = [n:nat] Font(n)
vtypedef SpriteFont = Font

abst@ype CameraType = $extype"CameraType"

macdef CAMERA_PERSPECTIVE = $extval(CameraType,"CAMERA_PERSPECTIVE")
macdef CAMERA_ORTHOGRAPHIC = $extval(CameraType,"CAMERA_ORTHOGRAPHIC")

typedef Camera3D = $extype_struct"Camera3D" of {
   position = Vector3
 , target = Vector3
 , up = Vector3
 , fovy = float
 , type = CameraType
}

typedef Camera = Camera3D

typedef Camera2D = $extype_struct"Camera2D" of {
   offset = Vector2
 , target = Vector2
 , rotation = float
 , zoom = float
}

vtypedef Mesh(v:int,t:int) = $extype_struct"Mesh" of {
   vertexCount = int v
 , triangleCount = int t
 , vertices = arrayptr(float,3*v)
 , texcoords = arrayptr(float,2*v)
 , texcoords2 = arrayptr(float,2*v)
 , normals = arrayptr(float,3*v)
 , tangents = arrayptr(float,4*v)
 , colors = arrayptr(uchar,4*v)
 , indices = cPtr0(usint)
 , animVertices = arrayptr(float,3*v)
 , animNormals = arrayptr(float,3*v)
 , boneIds = cPtr0(int)
 , boneWeights = cPtr0(float)
 , vaoId = uint
 , vboId = cPtr0(uint)
}
vtypedef Mesh = [v,t:nat] Mesh(v,t)

absvtype ShaderLocs = cPtr0(int)
vtypedef Shader = $extype_struct"Shader" of {
   id = uint
 , locs = ShaderLocs
}

vtypedef MaterialMap = $extype_struct"MaterialMap" of {
   texture = Texture2D
 , color = Color
 , value = float
}

vtypedef Material = $extype_struct"Material" of {
   shader = Shader
 , maps = cPtr0(MaterialMap)
 , params = cPtr0(float)
}

typedef Transform = $extype_struct"Transform" of {
   translation = Vector3
 , rotation = Quaternion
 , scale = Vector3
}

typedef BoneInfo = $extype_struct"BoneInfo" of {
   name = char
 , parent = int
}

vtypedef Model(
     n_mesh:int
   , n_mat: int
   , n_bone: int 
  )  = $extype_struct"Model" of {
   transform = Matrix

 , meshCount = int n_mesh
 , meshes = arrayptr(Mesh,n_mesh)

 , materialCount = int n_mat
 , materials = arrayptr(Material,n_mat)
 , meshMaterial = arrayptr(int,n_mat)

 , boneCount = int n_bone
 , bones = arrayptr(BoneInfo,n_bone)
 , bindPose = arrayptr(Transform,n_bone)
}

vtypedef Model = [n_mesh,n_mat,n_bone:nat] Model(n_mesh,n_mat,n_bone)


vtypedef ModelAnimation(
    n_bone:int
  , n_frame:int
) = $extype_struct"ModelAnimation" of {
   boneCount = int n_bone
 , bones = arrayptr(BoneInfo,n_bone)
 , frameCount = int n_frame
 , framePoses = arrayptr(cPtr0(Transform),n_frame)
}
vtypedef ModelAnimation = [n_bone,n_frame:nat] ModelAnimation(n_bone,n_frame)

typedef Ray = $extype_struct"Ray" of {
   position = Vector3
 , direction = Vector3
}

typedef RayHitInfo = $extype_struct"RayHitInfo" of {
   hit = bool
 , distance = float
 , position = Vector3
 , normal = Vector3
}

typedef BoundingBox = $extype_struct"BoundingBox" of {
   min = Vector3
 , max = Vector3
}

absvtype WaveData(l:addr) = ptr l
vtypedef Wave(l:addr) = $extype_struct"Wave" of {
   sampleCount = uint
 , sampleRate = uint
 , sampleSize = uint
 , channels = uint
 , data = WaveData(l)
}
vtypedef Wave = [l:addr] Wave(l)

absvtype rAudioBuffer(l:addr) = ptr l

vtypedef AudioStream(l:addr) = $extype_struct"AudioStream" of {
   sampleRate = uint
 , sampleSize = uint
 , channels = uint
 , buffer = rAudioBuffer(l)
}
vtypedef AudioStream = [l:addr] AudioStream(l)

vtypedef Sound(l:addr) = $extype_struct"Sound" of {
   sampleCount = uint
 , stream = AudioStream(l)
}
vtypedef Sound = [l:addr] Sound(l)

sortdef audio_ctx_sort = int
abst@ype AudioCtxType(t:audio_ctx_sort) = int t
absvtype AudioCtxData(t:audio_ctx_sort,l:addr) = ptr l

vtypedef Music(t:audio_ctx_sort,sl:addr,dl:addr) = $extype_struct"Music" of {
   ctxType = AudioCtxType(t)
 , ctxData = AudioCtxData(t,dl)
 , sampleCount = uint
 , loopCount = uint
 , stream = AudioStream(sl)
}
vtypedef Music = [t:audio_ctx_sort][sl,dl:addr] Music(t,sl,dl)


typedef VrDeviceInfo = $extype_struct"VrDeviceInfo" of {
   hResolution = int
 , vResolution = int
 , hScreenSize = float
 , vScreenSize = float
 , vScreenCenter = float
 , eyeToScreenDistance = float
 , lensSeparationDistance = float
 , interpupillaryDistance = float
 , lensDistortionValues = float
 , chromaAbCorrection = float
}

abst@ype ConfigFlag = $extype"ConfigFlag"

macdef FLAG_RESERVED = $extval(ConfigFlag,"FLAG_RESERVED")
macdef FLAG_FULLSCREEN_MODE = $extval(ConfigFlag,"FLAG_FULLSCREEN_MODE")
macdef FLAG_WINDOW_RESIZABLE = $extval(ConfigFlag,"FLAG_WINDOW_RESIZABLE")
macdef FLAG_WINDOW_UNDECORATED = $extval(ConfigFlag,"FLAG_WINDOW_UNDECORATED")
macdef FLAG_WINDOW_TRANSPARENT = $extval(ConfigFlag,"FLAG_WINDOW_TRANSPARENT")
macdef FLAG_WINDOW_HIDDEN = $extval(ConfigFlag,"FLAG_WINDOW_HIDDEN")
macdef FLAG_WINDOW_ALWAYS_RUN = $extval(ConfigFlag,"FLAG_WINDOW_ALWAYS_RUN")
macdef FLAG_MSAA_4X_HINT = $extval(ConfigFlag,"FLAG_MSAA_4X_HINT")
macdef FLAG_VSYNC_HINT = $extval(ConfigFlag,"FLAG_VSYNC_HINT")

abst@ype TraceLogType = $extype"TraceLogType"

macdef LOG_ALL = $extval(TraceLogType,"LOG_ALL")
macdef LOG_TRACE = $extval(TraceLogType,"LOG_TRACE")
macdef LOG_DEBUG = $extval(TraceLogType,"LOG_DEBUG")
macdef LOG_INFO = $extval(TraceLogType,"LOG_INFO")
macdef LOG_WARNING = $extval(TraceLogType,"LOG_WARNING")
macdef LOG_ERROR = $extval(TraceLogType,"LOG_ERROR")
macdef LOG_FATAL = $extval(TraceLogType,"LOG_FATAL")
macdef LOG_NONE = $extval(TraceLogType,"LOG_NONE")

abst@ype KeyboardKey = $extype"KeyboardKey"

macdef KEY_APOSTROPHE = $extval(KeyboardKey,"KEY_APOSTROPHE")
macdef KEY_COMMA = $extval(KeyboardKey,"KEY_COMMA")
macdef KEY_MINUS = $extval(KeyboardKey,"KEY_MINUS")
macdef KEY_PERIOD = $extval(KeyboardKey,"KEY_PERIOD")
macdef KEY_SLASH = $extval(KeyboardKey,"KEY_SLASH")
macdef KEY_ZERO = $extval(KeyboardKey,"KEY_ZERO")
macdef KEY_ONE = $extval(KeyboardKey,"KEY_ONE")
macdef KEY_TWO = $extval(KeyboardKey,"KEY_TWO")
macdef KEY_THREE = $extval(KeyboardKey,"KEY_THREE")
macdef KEY_FOUR = $extval(KeyboardKey,"KEY_FOUR")
macdef KEY_FIVE = $extval(KeyboardKey,"KEY_FIVE")
macdef KEY_SIX = $extval(KeyboardKey,"KEY_SIX")
macdef KEY_SEVEN = $extval(KeyboardKey,"KEY_SEVEN")
macdef KEY_EIGHT = $extval(KeyboardKey,"KEY_EIGHT")
macdef KEY_NINE = $extval(KeyboardKey,"KEY_NINE")
macdef KEY_SEMICOLON = $extval(KeyboardKey,"KEY_SEMICOLON")
macdef KEY_EQUAL = $extval(KeyboardKey,"KEY_EQUAL")
macdef KEY_A = $extval(KeyboardKey,"KEY_A")
macdef KEY_B = $extval(KeyboardKey,"KEY_B")
macdef KEY_C = $extval(KeyboardKey,"KEY_C")
macdef KEY_D = $extval(KeyboardKey,"KEY_D")
macdef KEY_E = $extval(KeyboardKey,"KEY_E")
macdef KEY_F = $extval(KeyboardKey,"KEY_F")
macdef KEY_G = $extval(KeyboardKey,"KEY_G")
macdef KEY_H = $extval(KeyboardKey,"KEY_H")
macdef KEY_I = $extval(KeyboardKey,"KEY_I")
macdef KEY_J = $extval(KeyboardKey,"KEY_J")
macdef KEY_K = $extval(KeyboardKey,"KEY_K")
macdef KEY_L = $extval(KeyboardKey,"KEY_L")
macdef KEY_M = $extval(KeyboardKey,"KEY_M")
macdef KEY_N = $extval(KeyboardKey,"KEY_N")
macdef KEY_O = $extval(KeyboardKey,"KEY_O")
macdef KEY_P = $extval(KeyboardKey,"KEY_P")
macdef KEY_Q = $extval(KeyboardKey,"KEY_Q")
macdef KEY_R = $extval(KeyboardKey,"KEY_R")
macdef KEY_S = $extval(KeyboardKey,"KEY_S")
macdef KEY_T = $extval(KeyboardKey,"KEY_T")
macdef KEY_U = $extval(KeyboardKey,"KEY_U")
macdef KEY_V = $extval(KeyboardKey,"KEY_V")
macdef KEY_W = $extval(KeyboardKey,"KEY_W")
macdef KEY_X = $extval(KeyboardKey,"KEY_X")
macdef KEY_Y = $extval(KeyboardKey,"KEY_Y")
macdef KEY_Z = $extval(KeyboardKey,"KEY_Z")
macdef KEY_SPACE = $extval(KeyboardKey,"KEY_SPACE")
macdef KEY_ESCAPE = $extval(KeyboardKey,"KEY_ESCAPE")
macdef KEY_ENTER = $extval(KeyboardKey,"KEY_ENTER")
macdef KEY_TAB = $extval(KeyboardKey,"KEY_TAB")
macdef KEY_BACKSPACE = $extval(KeyboardKey,"KEY_BACKSPACE")
macdef KEY_INSERT = $extval(KeyboardKey,"KEY_INSERT")
macdef KEY_DELETE = $extval(KeyboardKey,"KEY_DELETE")
macdef KEY_RIGHT = $extval(KeyboardKey,"KEY_RIGHT")
macdef KEY_LEFT = $extval(KeyboardKey,"KEY_LEFT")
macdef KEY_DOWN = $extval(KeyboardKey,"KEY_DOWN")
macdef KEY_UP = $extval(KeyboardKey,"KEY_UP")
macdef KEY_PAGE_UP = $extval(KeyboardKey,"KEY_PAGE_UP")
macdef KEY_PAGE_DOWN = $extval(KeyboardKey,"KEY_PAGE_DOWN")
macdef KEY_HOME = $extval(KeyboardKey,"KEY_HOME")
macdef KEY_END = $extval(KeyboardKey,"KEY_END")
macdef KEY_CAPS_LOCK = $extval(KeyboardKey,"KEY_CAPS_LOCK")
macdef KEY_SCROLL_LOCK = $extval(KeyboardKey,"KEY_SCROLL_LOCK")
macdef KEY_NUM_LOCK = $extval(KeyboardKey,"KEY_NUM_LOCK")
macdef KEY_PRINT_SCREEN = $extval(KeyboardKey,"KEY_PRINT_SCREEN")
macdef KEY_PAUSE = $extval(KeyboardKey,"KEY_PAUSE")
macdef KEY_F1 = $extval(KeyboardKey,"KEY_F1")
macdef KEY_F2 = $extval(KeyboardKey,"KEY_F2")
macdef KEY_F3 = $extval(KeyboardKey,"KEY_F3")
macdef KEY_F4 = $extval(KeyboardKey,"KEY_F4")
macdef KEY_F5 = $extval(KeyboardKey,"KEY_F5")
macdef KEY_F6 = $extval(KeyboardKey,"KEY_F6")
macdef KEY_F7 = $extval(KeyboardKey,"KEY_F7")
macdef KEY_F8 = $extval(KeyboardKey,"KEY_F8")
macdef KEY_F9 = $extval(KeyboardKey,"KEY_F9")
macdef KEY_F10 = $extval(KeyboardKey,"KEY_F10")
macdef KEY_F11 = $extval(KeyboardKey,"KEY_F11")
macdef KEY_F12 = $extval(KeyboardKey,"KEY_F12")
macdef KEY_LEFT_SHIFT = $extval(KeyboardKey,"KEY_LEFT_SHIFT")
macdef KEY_LEFT_CONTROL = $extval(KeyboardKey,"KEY_LEFT_CONTROL")
macdef KEY_LEFT_ALT = $extval(KeyboardKey,"KEY_LEFT_ALT")
macdef KEY_LEFT_SUPER = $extval(KeyboardKey,"KEY_LEFT_SUPER")
macdef KEY_RIGHT_SHIFT = $extval(KeyboardKey,"KEY_RIGHT_SHIFT")
macdef KEY_RIGHT_CONTROL = $extval(KeyboardKey,"KEY_RIGHT_CONTROL")
macdef KEY_RIGHT_ALT = $extval(KeyboardKey,"KEY_RIGHT_ALT")
macdef KEY_RIGHT_SUPER = $extval(KeyboardKey,"KEY_RIGHT_SUPER")
macdef KEY_KB_MENU = $extval(KeyboardKey,"KEY_KB_MENU")
macdef KEY_LEFT_BRACKET = $extval(KeyboardKey,"KEY_LEFT_BRACKET")
macdef KEY_BACKSLASH = $extval(KeyboardKey,"KEY_BACKSLASH")
macdef KEY_RIGHT_BRACKET = $extval(KeyboardKey,"KEY_RIGHT_BRACKET")
macdef KEY_GRAVE = $extval(KeyboardKey,"KEY_GRAVE")
macdef KEY_KP_0 = $extval(KeyboardKey,"KEY_KP_0")
macdef KEY_KP_1 = $extval(KeyboardKey,"KEY_KP_1")
macdef KEY_KP_2 = $extval(KeyboardKey,"KEY_KP_2")
macdef KEY_KP_3 = $extval(KeyboardKey,"KEY_KP_3")
macdef KEY_KP_4 = $extval(KeyboardKey,"KEY_KP_4")
macdef KEY_KP_5 = $extval(KeyboardKey,"KEY_KP_5")
macdef KEY_KP_6 = $extval(KeyboardKey,"KEY_KP_6")
macdef KEY_KP_7 = $extval(KeyboardKey,"KEY_KP_7")
macdef KEY_KP_8 = $extval(KeyboardKey,"KEY_KP_8")
macdef KEY_KP_9 = $extval(KeyboardKey,"KEY_KP_9")
macdef KEY_KP_DECIMAL = $extval(KeyboardKey,"KEY_KP_DECIMAL")
macdef KEY_KP_DIVIDE = $extval(KeyboardKey,"KEY_KP_DIVIDE")
macdef KEY_KP_MULTIPLY = $extval(KeyboardKey,"KEY_KP_MULTIPLY")
macdef KEY_KP_SUBTRACT = $extval(KeyboardKey,"KEY_KP_SUBTRACT")
macdef KEY_KP_ADD = $extval(KeyboardKey,"KEY_KP_ADD")
macdef KEY_KP_ENTER = $extval(KeyboardKey,"KEY_KP_ENTER")
macdef KEY_KP_EQUAL = $extval(KeyboardKey,"KEY_KP_EQUAL")

abst@ype AndroidButton = $extype"AndroidButton"

macdef KEY_BACK = $extval(AndroidButton,"KEY_BACK")
macdef KEY_MENU = $extval(AndroidButton,"KEY_MENU")
macdef KEY_VOLUME_UP = $extval(AndroidButton,"KEY_VOLUME_UP")
macdef KEY_VOLUME_DOWN = $extval(AndroidButton,"KEY_VOLUME_DOWN")

abst@ype MouseButton = $extype"MouseButton"

macdef MOUSE_LEFT_BUTTON = $extval(MouseButton,"MOUSE_LEFT_BUTTON")
macdef MOUSE_RIGHT_BUTTON = $extval(MouseButton,"MOUSE_RIGHT_BUTTON")
macdef MOUSE_MIDDLE_BUTTON = $extval(MouseButton,"MOUSE_MIDDLE_BUTTON")

abst@ype GamepadNumber = $extype"GamepadNumber"

macdef GAMEPAD_PLAYER1 = $extval(GamepadNumber,"GAMEPAD_PLAYER1")
macdef GAMEPAD_PLAYER2 = $extval(GamepadNumber,"GAMEPAD_PLAYER2")
macdef GAMEPAD_PLAYER3 = $extval(GamepadNumber,"GAMEPAD_PLAYER3")
macdef GAMEPAD_PLAYER4 = $extval(GamepadNumber,"GAMEPAD_PLAYER4")

abst@ype GamepadButton = $extype"GamepadButton"

macdef GAMEPAD_BUTTON_UNKNOWN = $extval(GamepadButton,"GAMEPAD_BUTTON_UNKNOWN")
macdef GAMEPAD_BUTTON_LEFT_FACE_UP = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_FACE_UP")
macdef GAMEPAD_BUTTON_LEFT_FACE_RIGHT = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_FACE_RIGHT")
macdef GAMEPAD_BUTTON_LEFT_FACE_DOWN = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_FACE_DOWN")
macdef GAMEPAD_BUTTON_LEFT_FACE_LEFT = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_FACE_LEFT")
macdef GAMEPAD_BUTTON_RIGHT_FACE_UP = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_FACE_UP")
macdef GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_FACE_RIGHT")
macdef GAMEPAD_BUTTON_RIGHT_FACE_DOWN = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_FACE_DOWN")
macdef GAMEPAD_BUTTON_RIGHT_FACE_LEFT = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_FACE_LEFT")
macdef GAMEPAD_BUTTON_LEFT_TRIGGER_1 = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_TRIGGER_1")
macdef GAMEPAD_BUTTON_LEFT_TRIGGER_2 = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_TRIGGER_2")
macdef GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_TRIGGER_1")
macdef GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_TRIGGER_2")
macdef GAMEPAD_BUTTON_MIDDLE_LEFT = $extval(GamepadButton,"GAMEPAD_BUTTON_MIDDLE_LEFT")
macdef GAMEPAD_BUTTON_MIDDLE = $extval(GamepadButton,"GAMEPAD_BUTTON_MIDDLE")
macdef GAMEPAD_BUTTON_MIDDLE_RIGHT = $extval(GamepadButton,"GAMEPAD_BUTTON_MIDDLE_RIGHT")
macdef GAMEPAD_BUTTON_LEFT_THUMB = $extval(GamepadButton,"GAMEPAD_BUTTON_LEFT_THUMB")
macdef GAMEPAD_BUTTON_RIGHT_THUMB = $extval(GamepadButton,"GAMEPAD_BUTTON_RIGHT_THUMB")

abst@ype GamepadAxis = $extype"GamepadAxis"

macdef GAMEPAD_AXIS_UNKNOWN = $extval(GamepadAxis,"GAMEPAD_AXIS_UNKNOWN")
macdef GAMEPAD_AXIS_LEFT_X = $extval(GamepadAxis,"GAMEPAD_AXIS_LEFT_X")
macdef GAMEPAD_AXIS_LEFT_Y = $extval(GamepadAxis,"GAMEPAD_AXIS_LEFT_Y")
macdef GAMEPAD_AXIS_RIGHT_X = $extval(GamepadAxis,"GAMEPAD_AXIS_RIGHT_X")
macdef GAMEPAD_AXIS_RIGHT_Y = $extval(GamepadAxis,"GAMEPAD_AXIS_RIGHT_Y")
macdef GAMEPAD_AXIS_LEFT_TRIGGER = $extval(GamepadAxis,"GAMEPAD_AXIS_LEFT_TRIGGER")
macdef GAMEPAD_AXIS_RIGHT_TRIGGER = $extval(GamepadAxis,"GAMEPAD_AXIS_RIGHT_TRIGGER")

abst@ype ShaderLocationIndex = $extype"ShaderLocationIndex"

macdef LOC_VERTEX_POSITION = $extval(ShaderLocationIndex,"LOC_VERTEX_POSITION")
macdef LOC_VERTEX_TEXCOORD01 = $extval(ShaderLocationIndex,"LOC_VERTEX_TEXCOORD01")
macdef LOC_VERTEX_TEXCOORD02 = $extval(ShaderLocationIndex,"LOC_VERTEX_TEXCOORD02")
macdef LOC_VERTEX_NORMAL = $extval(ShaderLocationIndex,"LOC_VERTEX_NORMAL")
macdef LOC_VERTEX_TANGENT = $extval(ShaderLocationIndex,"LOC_VERTEX_TANGENT")
macdef LOC_VERTEX_COLOR = $extval(ShaderLocationIndex,"LOC_VERTEX_COLOR")
macdef LOC_MATRIX_MVP = $extval(ShaderLocationIndex,"LOC_MATRIX_MVP")
macdef LOC_MATRIX_MODEL = $extval(ShaderLocationIndex,"LOC_MATRIX_MODEL")
macdef LOC_MATRIX_VIEW = $extval(ShaderLocationIndex,"LOC_MATRIX_VIEW")
macdef LOC_MATRIX_PROJECTION = $extval(ShaderLocationIndex,"LOC_MATRIX_PROJECTION")
macdef LOC_VECTOR_VIEW = $extval(ShaderLocationIndex,"LOC_VECTOR_VIEW")
macdef LOC_COLOR_DIFFUSE = $extval(ShaderLocationIndex,"LOC_COLOR_DIFFUSE")
macdef LOC_COLOR_SPECULAR = $extval(ShaderLocationIndex,"LOC_COLOR_SPECULAR")
macdef LOC_COLOR_AMBIENT = $extval(ShaderLocationIndex,"LOC_COLOR_AMBIENT")
macdef LOC_MAP_ALBEDO = $extval(ShaderLocationIndex,"LOC_MAP_ALBEDO")
macdef LOC_MAP_METALNESS = $extval(ShaderLocationIndex,"LOC_MAP_METALNESS")
macdef LOC_MAP_NORMAL = $extval(ShaderLocationIndex,"LOC_MAP_NORMAL")
macdef LOC_MAP_ROUGHNESS = $extval(ShaderLocationIndex,"LOC_MAP_ROUGHNESS")
macdef LOC_MAP_OCCLUSION = $extval(ShaderLocationIndex,"LOC_MAP_OCCLUSION")
macdef LOC_MAP_EMISSION = $extval(ShaderLocationIndex,"LOC_MAP_EMISSION")
macdef LOC_MAP_HEIGHT = $extval(ShaderLocationIndex,"LOC_MAP_HEIGHT")
macdef LOC_MAP_CUBEMAP = $extval(ShaderLocationIndex,"LOC_MAP_CUBEMAP")
macdef LOC_MAP_IRRADIANCE = $extval(ShaderLocationIndex,"LOC_MAP_IRRADIANCE")
macdef LOC_MAP_PREFILTER = $extval(ShaderLocationIndex,"LOC_MAP_PREFILTER")
macdef LOC_MAP_BRDF = $extval(ShaderLocationIndex,"LOC_MAP_BRDF")

macdef LOC_MAP_SPECULAR = $extval(ShaderLocationIndex, "LOC_MAP_SPECULAR")

macdef LOC_MAP_DIFFUSE = $extval(ShaderLocationIndex, "LOC_MAP_DIFFUSE")

(** FIXME: This would be a good feature: make sure it works **)
abst@ype ShaderUniformDataType(a:t@ype) = $extype"ShaderUniformDataType"

macdef UNIFORM_FLOAT = $extval(ShaderUniformDataType(float),"UNIFORM_FLOAT")
macdef UNIFORM_VEC2 = $extval(ShaderUniformDataType(Vector2),"UNIFORM_VEC2")
macdef UNIFORM_VEC3 = $extval(ShaderUniformDataType(Vector3),"UNIFORM_VEC3")
macdef UNIFORM_VEC4 = $extval(ShaderUniformDataType(Vector4),"UNIFORM_VEC4")
macdef UNIFORM_INT = $extval(ShaderUniformDataType(int32),"UNIFORM_INT")
macdef UNIFORM_IVEC2 = $extval(ShaderUniformDataType(IVector2),"UNIFORM_IVEC2")
macdef UNIFORM_IVEC3 = $extval(ShaderUniformDataType(IVector3),"UNIFORM_IVEC3")
macdef UNIFORM_IVEC4 = $extval(ShaderUniformDataType(IVector4),"UNIFORM_IVEC4")
macdef UNIFORM_SAMPLER2D = $extval(ShaderUniformDataType(int32),"UNIFORM_SAMPLER2D")

abst@ype MaterialMapType = $extype"MaterialMapType"

macdef MAP_ALBEDO = $extval(MaterialMapType,"MAP_ALBEDO")
macdef MAP_METALNESS = $extval(MaterialMapType,"MAP_METALNESS")
macdef MAP_NORMAL = $extval(MaterialMapType,"MAP_NORMAL")
macdef MAP_ROUGHNESS = $extval(MaterialMapType,"MAP_ROUGHNESS")
macdef MAP_OCCLUSION = $extval(MaterialMapType,"MAP_OCCLUSION")
macdef MAP_EMISSION = $extval(MaterialMapType,"MAP_EMISSION")
macdef MAP_HEIGHT = $extval(MaterialMapType,"MAP_HEIGHT")
macdef MAP_CUBEMAP = $extval(MaterialMapType,"MAP_CUBEMAP")
macdef MAP_IRRADIANCE = $extval(MaterialMapType,"MAP_IRRADIANCE")
macdef MAP_PREFILTER = $extval(MaterialMapType,"MAP_PREFILTER")
macdef MAP_BRDF = $extval(MaterialMapType,"MAP_BRDF")
macdef MAP_DIFFUSE = $extval(MaterialMapType, "MAP_DIFFUSE")
macdef MAP_SPECULAR = $extval(MaterialMapType, "MAP_SPECULAR")

abst@ype TextureFilterMode = $extype"TextureFilterMode"

macdef FILTER_POINT = $extval(TextureFilterMode,"FILTER_POINT")
macdef FILTER_BILINEAR = $extval(TextureFilterMode,"FILTER_BILINEAR")
macdef FILTER_TRILINEAR = $extval(TextureFilterMode,"FILTER_TRILINEAR")
macdef FILTER_ANISOTROPIC_4X = $extval(TextureFilterMode,"FILTER_ANISOTROPIC_4X")
macdef FILTER_ANISOTROPIC_8X = $extval(TextureFilterMode,"FILTER_ANISOTROPIC_8X")
macdef FILTER_ANISOTROPIC_16X = $extval(TextureFilterMode,"FILTER_ANISOTROPIC_16X")

abst@ype CubemapLayoutType = $extype"CubemapLayoutType"

macdef CUBEMAP_AUTO_DETECT = $extval(CubemapLayoutType,"CUBEMAP_AUTO_DETECT")
macdef CUBEMAP_LINE_VERTICAL = $extval(CubemapLayoutType,"CUBEMAP_LINE_VERTICAL")
macdef CUBEMAP_LINE_HORIZONTAL = $extval(CubemapLayoutType,"CUBEMAP_LINE_HORIZONTAL")
macdef CUBEMAP_CROSS_THREE_BY_FOUR = $extval(CubemapLayoutType,"CUBEMAP_CROSS_THREE_BY_FOUR")
macdef CUBEMAP_CROSS_FOUR_BY_THREE = $extval(CubemapLayoutType,"CUBEMAP_CROSS_FOUR_BY_THREE")
macdef CUBEMAP_PANORAMA = $extval(CubemapLayoutType,"CUBEMAP_PANORAMA")

abst@ype TextureWrapMode = $extype"TextureWrapMode"

macdef WRAP_REPEAT = $extval(TextureWrapMode,"WRAP_REPEAT")
macdef WRAP_CLAMP = $extval(TextureWrapMode,"WRAP_CLAMP")
macdef WRAP_MIRROR_REPEAT = $extval(TextureWrapMode,"WRAP_MIRROR_REPEAT")
macdef WRAP_MIRROR_CLAMP = $extval(TextureWrapMode,"WRAP_MIRROR_CLAMP")

abst@ype FontType = $extype"FontType"

macdef FONT_DEFAULT = $extval(FontType,"FONT_DEFAULT")
macdef FONT_BITMAP = $extval(FontType,"FONT_BITMAP")
macdef FONT_SDF = $extval(FontType,"FONT_SDF")

abst@ype BlendMode = $extype"BlendMode"

macdef BLEND_ALPHA = $extval(BlendMode,"BLEND_ALPHA")
macdef BLEND_ADDITIVE = $extval(BlendMode,"BLEND_ADDITIVE")
macdef BLEND_MULTIPLIED = $extval(BlendMode,"BLEND_MULTIPLIED")

abst@ype GestureType = $extype"GestureType"

macdef GESTURE_NONE = $extval(GestureType,"GESTURE_NONE")
macdef GESTURE_TAP = $extval(GestureType,"GESTURE_TAP")
macdef GESTURE_DOUBLETAP = $extval(GestureType,"GESTURE_DOUBLETAP")
macdef GESTURE_HOLD = $extval(GestureType,"GESTURE_HOLD")
macdef GESTURE_DRAG = $extval(GestureType,"GESTURE_DRAG")
macdef GESTURE_SWIPE_RIGHT = $extval(GestureType,"GESTURE_SWIPE_RIGHT")
macdef GESTURE_SWIPE_LEFT = $extval(GestureType,"GESTURE_SWIPE_LEFT")
macdef GESTURE_SWIPE_UP = $extval(GestureType,"GESTURE_SWIPE_UP")
macdef GESTURE_SWIPE_DOWN = $extval(GestureType,"GESTURE_SWIPE_DOWN")
macdef GESTURE_PINCH_IN = $extval(GestureType,"GESTURE_PINCH_IN")
macdef GESTURE_PINCH_OUT = $extval(GestureType,"GESTURE_PINCH_OUT")

abst@ype CameraMode = $extype"CameraMode"

macdef CAMERA_CUSTOM = $extval(CameraMode,"CAMERA_CUSTOM")
macdef CAMERA_FREE = $extval(CameraMode,"CAMERA_FREE")
macdef CAMERA_ORBITAL = $extval(CameraMode,"CAMERA_ORBITAL")
macdef CAMERA_FIRST_PERSON = $extval(CameraMode,"CAMERA_FIRST_PERSON")
macdef CAMERA_THIRD_PERSON = $extval(CameraMode,"CAMERA_THIRD_PERSON")



//typedef TraceLogCallback = (int, cPtr0(char), va_list) -> void

absview Window_v(l:addr)
viewdef Window_v = [l:addr] Window_v(l)
fun InitWindow(int, int, string) 
  : (Window_v | void) = "mac#"

fun WindowShouldClose( !Window_v | ) : bool = "mac#"

fun CloseWindow( Window_v | ) : void = "mac#"

fun IsWindowReady( !Window_v | ) : bool = "mac#"

fun IsWindowMinimized( !Window_v | ) : bool = "mac#"

fun IsWindowResized( !Window_v | ) : bool = "mac#"

fun IsWindowHidden( !Window_v | ) : bool = "mac#"

fun ToggleFullscreen( !Window_v | ) : void = "mac#"

fun UnhideWindow( !Window_v | ) : void = "mac#"

fun HideWindow( !Window_v | ) : void = "mac#"

fun SetWindowIcon( !Window_v | Image) : void = "mac#"

fun SetWindowTitle( !Window_v | string) : void = "mac#"

fun SetWindowPosition( !Window_v | int, int) : void = "mac#"

fun SetWindowMonitor( !Window_v | int) : void = "mac#"

fun SetWindowMinSize( !Window_v | int, int) : void = "mac#"

fun SetWindowSize( !Window_v | int, int) : void = "mac#"

fun GetWindowHandle{l:addr}( !Window_v | ) : ptr l = "mac#"

(** Check to see if these are dependent on windowing **)

fun GetScreenWidth(!Window_v |) : int = "mac#"

fun GetScreenHeight(!Window_v |) : int = "mac#"

fun GetMonitorCount(!Window_v |) : int = "mac#"

fun GetMonitorWidth(!Window_v |int) : int = "mac#"

fun GetMonitorHeight(!Window_v |int) : int = "mac#"

fun GetMonitorPhysicalWidth(!Window_v |int) : int = "mac#"

fun GetMonitorPhysicalHeight(!Window_v |int) : int = "mac#"

fun GetWindowPosition(!Window_v |) : Vector2 = "mac#"

fun GetMonitorName(!Window_v |int) : string = "mac#"

fun GetClipboardText(!Window_v |) : string = "mac#"

fun SetClipboardText(!Window_v |string) : void = "mac#"

fun ShowCursor(!Window_v |) : void = "mac#"

fun HideCursor(!Window_v |) : void = "mac#"

fun IsCursorHidden(!Window_v |) : bool = "mac#"

fun EnableCursor(!Window_v |) : void = "mac#"

fun DisableCursor(!Window_v |) : void = "mac#"

absview Drawing_v(l:addr)
viewdef Drawing_v = [l:addr] Drawing_v(l)
fun ClearBackground( !Drawing_v | Color) : void = "mac#"

(** The modes need to be vetted for usability
    concerns.  I find the views nice from a logical
    aspect, but it may make for clumsy code
    and I'm not sure if anyone is likely to 
    mess this stuff up.
**)
fun BeginDrawing{l:addr}(!Window_v(l) |) 
  : (Drawing_v(l) | void) = "mac#"

fun EndDrawing{l:addr}(Drawing_v(l) |) 
  : void = "mac#"

absview Mode2D_v(l:addr)
viewdef Mode2D_v = [l:addr] Mode2D_v(l)
fun BeginMode2D{l:addr}(Drawing_v(l) | Camera2D) 
  : (Mode2D_v(l) | void) = "mac#"

fun EndMode2D{l:addr}(Mode2D_v(l) |) 
  : (Drawing_v(l) | void) = "mac#"

absview Mode3D_v(l:addr)
viewdef Mode3D_v = [l:addr] Mode3D_v(l)
fun BeginMode3D{l:addr}(Drawing_v(l) | Camera3D) 
  : (Mode3D_v(l) | void) = "mac#"

fun EndMode3D{l:addr}(Mode3D_v(l) |) 
  : (Drawing_v(l) | void) = "mac#"

absview TextureMode_v(l:addr)
viewdef TextureMode_v = [l:addr] TextureMode_v(l)
fun BeginTextureMode{l:addr}(Drawing_v(l) | !RenderTexture2D) 
  : (TextureMode_v(l) | void) = "mac#"

fun EndTextureMode{l:addr}(TextureMode_v(l) | ) 
  : (Drawing_v(l) | void) = "mac#"

absview ScissorMode_v(l:addr)
viewdef ScissorMode_v = [l:addr] ScissorMode_v(l)
fun BeginScissorMode{l:addr}(!Drawing_v(l) | x: int, y: int, width: int, height: int) 
  : (ScissorMode_v(l) | void) = "mac#"

fun EndScissorMode{l:addr}(ScissorMode_v(l) |) 
  : void = "mac#"

fun GetMouseRay(Vector2, Camera) : Ray = "mac#"

fun GetCameraMatrix(Camera) : Matrix = "mac#"

fun GetCameraMatrix2D(Camera2D) : Matrix = "mac#"

fun GetWorldToScreen(Vector3, Camera) : Vector2 = "mac#"

fun GetWorldToScreenEx(Vector3, Camera, int, int) : Vector2 = "mac#"

fun GetWorldToScreen2D(Vector2, Camera2D) : Vector2 = "mac#"

fun GetScreenToWorld2D(Vector2, Camera2D) : Vector2 = "mac#"

fun SetTargetFPS(!Window_v | int) : void = "mac#"

fun GetFPS(!Window_v |) : int = "mac#"

fun GetFrameTime(!Window_v |) : float = "mac#"

fun GetTime() : double = "mac#"

fun ColorToInt(Color) : int = "mac#"

fun ColorNormalize(Color) : Vector4 = "mac#"

fun ColorFromNormalized(Vector4) : Color = "mac#"

fun ColorToHSV(Color) : Vector3 = "mac#"

fun ColorFromHSV(Vector3) : Color = "mac#"

fun GetColor(int) : Color = "mac#"

fun Fade(Color, float) : Color = "mac#"

fun SetConfigFlags(ConfigFlag) : void = "mac#"

fun SetTraceLogLevel(int) : void = "mac#"

fun SetTraceLogExit(int) : void = "mac#"

//fun SetTraceLogCallback(TraceLogCallback) : void = "mac#"

//fun TraceLog(int, cPtr0(char), VARARGS) : void = "mac#"

fun TakeScreenshot(!Window_v | filename: string) : void = "mac#"

fun GetRandomValue(int, int) : int = "mac#"

fun LoadFileData(fileName: string, bytesRead : &int? >> int ) : cPtr0(uchar) = "mac#"

fun SaveFileData(fileName:string, data:ptr, bytesRead: int) : void = "mac#"

fun FileExists(string) : bool = "mac#"

fun IsFileExtension(fileName: string, ext: string) : bool = "mac#"

fun DirectoryExists(directory: string) : bool = "mac#"

fun GetExtension(string) : string = "mac#"

fun GetFileName(string) : string = "mac#"

fun GetFileNameWithoutExt(string) : string = "mac#"

fun GetDirectoryPath(string) : string = "mac#"

fun GetPrevDirectoryPath(string) : string = "mac#"

fun GetWorkingDirectory() : string = "mac#"

absview DirectoryFiles_v(l:addr)
fun GetDirectoryFiles(string, &int? >> int n) 
  : #[n:nat][l:addr] (
      array_v(string,l,n)
    , DirectoryFiles_v(l)  |   ptr l
  ) = "mac#"

fun ClearDirectoryFiles{l:addr}{n:nat}(array_v(string,l,n), DirectoryFiles_v(l) | ) : void = "mac#"

fun ChangeDirectory(string) : bool = "mac#"

fun IsFileDropped() : bool = "mac#"

absview DroppedFiles_v(l:addr)
fun GetDroppedFiles(&int? >> int n) 
  : #[n:nat][l:addr] (
      array_v(string,l,n)
    , DroppedFiles_v(l)  |   ptr l
  ) = "mac#"

fun ClearDroppedFiles{l:addr}{n:nat}( array_v(string,l,n), DroppedFiles_v(l) | ) : void = "mac#"

fun GetFileModTime(fileName: string) : lint = "mac#"

fun CompressData(cPtr0(uchar), int, cPtr0(int)) : cPtr0(uchar) = "mac#"

fun DecompressData(cPtr0(uchar), int, cPtr0(int)) : cPtr0(uchar) = "mac#"

fun SaveStorageValue(int, int) : void = "mac#"

fun LoadStorageValue(int) : int = "mac#"

fun OpenURL(string) : void = "mac#"

fun IsKeyPressed(!Window_v | KeyboardKey) : bool = "mac#"

fun IsKeyDown(!Window_v | KeyboardKey) : bool = "mac#"

fun IsKeyReleased(!Window_v | KeyboardKey) : bool = "mac#"

fun IsKeyUp(!Window_v | KeyboardKey) : bool = "mac#"

fun SetExitKey(!Window_v | KeyboardKey) : void = "mac#"

fun GetKeyPressed(!Window_v | ) : KeyboardKey = "mac#"

fun IsGamepadAvailable(!Window_v | GamepadNumber) : bool = "mac#"

fun IsGamepadName(GamepadNumber, string) : bool = "mac#"

fun GetGamepadName(GamepadNumber) : string = "mac#"

fun IsGamepadButtonPressed(GamepadNumber, GamepadButton) : bool = "mac#"

fun IsGamepadButtonDown(GamepadNumber, GamepadButton) : bool = "mac#"

fun IsGamepadButtonReleased(GamepadNumber, GamepadButton) : bool = "mac#"

fun IsGamepadButtonUp(GamepadNumber, GamepadButton) : bool = "mac#"

fun GetGamepadButtonPressed(!Window_v | ) : int = "mac#"

fun GetGamepadAxisCount(GamepadNumber) : int = "mac#"

fun GetGamepadAxisMovement(GamepadNumber, GamepadAxis) : float = "mac#"

fun IsMouseButtonPressed(!Window_v | MouseButton) : bool = "mac#"

fun IsMouseButtonDown(!Window_v | MouseButton) : bool = "mac#"

fun IsMouseButtonReleased(!Window_v | MouseButton) : bool = "mac#"

fun IsMouseButtonUp(!Window_v | MouseButton) : bool = "mac#"

fun GetMouseX(!Window_v | ) : int = "mac#"

fun GetMouseY(!Window_v | ) : int = "mac#"

fun GetMousePosition(!Window_v | ) : Vector2 = "mac#"

fun SetMousePosition(!Window_v | int, int) : void = "mac#"

fun SetMouseOffset(!Window_v | int, int) : void = "mac#"

fun SetMouseScale(!Window_v | float, float) : void = "mac#"

fun GetMouseWheelMove(!Window_v | ) : int = "mac#"

fun GetTouchX(!Window_v | ) : int = "mac#"

fun GetTouchY(!Window_v | ) : int = "mac#"

fun GetTouchPosition(!Window_v | int) : Vector2 = "mac#"

fun SetGesturesEnabled(!Window_v | GestureType) : void = "mac#"

fun IsGestureDetected(!Window_v | GestureType) : bool = "mac#"

fun GetGestureDetected(!Window_v | ) : int = "mac#"

fun GetTouchPointsCount(!Window_v | ) : int = "mac#"

fun GetGestureHoldDuration(!Window_v | ) : float = "mac#"

fun GetGestureDragVector(!Window_v | ) : Vector2 = "mac#"

fun GetGestureDragAngle(!Window_v | ) : float = "mac#"

fun GetGesturePinchVector(!Window_v | ) : Vector2 = "mac#"

fun GetGesturePinchAngle(!Window_v | ) : float = "mac#"

fun SetCameraMode(Camera, CameraMode) : void = "mac#"

fun UpdateCamera(cPtr0(Camera)) : void = "mac#"

fun SetCameraPanControl(!Window_v | int) : void = "mac#"

fun SetCameraAltControl(!Window_v | int) : void = "mac#"

fun SetCameraSmoothZoomControl(!Window_v | int) : void = "mac#"

fun SetCameraMoveControls(!Window_v | int, int, int, int, int, int) : void = "mac#"

fun DrawPixel( !Drawing_v | int, int, Color) : void = "mac#"

fun DrawPixelV( !Drawing_v | Vector2, Color) : void = "mac#"

fun DrawLine( !Drawing_v | int, int, int, int, Color) : void = "mac#"

fun DrawLineV( !Drawing_v | Vector2, Vector2, Color) : void = "mac#"

fun DrawLineEx( !Drawing_v | Vector2, Vector2, float, Color) : void = "mac#"

fun DrawLineBezier( !Drawing_v | Vector2, Vector2, float, Color) : void = "mac#"

fun DrawLineStrip{n:nat}( !Drawing_v |  &array(Vector2,n), int n, Color) : void = "mac#"

fun DrawCircle( !Drawing_v | int, int, float, Color) : void = "mac#"

fun DrawCircleSector( !Drawing_v | Vector2, float, int, int, int, Color) : void = "mac#"

fun DrawCircleSectorLines( !Drawing_v | Vector2, float, int, int, int, Color) : void = "mac#"

fun DrawCircleGradient( !Drawing_v | int, int, float, Color, Color) : void = "mac#"

fun DrawCircleV( !Drawing_v | Vector2, float, Color) : void = "mac#"

fun DrawCircleLines( !Drawing_v | int, int, float, Color) : void = "mac#"

fun DrawEllipse( !Drawing_v | int, int, float, float, Color) : void = "mac#"

fun DrawEllipseLines( !Drawing_v | int, int, float, float, Color) : void = "mac#"

fun DrawRing( !Drawing_v | Vector2, float, float, int, int, int, Color) : void = "mac#"

fun DrawRingLines( !Drawing_v | Vector2, float, float, int, int, int, Color) : void = "mac#"

fun DrawRectangle( !Drawing_v | int, int, int, int, Color) : void = "mac#"

fun DrawRectangleV( !Drawing_v | Vector2, Vector2, Color) : void = "mac#"

fun DrawRectangleRec( !Drawing_v | Rectangle, Color) : void = "mac#"

fun DrawRectanglePro( !Drawing_v | Rectangle, Vector2, float, Color) : void = "mac#"

fun DrawRectangleGradientV( !Drawing_v | int, int, int, int, Color, Color) : void = "mac#"

fun DrawRectangleGradientH( !Drawing_v | int, int, int, int, Color, Color) : void = "mac#"

fun DrawRectangleGradientEx( !Drawing_v | Rectangle, Color, Color, Color, Color) : void = "mac#"

fun DrawRectangleLines( !Drawing_v | int, int, int, int, Color) : void = "mac#"

fun DrawRectangleLinesEx( !Drawing_v | Rectangle, int, Color) : void = "mac#"

fun DrawRectangleRounded( !Drawing_v | Rectangle, float, int, Color) : void = "mac#"

fun DrawRectangleRoundedLines( !Drawing_v | Rectangle, float, int, int, Color) : void = "mac#"

fun DrawTriangle( !Drawing_v | Vector2, Vector2, Vector2, Color) : void = "mac#"

fun DrawTriangleLines( !Drawing_v | Vector2, Vector2, Vector2, Color) : void = "mac#"

fun DrawTriangleFan{n:nat}( !Drawing_v | &array(Vector2,n), int n, Color) : void = "mac#"

fun DrawTriangleStrip{n:nat}( !Drawing_v | &array(Vector2,n), int n, Color) : void = "mac#"

fun DrawPoly( !Drawing_v | Vector2, int, float, float, Color) : void = "mac#"

fun DrawPolyLines( !Drawing_v | Vector2, int, float, float, Color) : void = "mac#"

fun CheckCollisionRecs(Rectangle, Rectangle) : bool = "mac#"

fun CheckCollisionCircles(Vector2, float, Vector2, float) : bool = "mac#"

fun CheckCollisionCircleRec(Vector2, float, Rectangle) : bool = "mac#"

fun GetCollisionRec(Rectangle, Rectangle) : Rectangle = "mac#"

fun CheckCollisionPointRec(Vector2, Rectangle) : bool = "mac#"

fun CheckCollisionPointCircle(Vector2, Vector2, float) : bool = "mac#"

fun CheckCollisionPointTriangle(Vector2, Vector2, Vector2, Vector2) : bool = "mac#"

fun LoadImage(string) : Image = "mac#"

fun LoadImageEx{w,h:nat}(pixels: &array(Color,w*h), width: int w, height: int h) : Image = "mac#"

fun LoadImagePro(data: ptr, width: int, height: int, format: PixelFormat ) : Image = "mac#"

fun LoadImageRaw(fileName: string, width: int, height: int, format: PixelFormat, headerSize: int) : Image = "mac#"

fun ExportImage(!Image, fileName: string) : void = "mac#"

fun ExportImageAsCode(!Image, fileName: string) : void = "mac#"

fun LoadTexture(fileName: string) : Texture2D = "mac#"

fun LoadTextureFromImage(!Image) : Texture2D = "mac#"

fun LoadTextureCubemap(!Image, layoutType: CubemapLayoutType) : TextureCubemap = "mac#"

fun LoadRenderTexture( width: int, height: int) : RenderTexture2D = "mac#"

fun UnloadImage(Image) : void = "mac#"

fun UnloadTexture(Texture2D) : void = "mac#"

fun UnloadRenderTexture(RenderTexture2D) : void = "mac#"

fun GetImageData(!Image) : cPtr0(Color) = "mac#"

fun GetImageDataNormalized(!Image) : cPtr0(Vector4) = "mac#"

fun GetImageAlphaBorder(!Image, float) : Rectangle = "mac#"

fun GetPixelDataSize(int, int, int) : int = "mac#"

fun GetTextureData(!Texture2D) : Image = "mac#"

fun GetScreenData() : Image = "mac#"

fun UpdateTexture(!Texture2D, cPtr0(void)) : void = "mac#"

fun ImageCopy(!Image) : Image = "mac#"

fun ImageFromImage(!Image, Rectangle) : Image = "mac#"

fun ImageToPOT(&Image, Color) : void = "mac#"

fun ImageFormat(&Image, int) : void = "mac#"

fun ImageAlphaMask(&Image, Image) : void = "mac#"

fun ImageAlphaClear(&Image, Color, float) : void = "mac#"

fun ImageAlphaCrop(&Image, float) : void = "mac#"

fun ImageAlphaPremultiply(&Image) : void = "mac#"

fun ImageCrop(&Image, Rectangle) : void = "mac#"

fun ImageResize(&Image, int, int) : void = "mac#"

fun ImageResizeNN(&Image, int, int) : void = "mac#"

fun ImageResizeCanvas(&Image, int, int, int, int, Color) : void = "mac#"

fun ImageMipmaps(&Image) : void = "mac#"

fun ImageDither(&Image, int, int, int, int) : void = "mac#"

fun ImageExtractPalette(!Image, int, cPtr0(int)) : cPtr0(Color) = "mac#"

fun ImageText(string, int, Color) : Image = "mac#"

fun ImageTextEx(!Font, string, float, float, Color) : Image = "mac#"

fun ImageDraw( !Drawing_v | &Image, Image, Rectangle, Rectangle, Color) : void = "mac#"

fun ImageDrawRectangle( !Drawing_v | &Image, Rectangle, Color) : void = "mac#"

fun ImageDrawRectangleLines( !Drawing_v | &Image, Rectangle, int, Color) : void = "mac#"

fun ImageDrawText( !Drawing_v | &Image, Vector2, string, int, Color) : void = "mac#"

fun ImageDrawTextEx( !Drawing_v | &Image, Vector2, !Font, string, float, float, Color) : void = "mac#"

fun ImageFlipVertical(&Image) : void = "mac#"

fun ImageFlipHorizontal(&Image) : void = "mac#"

fun ImageRotateCW(&Image) : void = "mac#"

fun ImageRotateCCW(&Image) : void = "mac#"

fun ImageColorTint(&Image, Color) : void = "mac#"

fun ImageColorInvert(&Image) : void = "mac#"

fun ImageColorGrayscale(&Image) : void = "mac#"

fun ImageColorContrast(&Image, float) : void = "mac#"

fun ImageColorBrightness(&Image, int) : void = "mac#"

fun ImageColorReplace(&Image, Color, Color) : void = "mac#"

fun GenImageColor(int, int, Color) : Image = "mac#"

fun GenImageGradientV(int, int, Color, Color) : Image = "mac#"

fun GenImageGradientH(int, int, Color, Color) : Image = "mac#"

fun GenImageGradientRadial(int, int, float, Color, Color) : Image = "mac#"

fun GenImageChecked(int, int, int, int, Color, Color) : Image = "mac#"

fun GenImageWhiteNoise(int, int, float) : Image = "mac#"

fun GenImagePerlinNoise(int, int, int, int, float) : Image = "mac#"

fun GenImageCellular(int, int, int) : Image = "mac#"

fun GenTextureMipmaps(&Texture2D) : void = "mac#"

fun SetTextureFilter(!Texture2D, TextureFilterMode) : void = "mac#"

fun SetTextureWrap(!Texture2D, TextureWrapMode) : void = "mac#"

fun DrawTexture( !Drawing_v | !Texture2D, int, int, Color) : void = "mac#"

fun DrawTextureV( !Drawing_v | !Texture2D, Vector2, Color) : void = "mac#"

fun DrawTextureEx( !Drawing_v | !Texture2D, Vector2, float, float, Color) : void = "mac#"

fun DrawTextureRec( !Drawing_v | !Texture2D, Rectangle, Vector2, Color) : void = "mac#"

fun DrawTextureQuad( !Drawing_v | !Texture2D, Vector2, Vector2, Rectangle, Color) : void = "mac#"

fun DrawTexturePro( !Drawing_v | !Texture2D, Rectangle, Rectangle, Vector2, float, Color) : void = "mac#"

fun DrawTextureNPatch( !Drawing_v | !Texture2D, NPatchInfo, Rectangle, Vector2, float, Color) : void = "mac#"

fun GetFontDefault() : Font = "mac#"

fun LoadFont(string) : Font = "mac#"

fun LoadFontEx(string, int, string, int) : Font = "mac#"

fun LoadFontFromImage(!Image, Color, int) : Font = "mac#"

fun LoadFontData(string, int, cPtr0(int), int, FontType) : cPtr0(CharInfo) = "mac#"

fun GenImageFontAtlas(cPtr0(CharInfo), cPtr0(cPtr0(Rectangle)), int, int, int, int) : Image = "mac#"

fun UnloadFont(Font) : void = "mac#"

fun DrawFPS( !Drawing_v | int, int) : void = "mac#"

fun DrawText( !Drawing_v | string, int, int, int, Color) : void = "mac#"

fun DrawTextEx( !Drawing_v | !Font, string, Vector2, float, float, Color) : void = "mac#"

fun DrawTextRec( !Drawing_v | !Font, string, Rectangle, float, float, bool, Color) : void = "mac#"

fun DrawTextRecEx( !Drawing_v | !Font, string, Rectangle, float, float, bool, Color, int, int, Color, Color) : void = "mac#"

fun DrawTextCodepoint( !Drawing_v | !Font, int, Vector2, float, Color) : void = "mac#"

fun MeasureText(string, int) : int = "mac#"

fun MeasureTextEx(!Font, string, float, float) : Vector2 = "mac#"

fun GetGlyphIndex(!Font, int) : int = "mac#"

fun TextCopy(cPtr0(char), cPtr0(char)) : int = "mac#"

fun TextIsEqual(cPtr0(char), cPtr0(char)) : bool = "mac#"

fun TextLength(cPtr0(char)) : uint = "mac#"

//fun TextFormat(cPtr0(char), VARARGS) : cPtr0(char) = "mac#"

fun TextSubtext(cPtr0(char), int, int) : cPtr0(char) = "mac#"

fun TextReplace(text:string, replace: string, by: string) : Strptr0 = "mac#"

fun TextInsert(string, string, pos: int) : Strptr0 = "mac#"

fun TextJoin(cPtr0(cPtr0(char)), int, cPtr0(char)) : cPtr0(char) = "mac#"

fun TextSplit(cPtr0(char), char, cPtr0(int)) : cPtr0(cPtr0(char)) = "mac#"

fun TextAppend(cPtr0(char), cPtr0(char), cPtr0(int)) : void = "mac#"

fun TextFindIndex(cPtr0(char), cPtr0(char)) : int = "mac#"

fun TextToUpper(cPtr0(char)) : cPtr0(char) = "mac#"

fun TextToLower(cPtr0(char)) : cPtr0(char) = "mac#"

fun TextToPascal(cPtr0(char)) : cPtr0(char) = "mac#"

fun TextToInteger(cPtr0(char)) : int = "mac#"

fun TextToUtf8{n:nat}(&array(int,n), int n) : Strptr0 = "mac#"

(** FIXME: see if this must be freed **)
fun GetCodepoints(string, &int? >> int n ) : #[n:nat] arrayref(int,n) = "mac#"

fun GetCodepointsCount(string) : int = "mac#"

fun GetNextCodepoint(cPtr0(char), cPtr0(int)) : int = "mac#"

fun CodepointToUtf8(int, &int? >> int n) : #[n:nat] arrayref(char,n) = "mac#"

fun DrawLine3D( !Mode3D_v | Vector3, Vector3, Color) : void = "mac#"

fun DrawPoint3D( !Mode3D_v | Vector3, Color) : void = "mac#"

fun DrawCircle3D( !Mode3D_v | Vector3, float, Vector3, float, Color) : void = "mac#"

fun DrawCube( !Mode3D_v | Vector3, float, float, float, Color) : void = "mac#"

fun DrawCubeV( !Mode3D_v | Vector3, Vector3, Color) : void = "mac#"

fun DrawCubeWires( !Mode3D_v | Vector3, float, float, float, Color) : void = "mac#"

fun DrawCubeWiresV( !Mode3D_v | Vector3, Vector3, Color) : void = "mac#"

fun DrawCubeTexture( !Mode3D_v | Texture2D, Vector3, float, float, float, Color) : void = "mac#"

fun DrawSphere( !Mode3D_v | Vector3, float, Color) : void = "mac#"

fun DrawSphereEx( !Mode3D_v | Vector3, float, int, int, Color) : void = "mac#"

fun DrawSphereWires( !Mode3D_v | Vector3, float, int, int, Color) : void = "mac#"

fun DrawCylinder( !Mode3D_v | Vector3, float, float, float, int, Color) : void = "mac#"

fun DrawCylinderWires( !Mode3D_v | Vector3, float, float, float, int, Color) : void = "mac#"

fun DrawPlane( !Mode3D_v | Vector3, Vector2, Color) : void = "mac#"

fun DrawRay( !Drawing_v | Ray, Color) : void = "mac#"

fun DrawGrid( !Drawing_v | int, float) : void = "mac#"

fun DrawGizmo( !Drawing_v | Vector3) : void = "mac#"

fun LoadModel(string) : Model = "mac#"

fun LoadModelFromMesh(!Mesh) : Model = "mac#"

fun UnloadModel(Model) : void = "mac#"

fun LoadMeshes(string, &int? >> int n) : #[n:nat] arrayptr(Mesh,n) = "mac#"

fun ExportMesh(!Mesh, string) : void = "mac#"

fun UnloadMesh(Mesh) : void = "mac#"

fun LoadMaterials(string, &int? >> int n) : #[n:nat] arrayptr(Material,n) = "mac#"

fun LoadMaterialDefault() : Material = "mac#"

fun UnloadMaterial(Material) : void = "mac#"

fun SetMaterialTexture(&Material, MaterialMapType, Texture2D) : void = "mac#"

fun SetModelMeshMaterial(model: &Model, meshId: int, materialId: int) : void = "mac#"

fun LoadModelAnimations(string, &int? >> int n) : #[n:nat] arrayptr(ModelAnimation,n) = "mac#"

fun UpdateModelAnimation(!Model, !ModelAnimation, int) : void = "mac#"

fun UnloadModelAnimation(ModelAnimation) : void = "mac#"

fun IsModelAnimationValid(!Model, !ModelAnimation) : bool = "mac#"

fun GenMeshPoly(int, float) : Mesh = "mac#"

fun GenMeshPlane(float, float, int, int) : Mesh = "mac#"

fun GenMeshCube(float, float, float) : Mesh = "mac#"

fun GenMeshSphere(float, int, int) : Mesh = "mac#"

fun GenMeshHemiSphere(float, int, int) : Mesh = "mac#"

fun GenMeshCylinder(float, float, int) : Mesh = "mac#"

fun GenMeshTorus(float, float, int, int) : Mesh = "mac#"

fun GenMeshKnot(float, float, int, int) : Mesh = "mac#"

fun GenMeshHeightmap(!Image, Vector3) : Mesh = "mac#"

fun GenMeshCubicmap(!Image, Vector3) : Mesh = "mac#"

fun MeshBoundingBox(!Mesh) : BoundingBox = "mac#"

fun MeshTangents(&Mesh) : void = "mac#"

fun MeshBinormals(&Mesh) : void = "mac#"

fun DrawModel( !Mode3D_v | !Model, Vector3, float, Color) : void = "mac#"

fun DrawModelEx( !Mode3D_v | !Model, Vector3, Vector3, float, Vector3, Color) : void = "mac#"

fun DrawModelWires( !Mode3D_v | !Model, Vector3, float, Color) : void = "mac#"

fun DrawModelWiresEx( !Mode3D_v | !Model, Vector3, Vector3, float, Vector3, Color) : void = "mac#"

fun DrawBoundingBox( !Mode3D_v | BoundingBox, Color) : void = "mac#"

fun DrawBillboard( !Mode3D_v | Camera, !Texture2D, Vector3, float, Color) : void = "mac#"

fun DrawBillboardRec( !Mode3D_v | Camera, !Texture2D, Rectangle, Vector3, float, Color) : void = "mac#"

fun CheckCollisionSpheres(Vector3, float, Vector3, float) : bool = "mac#"

fun CheckCollisionBoxes(BoundingBox, BoundingBox) : bool = "mac#"

fun CheckCollisionBoxSphere(BoundingBox, Vector3, float) : bool = "mac#"

fun CheckCollisionRaySphere(Ray, Vector3, float) : bool = "mac#"

fun CheckCollisionRaySphereEx(Ray, Vector3, float, cPtr0(Vector3)) : bool = "mac#"

fun CheckCollisionRayBox(Ray, BoundingBox) : bool = "mac#"

fun GetCollisionRayModel(Ray, !Model) : RayHitInfo = "mac#"

fun GetCollisionRayTriangle(Ray, Vector3, Vector3, Vector3) : RayHitInfo = "mac#"

fun GetCollisionRayGround(Ray, float) : RayHitInfo = "mac#"

fun LoadText(fileName: string) : Strptr0 = "mac#"

fun LoadShader(vsFileName: string, fsFileName: string) : Shader = "mac#"

fun LoadShaderCode(vsCode: string, fsCode:string) : Shader = "mac#"

fun UnloadShader(Shader) : void = "mac#"

(** TODO: see if these needs to be freed or not **)

fun GetShaderDefault() : Shader = "mac#"

fun GetTextureDefault() : Texture2D = "mac#"

fun GetShapesTexture() : Texture2D = "mac#"

(** ** **)

fun GetShapesTextureRec() : Rectangle = "mac#"

fun SetShapesTexture(!Texture2D, Rectangle) : void = "mac#"

fun GetShaderLocation(!Shader, string) : int = "mac#"

fun SetShaderValue{a:t@ype+}(!Shader, int, &a, ShaderUniformDataType(a) ) : void = "mac#"

fun SetShaderValueV{a:t@ype+}{n:nat}(Shader, int, &array(a,n), ShaderUniformDataType(a), int n) : void = "mac#"

fun SetShaderValueMatrix(!Shader, int, Matrix) : void = "mac#"

fun SetShaderValueTexture(!Shader, int, Texture2D) : void = "mac#"

fun SetMatrixProjection(Matrix) : void = "mac#"

fun SetMatrixModelview(Matrix) : void = "mac#"

fun GetMatrixModelview() : Matrix = "mac#"

fun GetMatrixProjection() : Matrix = "mac#"

fun GenTextureCubemap(!Shader, !Texture2D, int) : Texture2D = "mac#"

fun GenTextureIrradiance(!Shader, !Texture2D, int) : Texture2D = "mac#"

fun GenTexturePrefilter(!Shader, !Texture2D, int) : Texture2D = "mac#"

fun GenTextureBRDF(!Shader, int) : Texture2D = "mac#"

absview ShaderMode_v
fun BeginShaderMode(!Shader) 
  : (ShaderMode_v | void) = "mac#"

fun EndShaderMode(ShaderMode_v |) : void = "mac#"

absview BlendMode_v
fun BeginBlendMode(BlendMode) 
  : (BlendMode_v | void) = "mac#"

fun EndBlendMode(BlendMode_v |) : void = "mac#"

absview VrSim_v
fun InitVrSimulator() : (VrSim_v | void) = "mac#"

fun CloseVrSimulator(VrSim_v |) : void = "mac#"

fun UpdateVrTracking(cPtr0(Camera)) : void = "mac#"

fun SetVrConfiguration(VrDeviceInfo, !Shader) : void = "mac#"

fun IsVrSimulatorReady() : bool = "mac#"

fun ToggleVrMode() : void = "mac#"

absview VrDrawing_v
fun BeginVrDrawing() : (VrDrawing_v | void) = "mac#"

fun EndVrDrawing(VrDrawing_v |) : void = "mac#"

absview AudioDevice_v
fun InitAudioDevice() : (AudioDevice_v | void) = "mac#"

fun CloseAudioDevice(AudioDevice_v |) : void = "mac#"

fun IsAudioDeviceReady( !AudioDevice_v | ) : bool = "mac#"

fun SetMasterVolume( !AudioDevice_v | float) : void = "mac#"

fun LoadWave(string) : Wave = "mac#"

fun LoadSound(string) : Sound = "mac#"

fun LoadSoundFromWave(!Wave) : Sound = "mac#"

fun UpdateSound(!Sound, cPtr0(void), int) : void = "mac#"

fun UnloadWave(Wave) : void = "mac#"

fun UnloadSound(Sound) : void = "mac#"

fun ExportWave(!Wave, cPtr0(char)) : void = "mac#"

fun ExportWaveAsCode(!Wave, cPtr0(char)) : void = "mac#"

fun PlaySound( !AudioDevice_v | !Sound) : void = "mac#"

fun StopSound( !AudioDevice_v | !Sound) : void = "mac#"

fun PauseSound( !AudioDevice_v | !Sound) : void = "mac#"

fun ResumeSound( !AudioDevice_v | !Sound) : void = "mac#"

fun PlaySoundMulti( !AudioDevice_v | !Sound) : void = "mac#"

fun StopSoundMulti( !AudioDevice_v | ) : void = "mac#"

fun GetSoundsPlaying( !AudioDevice_v | ) : int = "mac#"

fun IsSoundPlaying( !AudioDevice_v | !Sound) : bool = "mac#"

fun SetSoundVolume(!Sound, float) : void = "mac#"

fun SetSoundPitch(!Sound, float) : void = "mac#"

fun WaveFormat(&Wave, int, int, int) : void = "mac#"

fun WaveCopy(!Wave) : Wave = "mac#"

fun WaveCrop(&Wave, int, int) : void = "mac#"

fun GetWaveData(!Wave) : cPtr0(float) = "mac#"

fun LoadMusicStream(fileName: string) : Music = "mac#"

fun UnloadMusicStream(Music) : void = "mac#"

fun PlayMusicStream( !AudioDevice_v | !Music) : void = "mac#"

fun UpdateMusicStream( !AudioDevice_v | !Music) : void = "mac#"

fun StopMusicStream( !AudioDevice_v | !Music) : void = "mac#"

fun PauseMusicStream( !AudioDevice_v | !Music) : void = "mac#"

fun ResumeMusicStream( !AudioDevice_v | !Music) : void = "mac#"

fun IsMusicPlaying( !AudioDevice_v | !Music) : bool = "mac#"

fun SetMusicVolume(!Music, float) : void = "mac#"

fun SetMusicPitch(!Music, float) : void = "mac#"

fun SetMusicLoopCount(!Music, int) : void = "mac#"

fun GetMusicTimeLength(!Music) : float = "mac#"

fun GetMusicTimePlayed(!Music) : float = "mac#"

fun InitAudioStream(uint, uint, uint) : AudioStream = "mac#"

fun UpdateAudioStream(!AudioStream, cPtr0(void), int) : void = "mac#"

fun CloseAudioStream(AudioStream) : void = "mac#"

fun IsAudioStreamProcessed(!AudioStream) : bool = "mac#"

fun PlayAudioStream(!AudioStream) : void = "mac#"

fun PauseAudioStream(!AudioStream) : void = "mac#"

fun ResumeAudioStream(!AudioStream) : void = "mac#"

fun IsAudioStreamPlaying(!AudioStream) : bool = "mac#"

fun StopAudioStream(!AudioStream) : void = "mac#"

fun SetAudioStreamVolume(!AudioStream, float) : void = "mac#"

fun SetAudioStreamPitch(!AudioStream, float) : void = "mac#"

fun SetAudioStreamBufferSizeDefault(int) : void = "mac#"

