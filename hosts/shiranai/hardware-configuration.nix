{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/f50c6fee-e9a5-46ae-bb11-7683b7e7edd0";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/1F43-6479";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/f773b00f-6ab8-43e2-b425-571d7863a464"; }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
