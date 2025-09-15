# https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/rust/build-rust-package/default.nix
{
  cargo-tauri,
  fetchFromGitHub,
  fetchYarnDeps,
  lib,
  yarn,
  yarnBuildHook,
  yarnConfigHook,
  yarnInstallHook,
  nodejs,
  pkg-config,
  wrapGAppsHook3,
  openssl,
  libsoup_3,
  webkitgtk_4_1,
  glib-networking,
  rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "noriskclient-launcher";
  version = "v0.6.8";

  src = fetchFromGitHub {
    owner = "NoRiskClient";
    repo = "noriskclient-launcher";
    rev = version;
    hash = "sha256-T33y9I6FXmrleLDBxTVMIQK35fZAgDgrKcb02ABAt+E=";
  };

  npmDeps = fetchYarnDeps {
    name = "${pname}-${version}-npm-deps";
    inherit src;
    forceGitDeps = true;
    hash = "sha256-MEdT/1jPtt9PIMGzBaiji67UUqwDi+vF//w9cAvtOBk=";
  };

  cargoHash = "sha256-0vVN2vJW+hrjQeTEw3L8JKa4/C83sCtxNJEaTkwwbT8=";
  cargoRoot = "src-tauri";
  buildAndTestSubdir = cargoRoot;

  forceGitDeps = true;
  makeCacheWritable = true;

  nativeBuildInputs = [
    cargo-tauri.hook
    nodejs
    pkg-config
    wrapGAppsHook3
  ];

  buildInputs = [
    openssl
    libsoup_3
    webkitgtk_4_1
    glib-networking
    yarn
  ];

  buildPhase = ''
    ${yarn}/bin/yarn build
  '';

  meta = {
    description = "A Minecraft PVP Client Launcher";
    homepage = "https://norisk.gg/";
    license = lib.licenses.gpl3Only;

    mainProgram = "no-risk-client";
  };
})
# rustPlatform.buildRustPackage (finalAttrs: {
#   pname = "ripgrep";
#   version = "14.1.1";
#   src = fetchFromGitHub {
#     owner = "BurntSushi";
#     repo = "ripgrep";
#     rev = "${finalAttrs.version}";
#     hash = "sha256-gyWnahj1A+iXUQlQ1O1H1u7K5euYQOld9qWm99Vjaeg=";
#   };
#   cargoHash = "sha256-9atn5qyBDy4P6iUoHFhg+TV6Ur71fiah4oTJbBMeEy4=";
#   meta = {
#     description = "Fast line-oriented regex search tool, similar to ag and ack";
#     homepage = "https://github.com/BurntSushi/ripgrep";
#     license = lib.licenses.unlicense;
#     maintainers = [];
#   };
# })
# stdenv.mkDerivation rec {
#   pname = "icat";
#   version = "v0.5";
#   src = fetchFromGitHub {
#     owner = "atextor";
#     repo = "icat";
#     rev = "${version}";
#     sha256 = "sha256-aiLPVdKSppT/PWPW0Ue475WG61pBLh8OtLuk2/UU3nM=";
#   };
#   buildInputs = [
#     imlib2
#     xorg.libX11
#   ];
#   installPhase = ''
#     runHook preInstall
#     mkdir -p $out/bin
#     cp icat icat $out/bin
#     runHook postInstall
#   '';
# }

