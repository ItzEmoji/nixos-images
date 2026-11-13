{ ... }:
{
  flake.nixosModules.console =
    { pkgs, lib, ... }:
    {
      console = {
        earlySetup = true;
        font = "ter-v24n";
        packages = [ pkgs.terminus_font ];
      };
      services.getty.autologinUser = lib.mkForce "root";
    };
}
