{ lib, pkgs, ... }:
let
  extensions = (with pkgs.vscode-extensions; [
    bbenoist.Nix
    vscodevim.vim
  ]);
  # ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
  #   name ="Gruvbox Material";
  #   publisher="sainnhe";
  #   version="6.4.6";
  #   sha256="fds";
  # }];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
in
{
  environment.systemPackages = [
    vscode-with-extensions
  ];
}
