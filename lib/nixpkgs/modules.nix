f: let
  lib = f._lib;
in {
  mod-eval = modules: special-args: extra-opts:
    lib.evalModules ({
        specialArgs = special-args;
        inherit modules;
      }
      // extra-opts);
  mod-ns = ns: {inherit ns;};

  w-opts = f.w-k-x "opts";
  w-cfg = f.w-k-x "cfg";
  w-extra = f.w-k-x "extra";
  w-imports = f.w-k-x "imports";

  w-freeform = f.w-k-x "freeformType";

  w-def = f.w-k-x "default";
  w-def-txt = f.w-k-x "defaultText";
  w-desc = f.w-k-x "description";
  w-example = f.w-k-x "example";
  w-apply = f.w-k-x "apply";
  # these we can already mark the next arg since they curry
  w-internal = f.w-k-x "internal" true;
  w-hidden = f.w-k-x "visible" false;
  w-read-only = f.w-k-x "readOnly" true;
  # some helpers
  w-toggle = f.bool |> f.opt |> f.w-def true;
  w-toggle' = f.bool |> f.opt |> f.w-def false;

  merge = lib.mkMerge;
  when = lib.mkIf;
  force = lib.mkForce;
  override = lib.mkOverride;
  default = lib.mkDefault;
  do-at = lib.mkOrder;
  do-before = lib.mkBefore;
  do-after = lib.mkAfter;
  do-assert = lib.mkAssert;
  opt = t: lib.mkOption {type = t;};

  mod-bake = module-args: bake-args: let
    ns =
      bake-args.ns or (
        f.err.required-k "ns" "Use `mod-ns` for setting the namespace!"
      )
      |> (
        x: let
          t = f.to-type x;
        in
          if t == "list"
          then x
          else if t == "string"
          then [x]
          else f.err.unexpected-t' t "string or list"
      );
    get-ns = f.get-path ns;
    set-ns = f.set-path ns;
    lambda-args = {cfg = module-args.config |> get-ns;};
    options = bake-args.opts or {} |> handle-arg false |> set-ns;
    config = bake-args.cfg or {} |> handle-arg true;
    imports = bake-args.imports or [];
    extra = bake-args.extra or {} |> handle-arg false;
    handle-arg = lists-ok: x: let
      t = f.to-type x;
    in
      if t == "set"
      then x
      else if t == "lambda"
      then handle-arg lists-ok (x lambda-args)
      else if t == "list" && lists-ok
      then f.merge <| map (handle-arg lists-ok) x
      else
        f.err.unexpected-t' t (
          if lists-ok
          then "lambda/list/attrset"
          else "lambda/attrset"
        );
  in
    extra # we reject deep merges to avoid spooky behavior
    // {
      inherit
        options
        config
        imports
        ;
    };
}
