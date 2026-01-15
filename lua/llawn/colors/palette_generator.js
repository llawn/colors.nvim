// Representative sample from your color database
const colorDatabase = [
    {name: "black", color: 0x000000},
    {name: "white", color: 0xffffff},
    {name: "red", color: 0xff0000},
    {name: "blue", color: 0x0000ff},
    {name: "green", color: 0x008000},
    {name: "yellow", color: 0xffff00},
    {name: "purple", color: 0x800080},
    {name: "orange", color: 0xffa500},
    {name: "pink", color: 0xffc0cb},
    {name: "gray", color: 0x808080},
    {name: "navy", color: 0x000080},
    {name: "maroon", color: 0x800000},
    {name: "olive", color: 0x808000},
    {name: "lime", color: 0x00ff00},
    {name: "aqua", color: 0x00ffff},
    {name: "fuchsia", color: 0xff00ff},
    {name: "silver", color: 0xc0c0c0},
    {name: "teal", color: 0x008080},
    {name: "indigo", color: 0x4b0082},
    {name: "violet", color: 0xee82ee},
    {name: "gold", color: 0xffd700},
    {name: "salmon", color: 0xfa8072},
    {name: "crimson", color: 0xdc143c},
    {name: "coral", color: 0xff7f50},
    {name: "khaki", color: 0xf0e68c},
    {name: "plum", color: 0xdda0dd},
    {name: "orchid", color: 0xda70d6},
    {name: "tomato", color: 0xff6347},
    {name: "turquoise", color: 0x40e0d0},
    {name: "wheat", color: 0xf5deb3},
    {name: "lavender", color: 0xe6e6fa},
    {name: "beige", color: 0xf5f5dc},
    {name: "azure", color: 0xf0ffff},
    {name: "ivory", color: 0xfffff0},
    {name: "honeydew", color: 0xf0fff0},
    {name: "mintcream", color: 0xf5fffa},
    {name: "aliceblue", color: 0xf0f8ff},
    {name: "ghostwhite", color: 0xf8f8ff},
    {name: "snow", color: 0xfffafa},
    {name: "seashell", color: 0xfff5ee},
    {name: "linen", color: 0xfaf0e6},
    {name: "oldlace", color: 0xfdf5e6},
    {name: "bisque", color: 0xffe4c4},
    {name: "peachpuff", color: 0xffdab9},
    {name: "navajowhite", color: 0xffdead},
    {name: "moccasin", color: 0xffe4b5},
    {name: "cornsilk", color: 0xfff8dc},
    {name: "lemonchiffon", color: 0xfffacd},
    {name: "papayawhip", color: 0xffefd5},
    {name: "blanchedalmond", color: 0xffebcd},
    {name: "antiquewhite", color: 0xfaebd7},
    {name: "floralwhite", color: 0xfffaf0},
    {name: "lightyellow", color: 0xffffe0},
    {name: "lightgoldenrodyellow", color: 0xfafad2},
    {name: "palegoldenrod", color: 0xeee8aa},
    {name: "darkkhaki", color: 0xbdb76b},
    {name: "lightgreen", color: 0x90ee90},
    {name: "palegreen", color: 0x98fb98},
    {name: "springgreen", color: 0x00ff7f},
    {name: "mediumspringgreen", color: 0x00fa9a},
    {name: "lawngreen", color: 0x7cfc00},
    {name: "chartreuse", color: 0x7fff00},
    {name: "greenyellow", color: 0xadff2f},
    {name: "yellowgreen", color: 0x9acd32},
    {name: "olivedrab", color: 0x6b8e23},
    {name: "darkolivegreen", color: 0x556b2f},
    {name: "darkgreen", color: 0x006400},
    {name: "forestgreen", color: 0x228b22},
    {name: "seagreen", color: 0x2e8b57},
    {name: "mediumseagreen", color: 0x3cb371},
    {name: "darkseagreen", color: 0x8fbc8f},
    {name: "lightseagreen", color: 0x20b2aa},
    {name: "paleturquoise", color: 0xafeeee},
    {name: "lightcyan", color: 0xe0ffff},
    {name: "powderblue", color: 0xb0e0e6},
    {name: "lightblue", color: 0xadd8e6},
    {name: "lightsteelblue", color: 0xb0c4de},
    {name: "skyblue", color: 0x87ceeb},
    {name: "lightskyblue", color: 0x87cefa},
    {name: "deepskyblue", color: 0x00bfff},
    {name: "dodgerblue", color: 0x1e90ff},
    {name: "cornflowerblue", color: 0x6495ed},
    {name: "steelblue", color: 0x4682b4},
    {name: "royalblue", color: 0x4169e1},
    {name: "mediumblue", color: 0x0000cd},
    {name: "darkblue", color: 0x00008b},
    {name: "midnightblue", color: 0x191970},
    {name: "mediumslateblue", color: 0x7b68ee},
    {name: "slateblue", color: 0x6a5acd},
    {name: "darkslateblue", color: 0x483d8b},
    {name: "mediumpurple", color: 0x9370db},
    {name: "blueviolet", color: 0x8a2be2},
    {name: "darkviolet", color: 0x9400d3},
    {name: "darkorchid", color: 0x9932cc},
    {name: "mediumorchid", color: 0xba55d3},
    {name: "thistle", color: 0xd8bfd8},
    {name: "mediumvioletred", color: 0xc71585},
    {name: "deeppink", color: 0xff1493},
    {name: "hotpink", color: 0xff69b4},
    {name: "palevioletred", color: 0xdb7093},
    {name: "lightpink", color: 0xffb6c1},
    {name: "pink", color: 0xffc0cb},
    {name: "lightcoral", color: 0xf08080},
    {name: "indianred", color: 0xcd5c5c},
    {name: "darkred", color: 0x8b0000},
    {name: "firebrick", color: 0xb22222},
    {name: "brown", color: 0xa52a2a},
    {name: "darkorange", color: 0xff8c00},
    {name: "saddlebrown", color: 0x8b4513},
    {name: "sienna", color: 0xa0522d},
    {name: "peru", color: 0xcd853f},
    {name: "chocolate", color: 0xd2691e},
    {name: "sandybrown", color: 0xf4a460},
    {name: "burlywood", color: 0xdeb887},
    {name: "tan", color: 0xd2b48c},
    {name: "rosybrown", color: 0xbc8f8f},
    {name: "darkgoldenrod", color: 0xb8860b},
    {name: "goldenrod", color: 0xdaa520},
    {name: "darkkhaki", color: 0xbdb76b},
    {name: "lightgoldenrod", color: 0xeedd82},
    {name: "palegoldenrod", color: 0xeee8aa},
    {name: "lightyellow", color: 0xffffe0},
    {name: "lightgoldenrodyellow", color: 0xfafad2},
    {name: "whitesmoke", color: 0xf5f5f5},
    {name: "gainsboro", color: 0xdcdcdc},
    {name: "lightgrey", color: 0xd3d3d3},
    {name: "darkgray", color: 0xa9a9a9},
    {name: "gray", color: 0x808080},
    {name: "dimgray", color: 0x696969},
    {name: "lightslategray", color: 0x778899},
    {name: "slategray", color: 0x708090},
    {name: "darkslategray", color: 0x2f4f4f}
];

