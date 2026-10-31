# « `fancy.nix` »

>[!NOTE]
>This library requires the `pipe-operators` Nix experimental feature.
>It's a hard-requirement as most of the things the library uses are
>completely built from these operators. It's a shame this is not the
>default for Nix, and for this reason the author does not recommend
>usage of this library if you cannot control the end-user's Nix
>settings.
>
>But here's a fun fact: once the author's other project,
>[Winter][winter], stabilizes and is finished, this library may get
>completely rewritten using the Winter language, with end-consumers
>not having to use pipe-operators since the Winter compiler may
>transform the code for compatibility with standard Nix. For the time
>being, however, this is not assured to come in the near future, thus
>still remain mindful of `fancy.nix`'s requirements.

[winter]: https://github.com/joaovl5/winter

A library for all your fancy Nix needs.
