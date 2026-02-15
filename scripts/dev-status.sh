#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")/app"
PORT="${PORT:-3000}"

log() { echo "$1"; }

echo "Development Status Check"
echo "--------------------------"

echo "Ruby version:"
ruby -v || echo "Ruby missing"

echo "--------------------------"

echo "Rails version:"
cd "$APP_DIR" && bin/rails -v || echo "Rails missing"

echo "--------------------------"

echo "Database check:"
cd "$APP_DIR" && bin/rails db:version 2>/dev/null || echo "Database not reachable"

echo "--------------------------"

echo "Rails environment load:"
cd "$APP_DIR" && bin/rails runner 'puts "Rails environment OK"' 2>/dev/null || echo "Rails failed to load"

echo "--------------------------"

check_processes() {
  pid_file="$APP_DIR/tmp/pids/server.pid"
  if [ -f "$pid_file" ]; then
    pid=$(cat "$pid_file")
    if ps -p "$pid" > /dev/null 2>&1; then
      log "Warning: Rails server (PID $pid) is still running"
      log "Kill it with: kill $pid"
    else
      log "Stale PID file found, removing..."
      rm -f "$pid_file"
    fi
  fi
}

verify_routes() {
  if [ -f "$APP_DIR/bin/rails" ]; then
    log "Verifying routes..."
    routes=$(cd "$APP_DIR" && bin/rails routes 2>/dev/null | wc -l)
    if [ "$routes" -gt 0 ]; then
      log "Routes OK ($routes routes defined)"
    else
      log "Warning: No routes found"
    fi
  fi
}

check_health() {
  if command -v curl >/dev/null 2>&1; then
    log "Checking health endpoint at localhost:$PORT/up..."
    if curl -sf "http://localhost:$PORT/up" >/dev/null 2>&1; then
      log "Backend is healthy"
    else
      log "Warning: Backend not responding at /up"
    fi
  else
    log "Skipping health check (curl not available)"
  fi
}

check_processes
verify_routes
check_health

echo "Status check finished"