let currentPalette = [];

// Initialize
document.addEventListener('DOMContentLoaded', function() {
    populateColorSelect();
    setupEventListeners();
    generatePalette();
});

function populateColorSelect() {
    const select = document.getElementById('base-color');
    select.innerHTML = '';

    colorDatabase.forEach(color => {
        const option = document.createElement('option');
        option.value = color.name;
        option.textContent = color.name;
        select.appendChild(option);
    });

    // Set default selection
    select.value = 'red';
}

function setupEventListeners() {
    // Base color change
    document.getElementById('base-color').addEventListener('change', generatePalette);

    // Method buttons
    document.querySelectorAll('.method-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            document.querySelectorAll('.method-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            generatePalette();
        });
    });

    // Color count slider
    document.getElementById('color-count').addEventListener('input', function() {
        document.getElementById('count-value').textContent = this.value;
        generatePalette();
    });

    // Lightness variation slider
    document.getElementById('lightness-variation').addEventListener('input', function() {
        document.getElementById('lightness-value').textContent = this.value;
        generatePalette();
    });

    // Saturation variation slider
    document.getElementById('saturation-variation').addEventListener('input', function() {
        document.getElementById('saturation-value').textContent = this.value;
        generatePalette();
    });

    // Accessibility checkbox
    document.getElementById('accessibility-check').addEventListener('change', function() {
        const accessibilityInfo = document.getElementById('accessibility-info');
        if (this.checked) {
            accessibilityInfo.style.display = 'block';
        } else {
            accessibilityInfo.style.display = 'none';
        }
        generatePalette();
    });
}

