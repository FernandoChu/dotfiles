{ lib, pkgs, ... }:
let
  inherit (builtins) concatStringsSep;

  inherit (lib) fileContents;

in
{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableBashCompletion = true;
    enableGlobalCompInit = false;

    histSize = 10000;

    setOptions = [
      "incappendhistory"
      "sharehistory"
      "histignoredups"
      "histfcntllock"
      "histreduceblanks"
      "histignorespace"
      "histallowclobber"
      "autocd"
      "cdablevars"
      "nomultios"
      "pushdignoredups"
      "autocontinue"
      "promptsubst"
    ];
  };
}
