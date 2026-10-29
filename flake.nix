{
  description = "Dhun Twin OS — QML UI for Logos Basecamp";

  inputs = {
    logos-app-builder.url =
  "path:/Users/bristinborah/dhuntwin/logos-app-builder-local";

    dhuntwin_core = {
      url = "path:/Users/bristinborah/dhuntwin/dhuntwin-basecamp/dhuntwin-core";
      flake = true;
    };
  };

  outputs = inputs@{ logos-app-builder, ... }:
    logos-app-builder.lib.mkLogosQmlModule {
      src = ./.;
      configFile = ./metadata.json;
      flakeInputs = inputs;
    };
}