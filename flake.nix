  {
    description = "NixOS Netboot (iPXE) + optional Installer ISO";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixos-generators = {
        url = "github:nix-community/nixos-generators";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nvim.url = "github:ItzEmoji/nvim";
    };

    outputs = { self, nixpkgs, nixos-generators, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      iso = nixos-generators.nixosGenerate {
        specialArgs = { inherit inputs; };
        inherit system;
        format = "install-iso";
        modules = [ ./configuration.nix ];
      };

      packages.${system}.netboot =
        let
          build = self.nixosConfigurations.netboot.config.system.build;
          kernelFile =
            self.nixosConfigurations.netboot.config.system.boot.loader.kernelFile;
        in
        pkgs.linkFarm "netboot-images" [
          {
            name = "bzImage";
            path = "${build.kernel}/${kernelFile}";
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
        specialArgs = { inherit inputs; };
        inherit system;
        modules = [
          "${nixpkgs}/nixos/modules/installer/netboot/netboot-minimal.nix"
          ./configuration.nix
        ];
      };
    };
  }

