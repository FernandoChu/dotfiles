{ lib, pkgs, ... }:
let
  extensions = (with pkgs.vscode-extensions; [
    bbenoist.Nix
    vscode-extensions.vscodevim.vim
  ]);
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
