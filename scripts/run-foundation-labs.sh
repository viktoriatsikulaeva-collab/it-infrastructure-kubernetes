#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p 01-linux-administration 02-networking 05-monitoring 06-troubleshooting evidence
LOG="evidence/foundation-lab-results.txt"
: > "$LOG"
record() { printf '%s\n' "$*" | tee -a "$LOG"; }

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

record "IT Infrastructure Lab - Linux foundation tests"
record "Run date (UTC): $(date -u '+%Y-%m-%d %H:%M')"
record ""

record "[1] Linux identity and permissions"
record "User: $(id -un) | Group: $(id -gn)"
printf 'Example configuration: port=8080\n' > "$WORK/config.txt"

chmod 600 "$WORK/config.txt"
if [[ -r "$WORK/config.txt" ]]; then
  record "PASS: owner can read file with mode 600"
else
  record "FAIL: owner cannot read file"
fi

chmod 000 "$WORK/config.txt"
if [[ ! -r "$WORK/config.txt" ]]; then
  record "PASS: access denied with mode 000"
else
  record "FAIL: unexpected access with mode 000"
fi

chmod 600 "$WORK/config.txt"
record "Restored permissions: $(stat -c '%a' "$WORK/config.txt")"

record ""
record "[2] Configuration backup and restore"
tar -czf "$WORK/backup.tar.gz" -C "$WORK" config.txt
mkdir -p "$WORK/restored"
tar -xzf "$WORK/backup.tar.gz" -C "$WORK/restored"

if cmp -s "$WORK/config.txt" "$WORK/restored/config.txt"; then
  record "PASS: backup restored successfully"
else
  record "FAIL: restored file differs"
fi

record ""
record "[3] Networking checks"
record "Network interface names:"
ls -1 /sys/class/net | tee -a "$LOG"

if getent ahostsv4 example.com >/dev/null; then
  record "PASS: DNS resolution works"
else
  record "FAIL: DNS resolution unavailable"
fi

if command -v curl >/dev/null; then
  CODE="$(curl -LsS -o /dev/null -w '%{http_code}' --max-time 12 https://example.com || true)"
  if [[ "$CODE" =~ ^[23][0-9][0-9]$ ]]; then
    record "PASS: HTTPS response HTTP $CODE"
  else
    record "FAIL: HTTPS response HTTP ${CODE:-unknown}"
  fi
else
  record "SKIP: curl is not installed"
fi

record ""
record "[4] System monitoring"
record "Uptime: $(uptime -p)"
free -h | sed -n '1,3p' | tee -a "$LOG"
df -h / | tee -a "$LOG"

record ""
record "Finished. Review results before publishing."

cat > 01-linux-administration/file-permissions.md <<'MD'
# Linux File Permissions and Backup Lab

## Objective
Practice Linux file permissions and configuration backups.

## Tasks
1. Inspect the current user and group using `id`.
2. Create a temporary configuration file.
3. Apply `chmod 600` to allow owner read/write access.
4. Apply `chmod 000` to simulate a permission problem.
5. Restore access using `chmod 600`.
6. Create a backup with `tar`.
7. Restore the backup and compare files using `cmp`.

## Evidence
[View test results](../evidence/foundation-lab-results.txt)

## Security
The exercise uses temporary files only.
MD

cat > 02-networking/network-checks.md <<'MD'
# Network Diagnostics Lab

## Objective
Verify network interfaces, DNS and HTTPS connectivity.

## Commands
- `ls /sys/class/net` - inspect interface names.
- `getent ahostsv4 example.com` - test DNS resolution.
- `curl` - test HTTPS connectivity.

## Evidence
[View test results](../evidence/foundation-lab-results.txt)

Local IP addresses are not published.
MD

cat > 05-monitoring/system-health.md <<'MD'
# Linux System Monitoring

## Objective
Inspect Linux resource usage.

## Commands
- `uptime -p` - system uptime.
- `free -h` - memory and swap usage.
- `df -h /` - root filesystem usage.

## Evidence
[View monitoring results](../evidence/foundation-lab-results.txt)

These are point-in-time measurements from WSL2.
MD

cat > 06-troubleshooting/troubleshooting.md <<'MD'
# Troubleshooting: File Permission Error

## Problem
A sample configuration file becomes unreadable after its
permissions are changed to 000.

## Diagnosis
Use `stat` to inspect permissions and `test -r` to check access.

## Solution
Restore access using `chmod 600`.

## Verification
[View lab results](../evidence/foundation-lab-results.txt)

This is a controlled simulation using temporary files.
MD
