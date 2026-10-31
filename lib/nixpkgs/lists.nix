fancy: let
  lib = fancy._lib;
in {
  sort-by = lib.sortOn;
  dedupe = lib.unique;
  when-list = lib.optionals;
  concat-map = lib.concatMap;
  inherit (lib) flatten;
}
