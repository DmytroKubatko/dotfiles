#!/bin/bash
# Combined statusline: caveman badge + 5h usage progress bar (via ccusage)

# --- Colors ---
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
CYAN='\033[36m'
ORANGE='\033[38;5;172m'
RESET='\033[0m'

# --- Caveman badge ---
CAVEMAN_BADGE=""
FLAG="$HOME/.claude/.caveman-active"
if [ -f "$FLAG" ]; then
  MODE=$(cat "$FLAG" 2>/dev/null)
  if [ "$MODE" = "full" ] || [ -z "$MODE" ]; then
    CAVEMAN_BADGE=$(printf "${ORANGE}[CAVEMAN]${RESET}")
  else
    SUFFIX=$(echo "$MODE" | tr '[:lower:]' '[:upper:]')
    CAVEMAN_BADGE=$(printf "${ORANGE}[CAVEMAN:%s]${RESET}" "$SUFFIX")
  fi
fi

# --- Progress bar (width=10) ---
make_bar() {
  pct="$1"
  width=10
  filled=$(( pct * width / 100 ))
  [ $filled -gt $width ] && filled=$width
  empty=$(( width - filled ))
  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$(( i + 1 )); done
  while [ $i -lt $width ];  do bar="${bar}░"; i=$(( i + 1 )); done
  printf "%s" "$bar"
}

# --- Usage badge via ccusage ---
USAGE_BADGE=""
if command -v ccusage &>/dev/null; then
  DATA=$(ccusage blocks --json 2>/dev/null)
  if [ -n "$DATA" ]; then
    USAGE_BADGE=$(echo "$DATA" | python3 -c "
import json, sys, datetime, os

GREEN  = '\033[32m'
YELLOW = '\033[33m'
RED    = '\033[31m'
CYAN   = '\033[36m'
RESET  = '\033[0m'

try:
    data = json.load(sys.stdin)
    blocks = data.get('blocks', [])
    for b in reversed(blocks):
        if b.get('isActive'):
            cost = b.get('costUSD', 0)
            start = datetime.datetime.fromisoformat(b['startTime'].replace('Z','+00:00'))
            end   = datetime.datetime.fromisoformat(b['endTime'].replace('Z','+00:00'))
            now   = datetime.datetime.now(datetime.timezone.utc)

            total_secs = (end - start).total_seconds()
            used_secs  = (now - start).total_seconds()
            used_secs  = max(0, min(used_secs, total_secs))
            pct = int(used_secs / total_secs * 100) if total_secs > 0 else 0

            reset_local = end.astimezone()
            reset_str   = reset_local.strftime('%-I:%M%p').lower()

            if pct >= 90:   color = RED
            elif pct >= 70: color = YELLOW
            else:           color = GREEN

            # build bar inline (shell fn not available here)
            width = 10
            filled = pct * width // 100
            filled = min(filled, width)
            bar = '█' * filled + '░' * (width - filled)

            print(f'{CYAN}\${cost:.2f}{RESET} | {color}5h {bar} {pct}% resets {reset_str}{RESET}', end='')
            break
except Exception as e:
    pass
" 2>/dev/null)
  fi
fi

# --- Output ---
parts=""
[ -n "$CAVEMAN_BADGE" ] && parts="$CAVEMAN_BADGE"
[ -n "$USAGE_BADGE"   ] && parts="${parts:+$parts }$USAGE_BADGE"
[ -n "$parts" ] && printf '%s' "$parts"