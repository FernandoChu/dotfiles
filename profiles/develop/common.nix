{ pkgs, ... }: {
  # imports = [ ./zsh ./kakoune ./tmux ];

  environment.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  #environment.sessionVariables = {
  #  PAGER = "less";
  #  LESS = "-iFJMRWX -z-4 -x4";
  #  LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
  #  EDITOR = "k";
  #  VISUAL = "k";
  #};

  environment.systemPackages = with pkgs; [
    git-crypt
    gnupg
    less
    wget
    neovim
  ];

  fonts =
    let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [ "FiraCode" "DejaVuSansMono" ];
      };
    in
    {
      fonts = [ nerdfonts ];
      fontconfig.defaultFonts.monospace =
        [ "FiraCode DejaVu Sans Mono Nerd Font Complete Mono" ];
    };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };
}