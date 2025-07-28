{
  inputs,
  homeImports,
  ...
}:
{
  flake.nixosConfigurations =
    let
      specialArgs = { inherit inputs; };
    in
    {
      aether = inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./aether
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.tori = {
                imports = homeImports."tori@aether";
              };
            };
          }
        ];
      };
    };
}
