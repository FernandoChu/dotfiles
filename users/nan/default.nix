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
    programs = {
      git = {
        userName = "Fernando Chu";
        userEmail = "fernandochu97@gmail.com";
      };
      ssh = {
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
      vscode = {
        userSettings = {
          "keyboard.dispatch" = "keyCode";
          "vim.useSystemClipboard" = true;
        };
      };
    };
    services = {
      dunst = {
        enable = true;
      };
    };
  };

  users.users.nan = {
    uid = 1000;
    passwordFile = "/run/secrets/nan";
    description = "NaN";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
  };
}
