{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWowPackages.stable
    mono
  ];
}
