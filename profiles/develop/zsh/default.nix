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

    interactiveShellInit =
      let
        zshrc = fileContents ./zshrc;

        sources = with pkgs; [
          "${skim}/share/skim/completion.zsh"
          "${oh-my-zsh}/share/oh-my-zsh/plugins/sudo/sudo.plugin.zsh"
          "${oh-my-zsh}/share/oh-my-zsh/plugins/extract/extract.plugin.zsh"
          "${zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh"
          "${zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"
          "${zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
          "${zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        ];

        source = map (source: "source ${source}") sources;

        functions = pkgs.stdenv.mkDerivation {
          name = "zsh-functions";
          src = ./functions;

          ripgrep = "${pkgs.ripgrep}";
          man = "${pkgs.man}";
          exa = "${pkgs.exa}";

          installPhase =
            let basename = "\${file##*/}";
            in
            ''
              mkdir $out

              for file in $src/*; do
                substituteAll $file $out/${basename}
                chmod 755 $out/${basename}
              done
            '';
        };

        plugins = concatStringsSep "\n" source;

        localCompletions = toString ./completions;

        bashCompletion = ''
        '';

      in
      ''
        export STARSHIP_CONFIG=${
          pkgs.writeText "starship.toml"
          (fileContents ./starship.toml)
        }

        ${plugins}

        fpath+=( ${functions} ${localCompletions} )
        autoload -Uz ${functions}/*(:t)

        ${zshrc}

        ${bashCompletion}

        eval "$(${pkgs.starship}/bin/starship init zsh)"
        eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
        source ${pkgs.skim}/share/skim/key-bindings.zsh

        # needs to remain at bottom so as not to be overwritten
        bindkey jj vi-cmd-mode
      '';
  };
}
