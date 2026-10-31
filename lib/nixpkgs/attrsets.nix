f: let
  lib = f._lib;
in rec {
  get-path = lib.getAttrFromPath;
  set-path = lib.setAttrByPath;
  # inverted so the 1st attrset takes precedence
  deep-merge = x: y: lib.attrsets.recursiveUpdate y x;
  # uninverted
  deep-merge' = lib.attrsets.recursiveUpdate;
  when-attrs = lib.optionalAttrs;
  map-attrs = lib.mapAttrs;
  map-attrs' = lib.mapAttrs';
  kv-pair = lib.nameValuePair;
  attr-values = lib.attrValues;

  w-k-x-deep = k: x: attrset:
    (attrset |> f.or-y {}) |> deep-merge {${k} = x;};
}
