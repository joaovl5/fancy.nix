fancy: let
  pkgs = fancy._pkgs;
  lib = fancy._lib;
in {
  inherit
    (lib.types)
    # keep-sorted start
    anything
    bool
    enum
    float
    int
    lines
    number
    package
    port
    raw
    str
    unspecified
    # keep-sorted end
    ;

  json-format = pkgs.formats.json {};

  bool-or = lib.types.boolByOr;

  path-store = lib.types.pathInStore;
  path-external = lib.types.externalPath;
  path-absolute = lib.types.pathWith {absolute = true;};
  path-relative = lib.types.pathWith {absolute = false;};

  # composites
  list = lib.types.listOf;
  attrs = lib.types.attrsOf;
  attrs-any = lib.types.attrs;
  attrs-lazy = lib.types.lazyAttrsOf;
  or-null = lib.types.nullOr;
  or-either = lib.types.either;
  one-of = lib.types.oneOf;

  # other
  mod-sub = lib.types.submodule;
  mod-deferred = lib.types.deferredModule;
}
