{ config, ... }:

{
  boot = {
    kernelParams = [ "module_blacklist=amdgpu" ];
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    nvidiaPersistenced = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;

    powerManagement = {
      enable = true;
      finegrained = false;
    };
  };
}
