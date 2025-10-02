{ ... }:
{
  programs.thunderbird.enable = true;

  programs.thunderbird.profiles.personal = {
    isDefault = true;
  };

  accounts.email.accounts.personal = {
    thunderbird.enable = true;
    primary = true;
    address = "jens@feodor.dk";
    userName = "jens@feodor.dk";
    realName = "Jens Feodor Nielsen";
    smtp = {
      host = "send.one.com";
      port = 587;
      tls.enable = true;
      tls.useStartTls = true;
    };
    imap = {
      host = "imap.one.com";
      port = 993;
      tls.enable = true;
    };
  };
}
