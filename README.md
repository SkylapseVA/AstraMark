# AstraMark

A tiny Windows crosshair overlay with a compact settings panel. The crosshair uses real alpha transparency, so it should not show purple edges around the lines.

The default look is a clean plus crosshair: size `8`, line `2`, opacity `255`, X/Y offset `0`, and outline off.

## Use the EXE

Build it once:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_native_exe.ps1
```

Then double-click:

```text
dist\AstraMark.exe
```

## Controls

The top-right panel lets you change:

- size, center gap, thickness, dot size, opacity, and screen offset
- monitor selection for multi-monitor setups
- shape: cross, plus, dot, circle, square, X, or T
- color swatches
- center dot and black outline
- keybinds, with a visible list of current shortcuts

The `Plus` shape is a clean `+` with no center dot. It disables the gap and dot controls while selected because those settings do not apply to that shape. The `Dot` shape is just a centered `.` and uses the dot size control.

If the crosshair appears off-center, choose the correct monitor in the `Look` tab and keep X/Y offset at `0`.

Click `Set` next to a keybind, then press a combo like `Ctrl+Alt+K`.

## Default Hotkeys

- `Ctrl+Alt+C`: toggle the crosshair
- `Ctrl+Alt+P`: toggle the settings panel
- `Ctrl+Alt+X`: exit
- `Ctrl+Alt+Up` / `Ctrl+Alt+Down`: increase/decrease size
- `Ctrl+Alt+Left` / `Ctrl+Alt+Right`: decrease/increase center gap
- `Ctrl+Alt+Plus` / `Ctrl+Alt+Minus`: increase/decrease thickness
- `Ctrl+Alt+L`: cycle color

## Customize

The native EXE uses the defaults in `MiniCrosshair.cs`. Change the values near the top of that file, then rerun `build_native_exe.ps1`.

## Downloads / Requirements

For GitHub, upload the files from `release\AstraMark`.

Users should run `Start_AstraMark.bat`. It checks for the .NET Framework runtime first. If it is missing, it opens the official Microsoft download page.

The native EXE does not require Python.

## Windows Publisher Warning

If Windows says `Unknown publisher`, the app needs to be signed with a real code-signing certificate. See `SIGNING.md`. This cannot be bypassed honestly from code; Windows only trusts a publisher after the EXE is signed by a trusted certificate.

There is also a Python version if you prefer command-line customization. It requires Python to be installed.

Examples:

```powershell
python .\crosshair_overlay.py --color red --size 30 --gap 7 --thickness 3
python .\crosshair_overlay.py --color "#00ccff" --dot --opacity 0.8
python .\crosshair_overlay.py --offset-y 4
```

## Build the Python EXE

If you have Python installed and want a PyInstaller build instead:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_exe.ps1
```

The finished file will be created at:

```text
dist\MiniCrosshair.exe
```

Note: overlays usually work best with borderless-windowed games/apps. Fullscreen exclusive games may hide normal desktop overlays.
