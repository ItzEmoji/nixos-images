{ ... }:
{
  flake.nixosModules.console =
    { pkgs, ... }:
    {
      console = {
        earlySetup = true;
        font = "ter-v24n";
        packages = [ pkgs.terminus_font ];
      };
      services.getty.autologinUser = "root";
    };
}
