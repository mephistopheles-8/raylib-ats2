# raylib-ats2

Bindings to [raylib](https://www.raylib.com/) for ATS2.

These bindings attempt to track resources and effects.
Resource and effect modelling are not perfect yet.

I haven't gotten around to modelling some parts of the library.  If you
see `cptr` types, it's likely I have not yet verified  semantics of the given ptr.

## C-Like Bindings

C-like bindings are provided in `SATS/raylib_raw.sats`.  These
are easier to use, but are not much safer than writing FFI directly.

Note: at the moment, it's not possible to share types between the
normal and raw bindings: use one or the other within a given scope.
Mixing results in confusing type errors, because the types have
the same name.

## TODO

- Improve effects modelling
- Provide a binding that uses viewtypes without effects.
- Improve the situation for shared types between bindings.  

LICENSE: MIT
