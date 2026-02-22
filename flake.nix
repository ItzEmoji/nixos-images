{
  description = "NixOS Netboot (iPXE) + optional Installer ISO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvim.url = "github:ItzEmoji/nvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
