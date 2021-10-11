{ lib, config, options, pkgs, ... }: {
  environment.etc = {
    "polybar/bars.ini".source = ./bars.ini;
    "polybar/colors.ini".source = ./colors.ini;
    "polybar/config.ini".source = ./config.ini;
    "polybar/launch.sh".source = ./launch.sh;
    "polybar/modules.ini".source = ./modules.ini;
    "polybar/user_modules.ini".source = ./user_modules.ini;
    "polybar/scripts/launcher.sh".source = ./scripts/launcher.sh;
    "polybar/scripts/powermenu.sh".source = ./scripts/powermenu.sh;
  };
}
