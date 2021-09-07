{ config, self, lib, pkgs, ... }:
{
  age.secrets = {
    github.file = "${self}/secrets/github.age";
    github.owner = "nan";
    nan.file = "${self}/secrets/nan.age";
    nan.owner = "nan";
  };

  home-manager.users.nan = { suites, ... }: {
    imports = suites.base;
    programs.git = {
      userName = "Fernando Chu";
      userEmail = "fernandochu97@gmail.com";
    };

    programs.ssh = {
      enable = true;
      hashKnownHosts = true;

      matchBlocks = {
        github = {
          host = "github.com";
          identityFile = config.age.secrets.github.path;
          extraOptions = { AddKeysToAgent = "yes"; };
        };
      };
    };
  };

  users.users.nan = {
    uid = 1000;
    password = "";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
  };
}
