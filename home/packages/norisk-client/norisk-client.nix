# https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/rust/build-rust-package/default.nix
# https://git.qyliss.net/nixlib/diff/doc/languages-frameworks/javascript.section.md?id=79a75faeb9b91b598a748f90f1026c477c5eb488&id2=063943c214aed7e583d9ec026a56e5b5b806b53d
{
  stdenv,
  fetchFromGitHub,
  fetchYarnDeps,
  rustPlatform,
  cargo,
  rustc,
  cargo-tauri,
  nodejs,
  yarn,
  yarnConfigHook,
  pkg-config,
  gobject-introspection,
  libsoup_3,
  webkitgtk_4_1,
  libayatana-appindicator,
  openssl,
  wrapGAppsHook4,
  glib-networking,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "noriskclient-launcher";
  version = "0.6.9-beta.14";

  src = fetchFromGitHub {
    owner = "NoRiskClient";
    repo = "noriskclient-launcher";
    tag = "v${finalAttrs.version}";
    hash = "sha256-T33y9I6FXmrleLDBxTVMIQK35fZAgDgrKcb02ABAt+E=";
  };

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = finalAttrs.src + "/yarn.lock";
    hash = "sha256-MEdT/1jPtt9PIMGzBaiji67UUqwDi+vF//w9cAvtOBk=";
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      cargoRoot
      ;
    hash = "sha256-0vVN2vJW+hrjQeTEw3L8JKa4/C83sCtxNJEaTkwwbT8=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
    cargo-tauri.hook
    nodejs
    yarn
    yarnConfigHook
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    openssl
    gobject-introspection
    libsoup_3
    webkitgtk_4_1
    libayatana-appindicator
    glib-networking
  ];

  postPatch = ''
    substituteInPlace $cargoDepsCopy/libappindicator-sys-*/src/lib.rs \
      --replace-fail "libayatana-appindicator3.so.1" "${libayatana-appindicator}/lib/libayatana-appindicator3.so.1"
  '';

  tauriBuildFlags = [
    "-c"
    "{\"bundle\":{\"createUpdaterArtifacts\":false}}"
  ];

  meta = {
    description = "";
    homePage = "";
  };
})
