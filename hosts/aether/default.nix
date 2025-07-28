{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./gaming.nix
    ./hardware.nix
    ./network.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./xorg.nix
    ../common
  ];

  # for testinmg
  programs.fish.enable = true;

  services = {
    # for sway
    gnome.gnome-keyring.enable = true;
  };

  services.upower = {
    enable = true;
  };

  # flatpak
  services.flatpak = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  # razer
  hardware.openrazer.enable = true;

  # udev
  services.udev = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  services.gvfs.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    helix
    pamixer
    man-pages
    man-pages-posix
    xmousepasteblock

    openrazer-daemon

    # wayland
    grim
    slurp
    wl-clipboard
    mako
  ];

  system.stateVersion = "24.05";
}
