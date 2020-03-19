(**
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

staload $RAYLIB

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

      val (WIN | ())
        = InitWindow( screenWidth, screenHeight
          , "[test02] - Keyboard input" );

      val () = begin
        SetTargetFPS( WIN | 60 );
        loop( WIN | ballPosition ) where {
          fun loop{l:addr}(WIN: Window_v(l) | ballPosition : &Vector2  ) : void =
            if ~WindowShouldClose( WIN | ) 
            then let
                val () = 
                  ( ifcase
                     | IsKeyDown( WIN | KEY_RIGHT) => 
                          ballPosition.x := ballPosition.x + 2.0f
                     | IsKeyDown( WIN | KEY_LEFT) => 
                          ballPosition.x := ballPosition.x - 2.0f
                     | IsKeyDown( WIN | KEY_UP) => 
                          ballPosition.y := ballPosition.y - 2.0f
                     | IsKeyDown( WIN | KEY_DOWN) => 
                          ballPosition.y := ballPosition.y + 2.0f
                     | _ => ()
                  );
                val (DRAW | ()) 
                  = BeginDrawing(WIN | );
                val ( ) = (
                  ClearBackground( DRAW | RAYWHITE );
                  DrawText( DRAW | "Move the ball with arrow keys", 10, 10, 20, DARKGRAY);
                  DrawCircleV( DRAW | ballPosition, 50.0f, MAROON );
                )
                val () 
                  = EndDrawing(WIN, DRAW | );
              in
                loop( WIN | ballPosition )
             end
            else CloseWindow( WIN |)
        }
      end
    }
