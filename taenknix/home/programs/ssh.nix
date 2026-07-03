{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # Explicit default config (programs.ssh.enableDefaultConfig is deprecated)
    # Changed addKeysToAgent from "no" to "yes"
    settings = {
      "Host *" = {
        forwardAgent = false;
        addKeysToAgent = "yes";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
    };
  };
}
