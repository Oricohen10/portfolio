#!/bin/bash
# LUX 2.0 Design System Viewer — Launcher

# Serve from portfolio root (two levels up from this script)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
echo "Starting server from: $ROOT_DIR"
cd "$ROOT_DIR"

PORT=8788

# Kill anything already using that port
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null
sleep 0.3

# Start HTTP server
python3 -m http.server $PORT --bind 127.0.0.1 &
SERVER_PID=$!

sleep 0.8

# Open in browser
open "http://localhost:$PORT/LUX%202.0/lux-viewer.html"

echo ""
echo "  Viewer: http://localhost:$PORT/LUX%202.0/lux-viewer.html"
echo "  Press Ctrl+C to stop."
echo ""

wait $SERVER_PID
