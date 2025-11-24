{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages (ps: with ps; [ pygobject3 requests ]))
    pkgs.pkg-config
    pkgs.gobject-introspection
    pkgs.glib
    pkgs.gtk3
  ];
}
