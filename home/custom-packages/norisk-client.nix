{
  pkgs,
  nixpkgs,
  ...
}: let
  lib = nixpkgs.lib;
in
  pkgs.rustPlatform.buildRustPackage rec {
    pname = "noriskclient-launcher";
    version = "0.6.8";

    src = pkgs.fetchFromGithub {
      owner = "NoRiskClient";
      repo = "noriskclient-launcher";
      rev = "refs/tags/v${version}";
      hash = "";
    };

    npmDeps = pkgs.fetchNpmDeps {
      name = "${pname}-${version}-npm-deps";
      inherit src;
      forceGitDeps = true;
      hash = "sha256-tk/pZlub+rRDgEB51FA+MmXl6ihoFqBXGc8GaLP8Hu4=";
    };

    forceGitDeps = true;
    makeCacheWriteable = true;

    cargoRoot = "src-tauri";

    useFetchCargoVendor = true;
    cargoHash = "sha256-rm0s4GD+aSI9ilfY+8yrR1uuiNC1C9P7BnaEnCCTBQQ=";

    buildAndTestSubdir = cargoRoot;

    nativeBuildInputs = with pkgs; [
      npmHooks.npmConfigHook
      nodejs

      cargo-tauri_1.hook

      pkg-config
      wrapGAppsHook3
    ];

    buildInputs = with pkgs; [
      openssl
      libsoup_2_4
      webkitgtk_4_0
      glib-networking
    ];

    meta = {
      description = "Minecraft client application made using svelte + tauri";
      homepage = "https://norisk.gg";
      license = lib.licenses.gpl3Only;
  }
