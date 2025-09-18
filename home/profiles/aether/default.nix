{
  pkgs,
  inputs,
  ...
}:
let
  cfg = {
    starship.settings = "aether";
  };
in
{
  _module.args = { inherit cfg; };

  imports = [
    # ../../gtk

    ../../languages/c
    ../../languages/go
    ../../languages/haskell
    ../../languages/java
    ../../languages/javascript
    ../../languages/julia
    ../../languages/latex
    ../../languages/nix
    ../../languages/python
    ../../languages/rust

    ../../packages/cemu.nix
    ../../packages/teams.nix
    ../../packages/prismlauncher
    ../../packages/norisk-client

    ../../programs/browsers/firefox
    ../../programs/editor/zed
    ../../programs/media/feh.nix
    ../../programs/media/zathura.nix
    ../../programs/terminal/alacritty.nix
    ../../programs/terminal/direnv.nix
    ../../programs/terminal/fish.nix
    ../../programs/terminal/lazygit.nix
    ../../programs/terminal/starship
    ../../programs/terminal/vifm.nix
    ../../programs/tools/obs-studio.nix
    ../../programs/tools/rofi.nix
    ../../programs/tools/wine.nix
    ../../programs/util/git.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  home.packages = with pkgs; [
    # gaming
    azahar
    desmume
    lutris
    melonDS
    mgba
    sc-controller

    # media
    ani-cli
    spotify
    vlc

    # tools
    arandr
    aseprite
    blockbench
    filezilla
    godot
    helvum
    kanata
    krita
    nsxiv
    polychromatic
    wootility
    scrot
    xclip
    xcolor
    xfe
    xournalpp

    # programs
    chatterino7
    google-chrome
    lima
    vesktop

    # terminal
    calcurse
    claude-code
    ddev
    file
    gnumake
    hexedit
    imagemagick
    neofetch
    nh
    p7zip
    poppler_utils
    nss

    # libs
    openssl

    # system
    envfs
  ];

  nixpkgs.overlays = [
    # inputs.self.overlays.technorino
  ];
}
