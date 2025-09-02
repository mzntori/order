{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    configFile.source = ./config/config;

    extraPackages = with pkgs; [
      i3lock
      rofi
      xdg-user-dirs
      xclip
      xcolor
    ];
  };
}
