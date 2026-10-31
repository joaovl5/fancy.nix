{pkgs}: let
  fancy = (import ./..).init {inherit pkgs;};
in {
  builtins = import ./builtins.nix fancy;
  nixpkgs = import ./nixpkgs.nix fancy;
}
