{ ... }:
{
  programs.thunderbird.enable = true;

  programs.thunderbird.profiles.personal = {
    isDefault = true;
  };

  accounts.calendar.accounts.personal = {
    thunderbird.enable = true;
  };

  accounts.email.accounts.personal = {
    primary = true;
    address = "jens@feodor.dk";
    realName = "Jens Feodor Nielsen";
    thunderbird.enable = true;
  };
}
