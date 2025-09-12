{config, ...}: let
  inherit (config.lib.formats.rasi) mkLiteral;
  rofi-theme = {
    "*" = {
    };
  };
in {
  programs.rofi = {
    enable = true;
    font = "Berkeley Mono 14";
    theme = rofi-theme;

    extraConfig = {
      show-icons = true;
      window-thumbnail = true;
    };
  };
}
