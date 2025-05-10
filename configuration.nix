{ config, pkgs, ... }:

{
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Basic system configuration
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    neovim
    fastfetch
    cfdisk
  ];

  # Enable SSH for remote access during installation
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # Set up networking
  networking.hostName = "nixos-installer";
  networking.useDHCP = true;

  # Root password for installer (empty by default for ISO)
  users.users.root.initialPassword = "";
}
