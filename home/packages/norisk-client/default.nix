{pkgs, ...}: let
  norisk-client = pkgs.callPackage ./norisk-client.nix {};
in {
  home.packages = [
    norisk-client
  ];
}
