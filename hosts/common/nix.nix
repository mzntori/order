_: {
  nix = {
    settings = {
      allowed-users = [ "tori" ];
      download-buffer-size = 536870912;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };
}
