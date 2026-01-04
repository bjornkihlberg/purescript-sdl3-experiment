{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.chez
    pkgs.purescript
  ];

  buildInputs = [
    pkgs.shaderc
    pkgs.sdl3
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.shaderc.lib}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=${pkgs.sdl3}/lib:$LD_LIBRARY_PATH
  '';
}