


[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)



# NixOS Custom Installer

This is a Custom NixOS installer, which I can use to install NixOS faster.
In it I've defined my public key, my applications, etc.

If anyone want to copy it feel free to Fork it.


## Installation

Simply download the latest Image.
```bash
wget https://github.com/ItzEmoji/nixos-images/releases/latest/download/nixos-installer.iso
```
Then flash it using dd to the disk
```bash
dd if=nixos-installer.iso of=/dev/sdX
```
Done :)
## FAQ

#### Why does the Actions not work?

Make a Release with latest Tag. 

#### Why it doesn't work with the wget command?

Change ItzEmoji to your Github Username and the Repo to your desired one.


