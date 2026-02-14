_: {
  networking = {
    networkmanager.enable = true;
    hostName = "aether";

    extraHosts = ''
      127.0.0.1 livi-ar-website.ddev.site
      199.232.17.91 dl.flathub.org
    '';

    firewall = {
      allowedTCPPorts = [ 25565 ];
      allowedUDPPorts = [
        24454
        5520
      ];
    };
  };
}
