@_:
  just --list

@run-tests:
  nix eval \
    --json \
    --file tests/default.nix \
    --apply "x: x {pkgs = import <nixpkgs> {};}"
