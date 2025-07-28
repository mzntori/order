{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.fish;

    users.tori = {
      isNormalUser = true;
      description = "tori";
      extraGroups = [
        "networkmanager"
        "wheel"
        "openrazer"
      ];
    };
  };
}
