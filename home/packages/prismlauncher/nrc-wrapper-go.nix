{
  fetchFromGitHub,
  lib,
  buildGoModule,
}:
buildGoModule rec {
  pname = "nrc-wrapper-go";
  version = "v1.3.8-2";

  src = fetchFromGitHub {
    owner = "technicfan";
    repo = "nrc-wrapper-go";
    rev = version;
    hash = "sha256-LNLnh3Vnr4OKIXbTg5HgOKopkchKP8XS/eTw2tBe20I=";
  };

  vendorHash = "sha256-PvwvVavGTV5QGprMn1M2SOq6upaYCzyzM6dNvZzlXo4=";

  postInstall = ''
    mv $out/bin/main $out/bin/nrc-wrapper
  '';

  meta = {
    description = "A Wrapper for NoRisk Client for 3rd-Party Minecraft Launchers.";
    homepage = "https://norisk.gg/";
    license = lib.licenses.gpl3Only;
    mainProgram = "nrc-wrapper";
  };
}
