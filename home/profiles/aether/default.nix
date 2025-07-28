{ pkgs, ... }:

{
  imports = [
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
    ../../packages/thunar.nix

    ../../programs/browsers/firefox
    ../../programs/editor/zed
    ../../programs/media/feh.nix
    ../../programs/media/zathura.nix
    ../../programs/terminal/alacritty.nix
    ../../programs/terminal/direnv.nix
    ../../programs/terminal/fish.nix
    ../../programs/terminal/lazygit.nix
    ../../programs/terminal/vifm.nix
    ../../programs/tools/obs-studio.nix
    ../../programs/tools/wine.nix
    ../../programs/util/git.nix
  ];

  home.packages = with pkgs; [
    # gaming
    azahar
    desmume
    lutris
    melonDS
    mgba
    prismlauncher
    sc-controller

    # media
    ani-cli
    spotify
    vlc

    # tools
    arandr
    aseprite
    godot
    helvum
    krita
    nsxiv
    polychromatic
    xournalpp

    # programs
    chatterino2
    google-chrome
    vesktop

    # terminal
    calcurse
    gnumake
    hexedit
    imagemagick
    neofetch
    p7zip
    poppler_utils
    nss

    # libs
    openssl
  ];
}
