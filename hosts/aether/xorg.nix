{ pkgs, ... }:
{
  services.libinput.mouse.middleEmulation = false;

  services.xserver = {
    enable = true;
    videoDrivers = [
      "nvidia"
    ];

    desktopManager = {
      xterm.enable = false;
    };

    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    windowManager = {
      i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3lock
          xdg-user-dirs
        ];
      };
    };
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };

  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
    xlock.enable = true;
    xscreensaver.enable = true;
  };
}
