{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.fish;

    users.tori = {
      isNormalUser = true;
      description = "tori";
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
        "openrazer"
        "uinput"
      ];
    };
  };
}
