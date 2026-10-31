_: {
  is-null = builtins.isNull;
  is-str = builtins.isString;
  is-attrs = builtins.isAttrs;
  is-int = builtins.isInt;

  attrs-from-list = builtins.listToAttrs;

  str-sub = builtins.substring;

  read-file = builtins.readFile;
  write-file = builtins.toFile;
  read-dir = builtins.readDir;

  from-json = builtins.fromJSON;
  from-toml = builtins.fromTOML;

  to-xml = builtins.toXML;
  to-type = builtins.typeOf;
  to-json = builtins.toJSON;
  to-str = builtins.toString;
  to-file = builtins.toFile;

  get-env = builtins.getEnv;

  # alias kept for compatibility with older consumers
  type-of = builtins.typeOf;

  fetch-tarball = builtins.fetchTarball;
  fetch-git = builtins.fetchGit;

  try-eval = builtins.tryEval;

  inherit
    (builtins)
    warn
    throw
    trace
    abort
    any
    all
    filter
    elem
    ;
}
