{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.pygobject3
    pkgs.gobject-introspection
    pkgs.playerctl
  ];

  shellHook = ''
    export GI_TYPELIB_PATH=${pkgs.playerctl}/lib/girepository-1.0:$GI_TYPELIB_PATH
    export PYTHONPATH=${pkgs.python3Packages.pygobject3}/lib/${pkgs.python3.libPrefix}/site-packages:$PYTHONPATH
  '';
}
