#!/usr/bin/env bash
# Publishes / re-publishes the June Roundup deck to GitHub + Vercel (public).
# One-time prereqs:  gh auth login   and   npm i -g vercel && vercel login
# Run again any time to push the latest changes live.
set -euo pipefail

REPO="june-roundup-deck"          # repo + default vercel project name
cd "$(dirname "$0")"

# --- git ---
[ -d .git ] || git init -q
git add -A
git commit -qm "Update June Roundup deck" || echo "(nothing new to commit)"

# --- GitHub: create the repo on first run, otherwise just push ---
if ! git remote get-url origin >/dev/null 2>&1; then
  gh repo create "$REPO" --public --source=. --remote=origin --push
else
  git push -u origin HEAD
fi

# --- Vercel production deploy ---
echo; echo "Deploying to Vercel..."
URL=$(vercel deploy --prod --yes 2>/dev/null | tail -n1)

echo
echo "=================================================="
echo "  GitHub : $(gh repo view "$REPO" --json url -q .url 2>/dev/null)"
echo "  LIVE   : $URL"
echo "=================================================="
