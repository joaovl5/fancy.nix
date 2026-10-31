{pkgs ? null}: let
  # out =
  #   (import ./a.nix args)
  #   // (import ./b.nix args);
  nixpkgs =
    if !isNull pkgs
    then import ./nixpkgs pkgs out
    else {};
  builtins = import ./builtins out;
  misc = import ./misc out;
  out = builtins // misc // nixpkgs;
in
  out
