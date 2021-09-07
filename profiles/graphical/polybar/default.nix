{ lib, config, options, pkgs, ... }: {
  environment.etc = {
    "polybar/bars.ini".source = ./bars.ini;
    "polybar/colors.ini".source = ./colors.ini;
    "polybar/config.ini".source = ./config.ini;
    "polybar/launch.sh".source = ./launch.sh;
    "polybar/modules.ini".source = ./modules.ini;
    "polybar/preview.ini".source = ./preview.ini;
    "polybar/preview.sh".source = ./preview.sh;
    "polybar/user_modules.ini".source = ./user_modules.ini;
    "polybar/scripts/checkupdates".source = ./scripts/checkupdates;
    "polybar/scripts/color-switch.sh".source = ./scripts/color-switch.sh;
    "polybar/scripts/colors-dark.sh".source = ./scripts/colors-dark.sh;
    "polybar/scripts/colors-light.sh".source = ./scripts/colors-light.sh;
    "polybar/scripts/launcher.sh".source = ./scripts/launcher.sh;
    "polybar/scripts/powermenu.sh".source = ./scripts/powermenu.sh;
    "polybar/scripts/pywal.sh".source = ./scripts/pywal.sh;
    "polybar/scripts/random.sh".source = ./scripts/random.sh;
    "polybar/scripts/rofi/colors.rasi".source = ./scripts/rofi/colors.rasi;
    "polybar/scripts/rofi/confirm.rasi".source = ./scripts/rofi/confirm.rasi;
    "polybar/scripts/rofi/launcher.rasi".source = ./scripts/rofi/launcher.rasi;
    "polybar/scripts/rofi/message.rasi".source = ./scripts/rofi/message.rasi;
    "polybar/scripts/rofi/networkmenu.rasi".source = ./scripts/rofi/networkmenu.rasi;
    "polybar/scripts/rofi/powermenu.rasi".source = ./scripts/rofi/powermenu.rasi;
    "polybar/scripts/rofi/styles.rasi".source = ./scripts/rofi/styles.rasi;
  };
}
