_: {
  flake.overlays.chatterino7 = final: prev: {
    chatterino7 = prev.chatterino7.overrideAttrs (
      old: {
        src = {
          rev = "68d9edf29542ec9b4d751ac655fb81a0c7dc3e44";
        };
      }
    );
  };
}
