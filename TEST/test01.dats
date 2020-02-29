(**
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

implement main0 () 
  = println!("Hello [test01]") where 
    {
      val (WIN | ()) 
        = InitWindow( 800, 450, "[test01] - Basic window" );

      val () = begin
        loop( WIN | ) where {
          fun loop ( WIN: Window_v | ) : void =
            if ~WindowShouldClose() 
            then let
                val (DRAW | ()) 
                  = BeginDrawing(WIN | );
                val () = (
                  ClearBackground( RAYWHITE );
                  DrawText("Congrats! You just created your first window!", 190, 200, 20, LIGHTGRAY);
                )
                val (WIN | ()) 
                  = EndDrawing(DRAW | );
              in
                 loop( WIN | ) 
             end
            else CloseWindow( WIN | )
        }
      end
    }
