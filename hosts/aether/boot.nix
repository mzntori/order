{pkgs, ...}: {
  boot = {
    tmp.cleanOnBoot = true;

    kernelPackages = pkgs.linuxPackages_latest;

    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
  };
}
