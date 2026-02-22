{ ... }:
{
  flake.nixosModules.kmscon =
    { pkgs, ... }:
    {

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
    };
}
