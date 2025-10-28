{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = "qimgv.desktop";
      "image/bmp" = "qimgv.desktop";
      "image/tiff" = "qimgv.desktop";
      "image/png" = "qimgv.desktop";

      "application/pdf" = "org.kde.okular.desktop";

      # default browser
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
    };
  };
}
