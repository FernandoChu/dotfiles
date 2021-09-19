{ lib, config, options, pkgs, ... }: {
  environment = {
    etc = {
      "kitty/kitty.conf".source = ./kitty.conf;
    };
    systemPackages = with pkgs; [
      kitty
    ];
    variables = {
      "KITTY_CONFIG_DIRECTORY" = "/etc/kitty";
    };
  };
}
