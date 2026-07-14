{...}: {
  programs.thunderbird.enable = true;

  programs.thunderbird.profiles."jens@feodor.dk" = {
    isDefault = true;
  };

  accounts.email.accounts."jens@feodor.dk" = {
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
    thunderbird.settings = id: {
      "mail.identity.id_${id}.fcc_folder" = "imap://jens%40feodor.dk@imap.one.com/Sent";
    };
  };
}
