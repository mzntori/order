{
  inputs,
  self,
  ...
}:
let
  homeImports = {
    "tori@aether" = [
      ./aether
      ../.
    ];
  };

  extraSpecialArgs = { inherit inputs self; };
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{
  _module.args = { inherit homeImports; };

  flake = {
    homeConfigurations = {
      "tori_aether" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = homeImports."tori@aether";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
