{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./earlyoom.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware.nix
    # ./kanata.nix
    ./network.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./scx.nix
    ./virtualisation.nix
    ./vpn.nix
    ./xorg.nix
    ./zram.nix
    ../common
  ];

  environment.variables = {
    WEBKIT_DISABLE_DMABUF_RENDERER = "1";
  };

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

  # wooting
  hardware.wooting.enable = true;

  # udev
  services.udev = {
    enable = true;

    extraRules = ''
      # Wooting One Legacy
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"

      # Wooting One update mode
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"

      # Wooting Two Legacy
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"

      # Wooting Two update mode
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"

      # Generic Wooting devices
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
    '';
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
  nixpkgs.config.allowUnsupportedSystem = true;

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
