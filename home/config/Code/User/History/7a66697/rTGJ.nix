{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cunit
    pkgs.gcc
    pkgs.gnumake
  ];
}