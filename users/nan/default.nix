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
        settings = rec {
          global = {
            markup = "none";
            format = ''
              <big><b>%s</b></big>
              %b'';
            sort = false;
            alignment = "left";
            bounce_freq = 0;
            word_wrap = true;
            ignore_newline = false;
            geometry = "450x100-15+49";
            transparency = 10;
            separator_height = 2;
            padding = 12;
            horizontal_padding = 20;
            line_height = 3;
            separator_color = "frame";
            frame_width = 2;
            frame_color = "#EC5F67";
          };

          urgency_normal = {
            foreground = "#CDD3DE";
            background = "#101010";
            timeout = 6;
          };
          urgency_low = urgency_normal;
          urgency_critical = urgency_normal;
        };
      };
    };
  };

  users.users.nan = {
    uid = 1000;
    passwordFile = "/run/secrets/nan";
    description = "NaN";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ]; # Enable ‘sudo’ for the user.
  };
}
