{ ... }:

{

  boot = {
    tmp.cleanOnBoot = true;

    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
  };
}
