fancy: let
  lib = fancy._lib;
in {
  str-from-bool = lib.boolToString;
  when-str = lib.optionalString;
  merge-lines = lib.concatLines;
  split-str = lib.splitString;
  escape-shell-str = lib.escapeShellArg;
  to-shell-var = lib.toShellVar;
  inherit (lib) join;
}
