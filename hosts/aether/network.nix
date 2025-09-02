_: {
  networking = {
    networkmanager.enable = true;
    hostName = "aether";

    extraHosts = ''
      104.21.112.1 cdn.7tv.app
      127.0.0.1 livi-ar-website.ddev.site
    '';

    firewall = {
      allowedTCPPorts = [25565];
      allowedUDPPorts = [24454];
    };
  };
}
