# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,inputs, ... }:

let 


in
{

  environment.defaultPackages = [ ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  
  programs.nix-ld.enable = true;

  nix = {
	  settings = {
		  experimental-features = [ "nix-command" "flakes" ];
		  auto-optimise-store = true;
	  };

  };

  # Display Manager
  services.displayManager = {
  	sessionPackages = [pkgs.hyprland pkgs.sway];
	enable = true;
	gdm = {
		enable = true;
		wayland = true;
	};
  };
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kokoss = {
    isNormalUser = true;
    description = "kokoss";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
# List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # firefox
  # kitty
  wget
  ];




  # add some config
  
  programs.hyprland = {
  	enable = true;
	package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
	# make sure to also set the portal package, so that they are in sync
	portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

 
  programs.git.enable = true;

  programs.light.enable = true;

  programs.zsh.enable = true;

  users.users.kokoss.shell = pkgs.zsh;
  system.stateVersion = "25.05"; # Did you read the comment?



  

}
