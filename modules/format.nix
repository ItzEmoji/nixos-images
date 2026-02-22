{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  config.perSystem =
    { ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
      };
    };
}
