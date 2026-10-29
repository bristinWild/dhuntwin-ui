{
  description = "Dhun Twin OS — QML UI for Logos Basecamp";

  inputs = {
    logos-app-builder.url =
      "github:bristinWild/logos-app-builder-dhuntwin/dhuntwin-compat";

    dhuntwin_core.url =
      "github:bristinWild/dhuntwin-core";
  };

  outputs = inputs@{ logos-app-builder, ... }:
    logos-app-builder.lib.mkLogosQmlModule {
      src = ./.;
      configFile = ./metadata.json;
      flakeInputs = inputs;
    };
}