{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages (ps: with ps; [
      pygobject3
      requests
    ]))
    pkgs.pkg-config
    pkgs.gobject-introspection
    pkgs.glib
    pkgs.gtk3
    pkgs.playerctl
  ];

  # Needed so Python GI bindings can find Playerctl
  shellHook = ''
    export GI_TYPELIB_PATH="${pkgs.playerctl}/lib/girepository-1.0:$GI_TYPELIB_PATH"
  '';
}