function generatePalette() {
    const baseColorName = document.getElementById('base-color').value;
    const method = document.querySelector('.method-btn.active').dataset.method;
    const count = parseInt(document.getElementById('color-count').value);
    const lightnessVariation = parseInt(document.getElementById('lightness-variation').value);
    const saturationVariation = parseInt(document.getElementById('saturation-variation').value) / 100;
    const checkAccessibility = document.getElementById('accessibility-check').checked;

    // Find base color
    const baseColor = colorDatabase.find(c => c.name === baseColorName);
    if (!baseColor) return;

    // Generate palette based on method with parameters
    currentPalette = generatePaletteByMethod(baseColor, method, count, {
        lightness_variation: lightnessVariation,
        saturation_variation: saturationVariation
    });

    updatePaletteDisplay();
    updateWebsitePreview();
    updateExportCode();

    if (checkAccessibility) {
        updateAccessibilityInfo();
    }
}

function generatePaletteByMethod(baseColor, method, count, options = {}) {
    const palette = [baseColor];

    switch (method) {
        case 'monochromatic':
            // Generate colors with same hue but different lightness
            for (let i = 1; i < count; i++) {
                const variation = generateMonochromaticVariation(baseColor, i, count, options);
                palette.push(variation);
            }
            break;

        case 'analogous':
            // Generate colors adjacent on color wheel
            for (let i = 1; i < count; i++) {
                const offset = (i - Math.floor(count/2)) * 30; // 30 degrees apart
                const variation = generateHueVariation(baseColor, offset);
                palette.push(variation);
            }
            break;

        case 'complementary':
            // Generate complementary color (180 degrees opposite)
            const complementary = generateHueVariation(baseColor, 180);
            palette.push(complementary);

            // Fill remaining with variations
            for (let i = 2; i < count; i++) {
                const variation = generateMonochromaticVariation(baseColor, i, count, options);
                palette.push(variation);
            }
            break;

        case 'triadic':
            // Generate three equally spaced colors (120 degrees apart)
            const triadic1 = generateHueVariation(baseColor, 120);
            const triadic2 = generateHueVariation(baseColor, 240);
            palette.push(triadic1, triadic2);

            // Fill remaining with variations
            for (let i = 3; i < count; i++) {
                const base = palette[(i-1) % 3];
                const variation = generateMonochromaticVariation(base, i-2, count-2, options);
                palette.push(variation);
            }
            break;

        case 'tetradic':
            // Generate four equally spaced colors (90 degrees apart)
            const tetradic1 = generateHueVariation(baseColor, 90);
            const tetradic2 = generateHueVariation(baseColor, 180);
            const tetradic3 = generateHueVariation(baseColor, 270);
            palette.push(tetradic1, tetradic2, tetradic3);

            // Fill remaining with variations
            for (let i = 4; i < count; i++) {
                const base = palette[(i-1) % 4];
                const variation = generateMonochromaticVariation(base, i-3, count-3, options);
                palette.push(variation);
            }
            break;

        case 'split_complementary':
            // Generate base + two colors adjacent to complementary
            const comp = generateHueVariation(baseColor, 180);
            const split1 = generateHueVariation(comp, -30);
            const split2 = generateHueVariation(comp, 30);
            palette.push(split1, split2);

            // Fill remaining with variations
            for (let i = 3; i < count; i++) {
                const variation = generateMonochromaticVariation(baseColor, i-2, count-2, options);
                palette.push(variation);
            }
            break;
    }

    return palette;
}

