{ self, ... }:
{
  systems = [
    "x86_64-linux"
  ];
  perSystem =
    { system, pkgs, ... }:
    let 
      build = self.nixosConfigurations.nixos-installer.config.system.build;
    in
    {
      packages = {
        azure = build.images.azure;
        cloudstack = build.images.cloudstack;
        digital-ocean = build.images.digital-ocean;
        google-compute = build.images.google-compute;
        hyperv = build.images.hyperv;
        linode = build.images.linode;
        lxc = build.images.lxc;
        lxc-metadata = build.images.lxc-metadata;
        oci = build.images.oci;
        openstack = build.images.openstack;
        openstack-zfs = build.images.openstack-zfs;
        proxmox = build.images.proxmox;
        proxmox-lxc = build.images.proxmox-lxc;
        qemu-efi = build.images.qemu-efi;
        qemu = build.images.qemu;
        raw-efi = build.images.raw-efi;
        raw = build.images.raw;
        kubevirt = build.images.kubevirt;
        vagrant-virtualbox = build.images.vagrant-virtualbox;
        virtualbox = build.images.virtualbox;
        vmware = build.images.vmware;
        iso = build.images.iso;
        iso-installer = build.images.iso-installer;
        sd-card = build.images.sd-card;
        kexec = build.images.kexec;
        
        netboot = pkgs.symlinkJoin {
            name = "netboot";
            paths = [
              build.images.kexec.passthru.config.system.build.netbootRamdisk
              build.images.kexec.passthru.config.system.build.kernel
              build.images.kexec.passthru.config.system.build.netbootIpxeScript
            ];
          };
        };
    };
}
