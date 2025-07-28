# lots of things stolen from https://git.flake.sh/notohh/snowflake
{
  description = "order";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./home/profiles
        ./hosts
      ];
      systems = [ "x86_64-linux" ];
      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            name = "order-dev";
            packages = with pkgs; [
              alejandra
              git
              helix
              nil
            ];
          };
          formatter = pkgs.alejandra;
        };
    };

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # utils
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