function generateMonochromaticVariation(baseColor, index, total, options = {}) {
    const lightnessVariation = options.lightness_variation || 60;
    const saturationVariation = options.saturation_variation || 0.2;

    // Find colors with similar hue but different lightness
    const baseHue = getColorHue(baseColor.color);
    let bestMatch = colorDatabase[0];
    let bestDistance = Infinity;

    // Look for colors with similar hue but different perceived lightness
    for (const color of colorDatabase) {
        const hue = getColorHue(color.color);
        const hueDistance = Math.min(Math.abs(hue - baseHue), 360 - Math.abs(hue - baseHue));

        if (hueDistance < 45) { // Within 45 degrees hue
            const lightness = getColorLightness(color.color);
            const baseLightness = getColorLightness(baseColor.color);
            const targetLightness = Math.max(10, Math.min(90,
                baseLightness + (index / total - 0.5) * lightnessVariation));

            const lightnessDistance = Math.abs(lightness - targetLightness);

            if (lightnessDistance < bestDistance) {
                bestDistance = lightnessDistance;
                bestMatch = color;
            }
        }
    }

    return bestMatch;
}

function generateHueVariation(baseColor, hueOffset) {
    const baseHue = getColorHue(baseColor.color);
    const targetHue = (baseHue + hueOffset) % 360;

    let bestMatch = colorDatabase[0];
    let bestDistance = Infinity;

    for (const color of colorDatabase) {
        const hue = getColorHue(color.color);
        const hueDistance = Math.min(Math.abs(hue - targetHue), 360 - Math.abs(hue - targetHue));

        if (hueDistance < bestDistance) {
            bestDistance = hueDistance;
            bestMatch = color;
        }
    }

    return bestMatch;
}

function getColorHue(colorValue) {
    // Simple hue calculation from RGB
    const r = ((colorValue >> 16) & 0xFF) / 255;
    const g = ((colorValue >> 8) & 0xFF) / 255;
    const b = (colorValue & 0xFF) / 255;

    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    const delta = max - min;

    if (delta === 0) return 0;

    let hue;
    if (max === r) {
        hue = ((g - b) / delta) % 6;
    } else if (max === g) {
        hue = (b - r) / delta + 2;
    } else if (max === b) {
        hue = (r - g) / delta + 4;
    }

    hue *= 60;
    return hue < 0 ? hue + 360 : hue;
}

function getColorLightness(colorValue) {
    const r = ((colorValue >> 16) & 0xFF) / 255;
    const g = ((colorValue >> 8) & 0xFF) / 255;
    const b = (colorValue & 0xFF) / 255;

    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    return (max + min) / 2 * 100;
}

function updatePaletteDisplay() {
    const container = document.getElementById('palette-colors');
    container.innerHTML = '';

    currentPalette.forEach(color => {
        const colorItem = document.createElement('div');
        colorItem.className = 'color-item';
        colorItem.style.backgroundColor = '#' + color.color.toString(16).padStart(6, '0');

        const nameDiv = document.createElement('div');
        nameDiv.textContent = color.name;

        const hexDiv = document.createElement('div');
        hexDiv.className = 'color-hex';
        hexDiv.textContent = '#' + color.color.toString(16).padStart(6, '0').toUpperCase();

        colorItem.appendChild(nameDiv);
        colorItem.appendChild(hexDiv);
        container.appendChild(colorItem);
    });
}

function updateAccessibilityInfo() {
    const statsElement = document.getElementById('compliance-stats');
    const recommendationsElement = document.getElementById('recommendations');

    // Calculate accessibility metrics
    const analysis = analyzePaletteAccessibility(currentPalette);

    let statsHtml = '<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; margin-bottom: 10px;">';
    statsHtml += `<div>AA Normal: ${analysis.compliance.aa_normal.passed}/${analysis.compliance.aa_normal.total} (${Math.round(analysis.compliance.aa_normal.passed/analysis.compliance.aa_normal.total*100)}%)</div>`;
    statsHtml += `<div>AA Large: ${analysis.compliance.aa_large.passed}/${analysis.compliance.aa_large.total} (${Math.round(analysis.compliance.aa_large.passed/analysis.compliance.aa_large.total*100)}%)</div>`;
    statsHtml += `<div>AAA Normal: ${analysis.compliance.aaa_normal.passed}/${analysis.compliance.aaa_normal.total} (${Math.round(analysis.compliance.aaa_normal.passed/analysis.compliance.aaa_normal.total*100)}%)</div>`;
    statsHtml += `<div>AAA Large: ${analysis.compliance.aaa_large.passed}/${analysis.compliance.aaa_large.total} (${Math.round(analysis.compliance.aaa_large.passed/analysis.compliance.aaa_large.total*100)}%)</div>`;
    statsHtml += '</div>';

    let recsHtml = '';
    if (analysis.recommendations.length > 0) {
        recsHtml = '<div style="color: #856404; background: #fff3cd; padding: 8px; border-radius: 4px; border: 1px solid #ffeaa7;">';
        recsHtml += '<strong>Recommendations:</strong><ul>';
        analysis.recommendations.forEach(rec => {
            recsHtml += `<li>${rec}</li>`;
        });
        recsHtml += '</ul></div>';
    }

    statsElement.innerHTML = statsHtml;
    recommendationsElement.innerHTML = recsHtml;
}

