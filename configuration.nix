{ config, pkgs, ... }:

{
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.xserver = {
    xkb = {
      layout = "ch";
    };
  };
  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "JetBrains Mono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      }
    ]; 
    autologinUser = "root";
    useXkbConfig = true;
  };

  # Basic system configuration
  environment.systemPackages = with pkgs; [
    git
    util-linux
    curl
    wget
    fastfetch
  ];
  # Enable SSH for remote access during installation
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  

  # Set up networking
  networking.hostName = "nixos-installer";
  networking.networkmanager.enable = true;

  # Root password for installer (empty by default for ISO)

  users.users.root.initialPassword = "";
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ6mkR7siw01qo8FPru7N5AyP9qkr3B1VtiERugolDz" ];


  system.stateVersion = "25.05";
}
