#!/bin/bash
# Simple HTTP server for palette generator
# Usage: ./serve_palette.sh [port]

PORT=${1:-8000}
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🎨 Starting Palette Generator Server on port $PORT"
echo "📁 Serving files from: $DIR"
echo "🌐 Open: http://localhost:$PORT/palette_generator.html"
echo "❌ Press Ctrl+C to stop"

cd "$DIR" && python3 -m http.server "$PORT"