{ pkgs, ... }:
let inherit (builtins) readFile;
in
{
  imports = [ ../develop/common.nix ./i3 ./polybar ./rofi ./kitty ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #};

  environment = {

    #etc = {
    #  "xdg/gtk-3.0/settings.ini" = {
    #    text = ''
    #      [Settings]
    #      gtk-icon-theme-name=Papirus
    #      gtk-theme-name=Adapta
    #      gtk-cursor-theme-name=Adwaita
    #    '';
    #    mode = "444";
    #  };
    #};

    #sessionVariables = {
    #  # Theme settings
    #  QT_QPA_PLATFORMTHEME = "gtk2";
    #
    #  GTK2_RC_FILES =
    #    let
    #      gtk = ''
    #        gtk-icon-theme-name="Papirus"
    #        gtk-cursor-theme-name="Adwaita"
    #      '';
    #    in
    #    [
    #      ("${pkgs.writeText "iconrc" "${gtk}"}")
    #      "${pkgs.adapta-gtk-theme}/share/themes/Adapta/gtk-2.0/gtkrc"
    #      "${pkgs.gnome3.gnome-themes-extra}/share/themes/Adwaita/gtk-2.0/gtkrc"
    #    ];
    #};

    systemPackages = with pkgs; [
      #adapta-gtk-theme
      #cursor
      brave
      discord
      dolphin
      ferdi
      #dzen2
      fantasque-sans-mono
      feh
      flameshot
      #ffmpeg-full
      #gnome3.adwaita-icon-theme
      #gnome3.networkmanagerapplet
      #gnome-themes-extra
      #imagemagick
      #imlib2
      #librsvg
      #libsForQt5.qtstyleplugins
      libnotify
      #manpages
      material-design-icons
      #papirus-icon-theme
      #pulsemixer
      #qt5.qtgraphicaleffects
      #sddm-chili
      #stdmanpages
      #xsel
      rofi
      zathura
      dmenu
      polybar
      networkmanager_dmenu
      #volnoti
    ];
  };

  location.provider = "geoclue2";
  services.redshift.enable = true;
  services.xbanish.enable = true;

  # services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
    };
  };
}
