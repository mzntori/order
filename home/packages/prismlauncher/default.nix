{ pkgs, ... }:
let
  nrc-wrapper-go = pkgs.callPackage ./nrc-wrapper-go.nix { };
in
{
  home.packages = [
    pkgs.prismlauncher
    nrc-wrapper-go
  ];
}
