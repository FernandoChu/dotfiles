let
  # set ssh public keys here for your system and user
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6VkL6X9FZ3nwhfeYsekSZlfLfCsQqGQxeVehsk8Z7F root@shiranai";
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGWTkyrwUn7ufVjYuahpJTD5Cr1MXm9Rs7OXxdjSau0W nan@shiranai";
  allKeys = [ system user ];
in
{
  "github.age".publicKeys = allKeys;
  "nan.age".publicKeys = allKeys;
}
