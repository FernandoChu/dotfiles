{ lib, config, options, pkgs, ... }: {

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  environment.etc = {
    "i3/language.sh".source = ./language.sh;
  };

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      configFile = ./config;
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
      ];
    };
  };
}
