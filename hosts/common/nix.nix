_: {
  nix = {
    settings = {
      allowed-users = ["tori"];
      download-buffer-size = 536870912;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-jobs = 14;
      substituters = ["https://claude-code.cachix.org"];
      trusted-public-keys = ["claude-code.cachix.org-1:YeXf2aNu7UTX8Vwrze0za1WEDS+4DuI2kVeWEE4fsRk="];
      warn-dirty = false;
    };
  };
}
