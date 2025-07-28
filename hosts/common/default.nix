{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./documentation.nix
    ./nix.nix
    ./ssh.nix
    ./users.nix
  ];
}
