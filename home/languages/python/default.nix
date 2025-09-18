{pkgs, ...}: {
  home.packages = with pkgs; [
    (python313.withPackages (ps: with ps; [pip requests]))
  ];

  programs.ruff = {
    enable = true;
    settings = {};
  };
}
