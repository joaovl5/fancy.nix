pkgs: fancy:
{
  _pkgs = pkgs;
  _lib = pkgs.lib;
}
// (import ./attrsets.nix fancy)
// (import ./lists.nix fancy)
// (import ./strings.nix fancy)
// (import ./meta.nix fancy)
// (import ./modules.nix fancy)
// (import ./types.nix fancy)
// (import ./derivations.nix fancy)
