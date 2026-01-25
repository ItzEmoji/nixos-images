{
  description = "NixOS installer ISO with Flakes";

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
    packages.${system}.netboot = let
      config = self.nixosConfigurations.netboot.config;
      build = config.system.build;
      kernelFileName = config.system.boot.loader.kernelFile;
    in pkgs.linkFarm "netboot-images" [
      {
        name = "bzImage";
        path = "${build.kernel}/${kernelFileName}";
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

