{ cfg }:
if cfg.starship.settings == "aether" then
  import ./aether.nix
else
  {
    format = "";
  }
