f: let
  inherit (f) is-null;
in rec {
  or-y = y: x:
    if is-null x
    then y
    else x;

  or-y' = y: x:
    if
      (
        is-null x
        || x == ""
        || x == []
        || x == {}
      )
    then y
    else x;

  w-k-x = k: x: attrset:
    (attrset |> or-y {}) // {"${k}" = x;};

  env-or = env-key: y: f.get-env env-key |> or-y' y;

  err = {
    unexpected-t = t: f.abort "Unexpected type: ${t}";
    unexpected-t' = t-bad: t-good:
      f.abort
      ''
        Unexpected type: ${t-bad}
        Type needed: ${t-good}
      '';
    required-k = k: info:
      f.abort
      ''
        Key '${k}' is required!

        ${info}
      '';
  };
}
