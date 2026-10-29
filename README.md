# Dhun Twin OS — Logos Basecamp UI (initial working scaffold)

QML-only `ui_qml` app using the already built `dhuntwin_core` Logos module. The design carries over the original DhunTwin OS light palette, forest-green accent, six workspaces, and phase switching. All displayed numerical results come from the native C++ module; there are no fake dashboard metrics.

## Project structure

```
dhuntwin-ui/
  flake.nix
  metadata.json
  qml/Main.qml
```

Place `dhuntwin-ui` **beside** `dhuntwin-core` (the folder extracted from the supplied backend archive), so the `path:../dhuntwin-core` Nix input resolves. Then:

```sh
cd dhuntwin-ui
nix build -L
nix run .
```

The package must be started with `dhuntwin_core` available/loaded. For Basecamp proper, build/package both modules and install the core first. In Apps Inspector, load `dhuntwin_ui`.

## Implemented

- Six navigation workspaces, branded left rail, core connectivity and refresh state.
- Today / Phase 1 / Build-out switching via `setPhase`.
- Live calls to `campusView`, `twinSnapshot`, `liveTwin`, `ledger`, `defaultScenario`, `runScenario`, `computeCommonsDefaults`, `calculateComputeScenario`, `reconcileBaseline`, and `registry`.
- Model readouts dynamically rendered from the module's JSON responses.
- Live Twin polling (2 s) and pause/resume via core calls; campus polling every 30 s.
- Numeric scenario input editing with explicit Run / Calculate actions.
- Basic module-error handling and a visible offline message.

## Important scope notes / next iteration

This is a **functional integration scaffold**, not yet a pixel-complete port of the React web app. Interactive MapLibre GIS tiles cannot simply be embedded in Basecamp's sandboxed QML network environment: an offline QtLocation/local-data rendering strategy, or custom QML Canvas geometry using `gisData()`, is needed. Detailed asset editor, searchable registry, evidence bill tables, scenario option pickers, charts and GIS layer selectors are also still to be implemented. The generic output panels intentionally make the backend data inspectable until dedicated views replace them.

A full build was **not executed here** because Nix/Qt Basecamp tooling is unavailable in this runtime. The Core API method names/arguments were verified against the uploaded header and README; run the packaged app against Basecamp to validate host-specific bridge behavior.
