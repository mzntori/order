{pkgs, ...}: {
  home.packages = with pkgs; [
    (python313.withPackages (ps: with ps; [pip requests aiofiles aiohttp httpx pyjwt packaging json5 tenacity duckdb duckdb]))
  ];

  programs.ruff = {
    enable = true;
    settings = {};
  };
}
