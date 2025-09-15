{pkgs, ...}: {
  systemd.services = {
    kanata-default.serviceConfig = {
      SupplementaryGroups = [
        "input"
        "uinput"
      ];
    };
  };

  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;

    keyboards.default = {
      extraDefCfg = ''
        process-unmapped-keys yes
        danger-enable-cmd yes
      '';

      # Ä Ö Ü ä ö ü ß

      config = ''
        (defsrc j k l ;)

        (defalias
          oum
          	(fork
           		_
           		(fork
           			(unicode ö)
             		(unicode Ö) (lsft rsft)) (lalt)))

        (defalias
          uum
          	(fork
           		_
              (fork
              	(unicode ü)
              	(unicode Ü) (lsft rsft)) (lalt)))

        (defalias aum
         	(fork
        		_
        		(fork
          		(unicode ä)
           		(unicode Ä) (lsft rsft)
            ) (lalt)
          )
        )

        (defalias ss
        	(fork
        		s
           	(unicode ß) (lalt)
          )
        )

        (deflayer default @aum @uum @oum @ss)
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    xdotool
  ];
}
