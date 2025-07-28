{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.requests
  ];

  programs.ruff = {
    enable = true;
    settings = { };
  };
}
