{
  description = "NixOS Netboot (iPXE) + Installer ISO using Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    iso = nixos-generators.nixosGenerate {
      inherit system;
      format = "install-iso";
      modules = [ ./configuration.nix ];
    };

    packages.${system}.netboot =
      let
        build = self.nixosConfigurations.netboot.config.system.build;
      in
      pkgs.linkFarm "netboot-images" [
        {
          name = "bzImage";
          path = "${build.netbootKernel}/bzImage";
        }
        {
          name = "initrd";
          path = "${build.netbootRamdisk}/initrd";
        }
        {
          name = "netboot.ipxe";
          path = "${build.netbootIpxeScript}/netboot.ipxe";
        }
      ];

    nixosConfigurations.netboot = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        "${nixpkgs}/nixos/modules/installer/netboot/netboot-minimal.nix"
        ./configuration.nix
      ];
    };
  };
}

