{pkgs, ...}: let
  norisk-client = pkgs.callPackage ./nnorisk-client.nix {};
in {
  home.packages = [
    norisk-client
  ];
}
