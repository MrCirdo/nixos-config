{...}:
{
  security.apparmor = {
    enable = true;
    policies."no-internet-connection" = {
      profile = ''
      #include <abstractions/base>
      #include <abstractions/lightdm>

        # block ipv4 acces
        deny network inet,
        # ipv6 
        deny network inet6,
        # raw socket
        deny network raw,

        owner /** rwm,
      '';
    };

  };
}
