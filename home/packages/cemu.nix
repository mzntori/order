{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cemu
    cubeb # audio backend
    evdevhook2
  ];
}
