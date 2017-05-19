# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "sergey-pc"; # Define your hostname.
  networking.networkmanager.enable = true;
  # Select internationalisation properties.
  i18n = {
  #   consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us,ru";
     defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  virtualisation.docker = {
    enable = true;
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
     neovim
     
     # term
     busybox
     bashCompletion

     # python
     python35
     python35Packages.pip

     # kde
     kdeApplications.ark
     kdeApplications.kate
     kdeApplications.kmix
     kdeApplications.okular
     kdeFrameworks.networkmanager-qt
     kdeconnect

  ];

  # List services that you want to enable:

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.synaptics = {
    enable = true;
    twoFingerScroll = true;
    maxSpeed = "2.0";
  };
  
  services.xserver.displayManager.sddm = {
    enable = true;
  };
  services.xserver.desktopManager.plasma5 = {
    enable = true;
  };
 

  services.mysql = {
    enable = true;
    package = pkgs.mysql;
    extraOptions = ''
        [client]
    	default-character-set = utf8mb4
    	
    	[mysql]
    	default-character-set = utf8mb4
    	
    	[mysqld]
    	character-set-client-handshake = FALSE
    	character-set-server = utf8mb4
    	collation-server = utf8mb4_unicode_ci
    '';
  };
  services.redis = {
    enable = true;
  };

  
  programs.zsh.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.sergey = {
     isNormalUser = true;
     uid = 1000;
     home = "/home/sergey";
     extraGroups = ["wheel" "networkmanager"];
     shell = pkgs.zsh;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";
  nixpkgs.config.allowUnfree = true;
}
