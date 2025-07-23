{
  description = "order";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      pkgs,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "order-dev";
        packages = with pkgs; [
          git
          helix
          fish
        ];
        shellHook = ''
          	fish
        '';
      };
    };
}
