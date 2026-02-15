#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")/app"

log() { echo "$1"; }

cleanup_logs() {
  log_count=$(find "$APP_DIR/log" -name "*.log" -type f 2>/dev/null | wc -l)
  if [ "$log_count" -gt 0 ]; then
    find "$APP_DIR/log" -name "*.log" -type f -exec sh -c '> "$1"' _ {} \;
    log "Cleaned log files"
  fi
}

cleanup_tmp() {
  tmp_count=$(find "$APP_DIR/tmp" -type f ! -name ".keep" 2>/dev/null | wc -l)
  if [ "$tmp_count" -gt 0 ]; then
    find "$APP_DIR/tmp" -type f ! -name ".keep" -exec sh -c '> "$1"' _ {} \;
    log "Cleaned tmp files"
  fi
}

log "=== Clean Safe Script ==="
cleanup_logs
cleanup_tmp
log "=== Done ==="