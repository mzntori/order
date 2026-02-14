{
  fetchFromGitHub,
  lib,
  rustPlatform,
  pkg-config,
  glib,
  cairo,
  pango,
  atk,
  gtk3,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "livesplit-one-druid";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "AlexKnauth";
    repo = "livesplit-one-druid";
    tag = finalAttrs.version;
    hash = "sha256-biICJ08mPkgTn9MqxNZeYZGLOv9T0rePBn8OAAVaZHI=";
  };

  cargoHash = "sha256-d86NodegJtiAK0HKi1bZrNrvNomhgsLknZ83Jdlc9/k=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    glib
    cairo
    pango
    atk
    gtk3
  ];

  meta = {
    description = "Livesplit One using built on a druid GUI";
    homepage = "https://github.com/AlexKnauth/livesplit-one-druid";
    license = lib.licenses.unlicense;
    mainProgram = "livesplit-one-druid";
  };
})
