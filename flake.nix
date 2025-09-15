{
  description = "order";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./home/profiles
        ./hosts
        ./overlays
      ];
      systems = ["x86_64-linux"];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
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
    claude-code.url = "github:sadjow/claude-code-nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    technorino.url = "git+https://github.com/2547techno/technorino?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
