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
      ];
    };
}
