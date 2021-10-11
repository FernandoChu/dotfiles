{ lib, config, options, pkgs, ... }: {
  environment.etc = {
    "/rofi/colors.rasi".source = ./colors.rasi;
    "/rofi/confirm.rasi".source = ./confirm.rasi;
    "/rofi/launcher.rasi".source = ./launcher.rasi;
    "/rofi/message.rasi".source = ./message.rasi;
    "/rofi/networkmenu.rasi".source = ./networkmenu.rasi;
    "/rofi/powermenu.rasi".source = ./powermenu.rasi;
    "/rofi/styles.rasi".source = ./styles.rasi;
  };
}
