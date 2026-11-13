{ ... }:
{
  flake.nixosModules.console =
    { pkgs, ... }:
    {
      console = {
        earlySetup = true;
        font = "ter-v24n";
        packages = [ pkgs.termius_font ];
      };
      services.getty.autologinUser = "root";
    };
}
