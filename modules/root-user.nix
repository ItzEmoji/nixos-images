{ ... }:
{
  flake.nixosModules.root-user =
    { ... }:
    {
      users.users.root = {
        initialPassword = "";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ6mkR7siw01qo8FPru7N5AyP9qkr3B1VtiERugolDz"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIAI3W3ii3wTtymNIe1CnlesvDKkD25rJgjHhw/JT8fSZAAAACnNzaDpiYWNrdXA="
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICuaCz9aSJshTF8DffCZO0aguecn1BKvvNSWnZ/9PFtqAAAABHNzaDo="
        ];
      };
    };
}
