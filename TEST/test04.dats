(**
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

staload $RAYLIB_RAW

implement main0 () 
  = println!("Hello [test04]") where 
    {
      val () = begin
        InitWindow( 800, 450, "[test01] - Basic window" );
        SetTargetFPS( 60 );
        loop() where {
          fun loop () : void =
            if ~WindowShouldClose() 
            then begin
                BeginDrawing();
                  ClearBackground( RAYWHITE );
                  DrawText("Congrats! You just created your first window!", 190, 200, 20, LIGHTGRAY);
                EndDrawing();
                loop()
              end
            else CloseWindow()
        }
      end
    }
