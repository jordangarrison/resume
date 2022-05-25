{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell { buildInputs = [ simple-http-server texlive.combined.scheme-full ]; }