function analyzePaletteAccessibility(palette) {
    const analysis = {
        compliance: {
            aa_normal: {passed: 0, total: 0},
            aa_large: {passed: 0, total: 0},
            aaa_normal: {passed: 0, total: 0},
            aaa_large: {passed: 0, total: 0}
        },
        recommendations: []
    };

    // Calculate all pairwise contrast ratios
    for (let i = 0; i < palette.length; i++) {
        for (let j = i + 1; j < palette.length; j++) {
            const ratio = getContrastRatio(palette[i].color, palette[j].color);

            analysis.compliance.aa_normal.total++;
            analysis.compliance.aa_large.total++;
            analysis.compliance.aaa_normal.total++;
            analysis.compliance.aaa_large.total++;

            if (ratio >= 4.5) analysis.compliance.aa_normal.passed++;
            if (ratio >= 3.0) analysis.compliance.aa_large.passed++;
            if (ratio >= 7.0) analysis.compliance.aaa_normal.passed++;
            if (ratio >= 4.5) analysis.compliance.aaa_large.passed++;
        }
    }

    // Generate recommendations
    const aaNormalRate = analysis.compliance.aa_normal.passed / analysis.compliance.aa_normal.total;
    if (aaNormalRate < 0.7) {
        analysis.recommendations.push("Consider increasing contrast between colors for better AA compliance");
    }

    if (analysis.compliance.aaa_normal.passed === 0) {
        analysis.recommendations.push("No color pairs meet AAA standards - consider using higher contrast colors");
    }

    return analysis;
}

function getContrastRatio(color1, color2) {
    const l1 = getRelativeLuminance(color1);
    const l2 = getRelativeLuminance(color2);
    const lighter = Math.max(l1, l2);
    const darker = Math.min(l1, l2);
    return (lighter + 0.05) / (darker + 0.05);
}

function getRelativeLuminance(color) {
    const r = ((color >> 16) & 0xFF) / 255;
    const g = ((color >> 8) & 0xFF) / 255;
    const b = (color & 0xFF) / 255;

    const toLinear = c => c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);

    const lr = toLinear(r);
    const lg = toLinear(g);
    const lb = toLinear(b);

    return 0.2126 * lr + 0.7152 * lg + 0.0722 * lb;
}

function updateWebsitePreview() {
    if (currentPalette.length < 3) return;

    const root = document.documentElement;
    root.style.setProperty('--primary', '#' + currentPalette[0].color.toString(16).padStart(6, '0'));
    root.style.setProperty('--secondary', '#' + currentPalette[1].color.toString(16).padStart(6, '0'));
    root.style.setProperty('--accent', '#' + currentPalette[2].color.toString(16).padStart(6, '0'));
}

function updateExportCode() {
    const codeElement = document.getElementById('export-code');
    let code = '-- Generated palette\nlocal palette = {\n';

    currentPalette.forEach((color, index) => {
        const hex = '#' + color.color.toString(16).padStart(6, '0').toUpperCase();
        code += `  {name="${color.name}", color=0x${color.color.toString(16).padStart(6, '0')}}`;
        if (index < currentPalette.length - 1) code += ',';
        code += '\n';
    });

    code += '}\nreturn palette';
    codeElement.textContent = code;
}

function copyToClipboard() {
    const code = document.getElementById('export-code').textContent;
    navigator.clipboard.writeText(code).then(() => {
        const btn = document.querySelector('.copy-btn');
        const originalText = btn.textContent;
        btn.textContent = 'Copied!';
        setTimeout(() => btn.textContent = originalText, 2000);
    });
}