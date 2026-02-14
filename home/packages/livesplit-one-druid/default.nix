{ pkgs, ... }:
let
  livesplit-one-druid = pkgs.callPackage ./livesplit-one-druid.nix { };
in
{
  home.packages = [ livesplit-one-druid ];
}
