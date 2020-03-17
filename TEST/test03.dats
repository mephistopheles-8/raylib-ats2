(**
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

(** It would be frustrating to model this safely **)
%{
static void 
_set_model_diffuse_texture( Model * model, Texture2D texture ) {
    model->materials[0].maps[MAP_DIFFUSE].texture = texture;
}
%}

extern
fun _set_model_diffuse_texture( &Model, !Texture2D ) : void = "mac#"

implement main0 () 
  = println!("Hello [test03]") where 
    {
      #define NUM_MODELS  8      // Parametric 3d shapes to generate

      val screenWidth = 800
      val screenHeight = 450

      val (WIN | ())
        = InitWindow( screenWidth, screenHeight
          , "[test03] - [models] example - mesh generation" );

      val checked : Image = GenImageChecked(2,2,1,1,RED,GREEN)
      var texture : Texture2D = LoadTextureFromImage(WIN | checked)
      val () = UnloadImage( checked )

      var models = @[Model][NUM_MODELS]()
      val () = array_initize<Model>(models, i2sz(NUM_MODELS)) where {
        implement
        array_initize$init<Model>(i,x) =
          x := LoadModelFromMesh(gen_mesh(sz2i(i))) where {
            fn gen_mesh ( x: int ) : Mesh =
              case+ x of
              | 0 => GenMeshPlane(2.0f,2.0f,5,5)
              | 1 => GenMeshCube(2.0f,1.0f,2.0f)
              | 2 => GenMeshSphere(2.0f,32,32)
              | 3 => GenMeshHemiSphere(2.0f,16,16)
              | 4 => GenMeshCylinder(1.0f,2.0f,16)
              | 5 => GenMeshTorus(0.25f,4.0f,16,32)
              | 6 => GenMeshKnot(1.0f,2.0f,16,128)
              | _ => GenMeshPoly(5,2.0f)
          }
      }
      val _ = array_foreach_env<Model><Texture2D>( models, i2sz(NUM_MODELS), texture )
        where {
          implement
          array_foreach$fwork<Model><Texture2D>( x, tex ) 
              = _set_model_diffuse_texture( x , tex )
        }

      var camera : Camera
      var position : Vector3
      var currentModel  : intBtwe(0,NUM_MODELS-1) = 0

      val () = (
        position.x := 0.0f;
        position.y := 0.0f;
        position.z := 0.0f;

        camera.position.x := 5.0f;
        camera.position.y := 5.0f;
        camera.position.z := 5.0f;
        camera.target.x := 0.0f;
        camera.target.y := 0.0f;
        camera.target.z := 0.0f;
        camera.up.x := 0.0f;
        camera.up.y := 1.0f;
        camera.up.z := 0.0f;
        camera.fovy := 45.0f;
        camera.type := CAMERA_PERSPECTIVE 
      )

      val () = SetCameraMode(camera,CAMERA_ORBITAL)


      val () = begin
        SetTargetFPS( WIN | 60 );
        // Main game loop
        loop( WIN | camera, currentModel, position, models ) where {
          fun loop{l:addr}(
              WIN: Window_v(l) |
              camera : &Camera 
            , currentModel : &intBtwe(0,NUM_MODELS-1) >> _
            , position : Vector3
            , models : &array(Model,NUM_MODELS)
            ) : void =
            if ~WindowShouldClose( WIN | ) 
            then let

                // Update
                //-------------------------------------------------

                val () = (
                  UpdateCamera( camera );
                  ( ifcase 
                    | IsKeyPressed( WIN | KEY_RIGHT ) || 
                      IsMouseButtonPressed( WIN | MOUSE_LEFT_BUTTON ) => (
                        if currentModel < NUM_MODELS - 1
                        then currentModel := currentModel + 1
                        else currentModel := 0 
                      )
                    | IsKeyPressed( WIN | KEY_LEFT ) => (
                      if currentModel = 0 
                      then currentModel := NUM_MODELS - 1 
                      else currentModel := currentModel - 1
                    )
                    | _ => ()
                  ); 
                )

                // Draw
                //-------------------------------------------------

                val (DRAW | ()) 
                  = BeginDrawing(WIN | );
                val () = ClearBackground( DRAW | RAYWHITE);
                val (M3D | ()) 
                       = BeginMode3D( DRAW | camera)

                val (pf, pff | p)
                  = array_ptr_takeout( view@models | addr@models, i2sz( currentModel ) )

                val () =    DrawModel( M3D | !p, position, 1.0f, PURPLE)

                prval pfa = pff( pf )
                prval () = view@models := pfa

                val () =    DrawGrid( M3D | 10,1.0f)
                val (DRAW | ()) 
                       = EndMode3D( M3D | ) 

                val () = DrawRectangle( DRAW | 30,400,310,30,Fade(SKYBLUE,0.5f))
                val () = DrawRectangleLines( DRAW | 30,400,310,30,Fade(DARKBLUE,0.5f))
                val () = DrawText( DRAW | 
                          "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS"
                        , 40, 410, 10, BLUE
                        )
                val () = model_label( DRAW | currentModel ) where {
                  fn model_label{l:addr}( DRAW: !Drawing_v(l) | x: int ) : void =
                    case+ x of
                    | 0 => DrawText( DRAW | "PLANE", 680, 10, 20, DARKBLUE)
                    | 1 => DrawText( DRAW | "CUBE", 680, 10, 20, DARKBLUE)
                    | 2 => DrawText( DRAW | "SPHERE", 680, 10, 20, DARKBLUE)
                    | 3 => DrawText( DRAW | "HEMISPHERE", 680, 10, 20, DARKBLUE)
                    | 4 => DrawText( DRAW | "CYLINDER", 680, 10, 20, DARKBLUE)
                    | 5 => DrawText( DRAW | "TOURUS", 680, 10, 20, DARKBLUE)
                    | 6 => DrawText( DRAW | "KNOT", 680, 10, 20, DARKBLUE)
                    | _ => DrawText( DRAW | "POLY", 680, 10, 20, DARKBLUE)
                }
                val () 
                  = EndDrawing(DRAW | );
              in
                loop( WIN | camera, currentModel, position, models )
             end
            else CloseWindow( WIN |)
        }
      end
      
      val () = UnloadTexture(texture); // Unload texture
      val () = array_uninitize<Model>(models,i2sz(NUM_MODELS)) where {
        implement
        array_uninitize$clear<Model>(i,x) = UnloadModel(x)
      }
    }
