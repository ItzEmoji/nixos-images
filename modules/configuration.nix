{ self, inputs, ... }:

{
  flake.nixosConfigurations.nixos-installer = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs self; };
    modules = [
      "${inputs.nixpkgs}/nixos/modules/image/images.nix"
      inputs.nvim.nixosModules.nvim
      self.nixosModules.kmscon
      self.nixosModules.ssh-server
      self.nixosModules.xkb
      self.nixosModules.packages
      self.nixosModules.nix-config
      self.nixosModules.root-user
      {
        nixpkgs.hostPlatform = "x86_64-linux";
        networking.hostName = "nixos-installer";
        networking.networkmanager.enable = true;
      }
    ];
  };
}
