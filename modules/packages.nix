{ ... }:
{
  flake.nixosModules.packages =
    { inputs, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        util-linux
        curl
        wget
        fastfetch
        libeatmydata
        debootstrap
        arch-install-scripts
        inputs.nixos-dotfiles.packages.${pkgs.system}.tmux
        inputs.nixos-dotfiles.packages.${pkgs.system}.bat
      ];
    };
}
