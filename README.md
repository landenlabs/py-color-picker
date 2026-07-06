<table border="0">
  <tr>
    <td>
      <!-- VERSION -->v1.0.0<br>
      <!-- DATE -->2026<br>
      macOS &nbsp;|&nbsp; Windows &nbsp;|&nbsp; Linux<br>
      <a href="https://landenlabs.com">Home</a>
    </td>
    <td>
      <a href="https://landenlabs.com">
        <img src="screens/landenlabs_400.webp" width="300" alt="LanDen Labs">
      </a>
    </td>
  </tr>
</table>

# Color Picker

A Qt color picker with a hue/saturation wheel, R/G/B/A channel sliders, hex entry,
screen-pixel sampling, and a scrollable recent-colors list with gradient stop support.

**By [LanDen Labs](https://github.com/landenlabs) (2026)**

---

## Screenshots

_(coming soon)_

---

## Features

- **Color wheel.** Interactive hue/saturation wheel; click or drag to pick a color.
  Value (brightness) is controlled separately via the V slider.
- **R/G/B/A channel rows.** Each channel has a slider, a decimal spinbox, and a
  two-digit hex field — all stay in sync as you edit any of them.
- **Screen-pixel sampler.** Freeze the screen, hover to preview a magnified patch,
  click to pick a single color or pick multiple colors before dismissing.
- **Recent colors list.** Scrollable list (up to 256 entries) showing `#RRGGBBAA`
  hex, a mini swatch, and an optional gradient-stop value column. Supports
  bulk-delete of checked rows and CSV export.
- **Gradient stop graph.** Collapsible line graph that plots stop values from the
  recent-colors list — useful for inspecting palette distributions.
- **Palette extraction from dropped or pasted images.**
  - Qt Index Image (256 colors via Qt quantization).
  - Histogram method (N most-popular colors with fuzzy shade merging; 16/64/256).
- **OCR palette import** (requires Pillow + pytesseract):
  - SSDS Color Palette — extracts Step/A/R/G/B from a screenshot.
  - Pangea Color Palette — extracts step and R,G,B,A per row from a screenshot.
- **Text / file palette import:**
  - CSV-DEC-RGBA — rows of `red,green,blue,alpha` (0–255).
  - CSV-DEC-RGBA-step — rows of `red,green,blue,alpha,step`.
  - Android Gradient XML — `<item android:offset … android:color … />` tags.
  - Hex:ARGB — rows of `#AARRGGBB` hex (alpha-first).
  - SSDS-JSON — parse Step/ARGB from a `.json` palette file.
- **RGBA / ARGB display modes.** Toggle between `#RRGGBBAA` and `#AARRGGBB` hex
  ordering in the recent list (mirrors Android's alpha-first convention).
- **Light / Dark themes** — Fusion style with a full QPalette dark mode.
- **Persistent settings** — window geometry, theme, and recent-color list
  are saved via QSettings and restored on next launch.

---

## Requirements

- Python 3.9 or later
- PyQt6
- Pillow + pytesseract (optional — required for OCR palette import)
- matplotlib (optional — enhances the histogram dialog)

```
pip install PyQt6
pip install pillow pytesseract   # optional OCR support
pip install matplotlib            # optional histogram support
```

---

## Installation

### Run from source

```bash
git clone https://github.com/landenlabs/color-picker.git
cd color-picker
python color-picker.py
```

### Build a standalone binary

**macOS / Linux**

```bash
pyinstaller --onefile --name color-picker color-picker.py
```

**Windows**

```powershell
pyinstaller --onefile --name color-picker color-picker.py
```

Both commands use [PyInstaller](https://pyinstaller.org) to produce a self-contained executable.

---

## Usage

### Launch the GUI

```bash
python color-picker.py
```

The window opens with a red default color. Use the wheel, sliders, or hex fields to
select a color. Press the eyedropper button to sample a pixel from anywhere on screen.

### Pick colors from a palette image

Drag an image file (PNG, JPG, etc.) onto the color swatch. A dialog lets you choose
the extraction method (Qt quantization, histogram, SSDS OCR, Pangea OCR, or SSDS JSON).
Extracted colors are added to the Recent list.

### Import colors from text

Drag a `.txt` or `.csv` file (or paste text) onto the color swatch. A format-choice
dialog lets you select the correct layout (CSV-DEC-RGBA, Android gradient, Hex:ARGB, etc.).

### Export recent colors

Click **Save** in the Recent list header to write all current colors to a CSV file
(`#RRGGBBAA,R,G,B,A` per row, with an optional stop column).

---

## Project structure

```
color-picker/
├── color-picker.py     # Main script (single-file GUI)
├── README.md
├── LICENSE
└── screens/            # Images used in this README
```

---

## License

Apache 2.0 © [LanDen Labs](https://github.com/landenlabs) 2026
