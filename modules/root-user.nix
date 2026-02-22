{ ... }:
{
  flake.nixosModules.root-user =
    { ... }:
    {
      users.users.root = {
        initialPassword = "";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ6mkR7siw01qo8FPru7N5AyP9qkr3B1VtiERugolDz"
        ];
      };
    };
}
