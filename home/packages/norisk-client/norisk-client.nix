{
  callPackage,
  symlinkJoin,
}:
let
  norisk-client-unwrapped = callPackage ./nnorisk-client-unwrapped.nix { };
in
symlinkJoin {

}
