{ pkgs, ... }:
{
  systemd.user.startServices = "sd-switch";
  programs.home-manager = {
    enable = true;
  };

  home = {
    username = "tori";
    homeDirectory = "/home/tori";
    packages = with pkgs; [
      ffmpeg
      unrar
      unzip
      yt-dlp
      zip
    ];
    stateVersion = "24.05";
  };
}
