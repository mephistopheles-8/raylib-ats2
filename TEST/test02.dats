(**
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

implement main0 () 
  = println!("Hello [test02]") where 
    {
      val screenWidth = 800
      val screenHeight = 450
      var ballPosition : Vector2
      val () = (
          ballPosition.x := screenWidth / 2.0f;
          ballPosition.y := screenHeight / 2.0f
        )

      val () = begin
        InitWindow( screenWidth, screenHeight
          , "[test02] - Keyboard input" );
        SetTargetFPS( 60 );
        loop( ballPosition ) where {
          fun loop ( ballPosition : &Vector2  ) : void =
            if ~WindowShouldClose() 
            then begin
                ( ifcase
                   | IsKeyDown(KEY_RIGHT) => 
                        ballPosition.x := ballPosition.x + 2.0f
                   | IsKeyDown(KEY_LEFT) => 
                        ballPosition.x := ballPosition.x - 2.0f
                   | IsKeyDown(KEY_UP) => 
                        ballPosition.y := ballPosition.y - 2.0f
                   | IsKeyDown(KEY_DOWN) => 
                        ballPosition.y := ballPosition.y + 2.0f
                   | _ => ()
                ); 
                BeginDrawing();
                  ClearBackground( RAYWHITE );
                  DrawText("Move the ball with arrow keys", 10, 10, 20, DARKGRAY);
                  DrawCircleV(ballPosition, 50.0f, MAROON );
                EndDrawing();
                loop( ballPosition )
              end
            else CloseWindow()
        }
      end
    }
