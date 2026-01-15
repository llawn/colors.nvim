# Color Palette Generator

A comprehensive color palette generation system for Neovim that creates harmonious color palettes from your existing color database.

## Features

- **Advanced Generation Methods:**
  - Monochromatic: Variations of the same hue with different lightness
  - Analogous: Adjacent colors on the color wheel (harmonious)
  - Complementary: Opposite colors (high contrast)
  - Triadic: Three equally spaced colors (balanced)
  - Tetradic: Four equally spaced colors (square pattern)
  - Split Complementary: Base + two adjacent to complementary

- **Parameter Controls:**
  - Adjustable color count (3-8 colors)
  - Lightness variation control (10-100%)
  - Saturation variation control (0-50%)

- **Accessibility Checking (WCAG):**
  - Contrast ratio analysis for all color pairs
  - AA and AAA compliance checking
  - Recommendations for better accessibility

- **Web-based UI:** Interactive interface with live preview
- **Neovim Integration:** Direct commands and palette management
- **Palette Management:** Save, load, and organize generated palettes

## Files

**Core Engine:**
- `palette_generator.lua` - Core generation algorithms
- `palette_manager.lua` - Palette saving/loading system
- `palette_commands.lua` - Neovim command interface

**Web Interface:**
- `index.html` - Welcome page with documentation
- `palette_generator.html` - Main web interface
- `palette_generator.css` - Styles for the web interface
- `palette_generator.js` - JavaScript logic for the web interface

**Utilities:**
- `serve_palette.sh` - Simple HTTP server script
- `test_palette_generator.lua` - Test suite
- `PALETTE_GENERATOR_README.md` - This documentation

## Usage

### Web Interface

1. Open `palette_generator_ui.html` in your browser
2. Select a base color from your 575+ color database
3. Choose from 6 generation methods (Monochromatic, Analogous, Complementary, Triadic, Tetradic, Split Complementary)
4. Adjust parameters:
   - Color count (3-8)
   - Lightness variation (10-100%)
   - Saturation variation (0-50%)
5. Enable accessibility checking for WCAG compliance analysis
6. See live preview on modern website mockup
7. Copy generated Lua code for Neovim integration

### Neovim Commands

```vim
" Generate and display a palette
:PaletteGenerate red monochromatic 5

" List all saved palettes
:PaletteList

" Show palette statistics
:PaletteStats
```

### Lua API

```lua
local palette_gen = require('llawn.plugins.local.palette_generator')
local palette_mgr = require('llawn.plugins.local.palette_manager')

-- Generate palette with advanced options
local palette = palette_gen.generate_palette("red", "monochromatic", 5, {
  lightness_variation = 80,
  saturation_variation = 0.3
})

-- Check accessibility
local analysis = palette_gen.analyze_palette_accessibility(palette)
print(string.format("AA compliance: %.1f%%", analysis.compliance.aa_normal.passed/analysis.compliance.aa_normal.total*100))

-- Save palette
palette_mgr.save_palette(palette, "my_red_palette", "monochromatic", "red")

-- Load palette
local saved = palette_mgr.load_palette("my_red_palette")
```

### Web Interface

1. Open `palette_generator_ui.html` in your browser
2. Select a base color from your database
3. Choose a generation method
4. Adjust the number of colors (3-8)
5. See the live preview update in real-time
6. Copy the generated Lua code for use in Neovim

### Neovim Integration

The generated palettes can be used with your existing color picker system:

```lua
-- Example generated palette
local my_palette = {
  {name="red", color=0xff0000},
  {name="tomato", color=0xff6347},
  {name="coral", color=0xff7f50},
  {name="lightsalmon", color=0xffa07a},
  {name="peachpuff", color=0xffdab9}
}
```

## Generation Methods Explained

### Monochromatic
Creates variations of the same hue with different lightness values. Perfect for creating cohesive, single-tone palettes.

### Analogous
Selects colors that are adjacent on the color wheel. Creates harmonious, serene color schemes.

### Complementary
Uses colors that are opposite each other on the color wheel. Creates high-contrast, vibrant palettes.

### Triadic
Uses three colors equally spaced around the color wheel. Creates balanced, energetic palettes.

## Technical Details

- **Color Space:** Uses HSL color space for calculations
- **Color Distance:** Implements perceptual color distance algorithms
- **Database:** Works with your existing 575+ color database
- **Output:** Generates Lua tables compatible with your color picker system

## Quick Start

### 1. Web Interface (Recommended)
```bash
cd /var/home/llawn/.config/nvim/lua/llawn/plugins/local/
./serve_palette.sh 8000
# Then open http://localhost:8000/index.html
```

### 2. Neovim Commands
```vim
:PaletteGenerate red monochromatic 5
:PaletteList
:PaletteStats
```

### 3. Lua API
```lua
local palette = require('llawn.plugins.local.palette_generator').generate_palette("blue", "triadic", 4)
```

## All Features Implemented ✅

- ✅ 6 generation methods (Monochromatic, Analogous, Complementary, Triadic, Tetradic, Split Complementary)
- ✅ Advanced parameter controls (lightness & saturation variation)
- ✅ WCAG accessibility checking (AA/AAA compliance)
- ✅ Neovim command integration
- ✅ Palette saving/loading system
- ✅ Web interface with live preview
- ✅ Lua code export for Neovim integration
