{ cfg, ... }:

let
  settings = import ./settings;
in
{
  programs.starship = {
    enable = false;
    settings = settings { inherit cfg; };
  };
}
