{ pkgs, suites, ... }:
{
  ### root password is empty by default ###
  imports = [ ./hardware-configuration.nix ] ++ suites.base ++ suites.graphics;

  nix = {
    trustedUsers = [ "root" ];
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.mutableUsers = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Lima";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0f1.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:swapescape";
  services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  # Backlight
  hardware.acpilight.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pamixer
  ];
}
