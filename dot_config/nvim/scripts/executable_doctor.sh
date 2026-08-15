#!/usr/bin/env bash

set -u

# ==============================================================
# UI
# ==============================================================

if [ -t 1 ]; then
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  RED='\033[0;31m'
  BLUE='\033[0;34m'
  BOLD='\033[1m'
  RESET='\033[0m'
else
  GREEN=''
  YELLOW=''
  RED=''
  BLUE=''
  BOLD=''
  RESET=''
fi

ok() {
  printf "${GREEN}✓${RESET} %-18s %s\n" "$1" "$2"
}

warn() {
  printf "${YELLOW}!${RESET} %-18s %s\n" "$1" "$2"
}

fail() {
  printf "${RED}✗${RESET} %-18s %s\n" "$1" "$2"
}

section() {
  printf "\n${BOLD}${BLUE}%s${RESET}\n" "$1"
}

# ==============================================================
# Platform
# ==============================================================

case "$(uname -s)" in
  Darwin)
    OS="macOS"
    ;;
  Linux)
    OS="Linux"
    ;;
  *)
    OS="$(uname -s)"
    ;;
esac

section "Platform"

printf "OS:       %s\n" "$OS"
printf "Arch:     %s\n" "$(uname -m)"

if [ -n "${SSH_CONNECTION:-}" ] || [ -n "${SSH_TTY:-}" ]; then
  printf "SSH:      yes\n"
else
  printf "SSH:      no\n"
fi

# ==============================================================
# Command checks
# ==============================================================

missing_core=0
missing_optional=0

check_core() {
  local cmd="$1"
  local description="$2"

  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$cmd" "$(command -v "$cmd")"
  else
    fail "$cmd" "$description"
    missing_core=$((missing_core + 1))
  fi
}

check_optional() {
  local cmd="$1"
  local description="$2"

  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$cmd" "$(command -v "$cmd")"
  else
    warn "$cmd" "$description"
    missing_optional=$((missing_optional + 1))
  fi
}

section "Core"

check_core git "Git is required by lazy.nvim"
check_core nvim "Neovim is required"
check_core rg "Required for fast text search"

# Ubuntu/Debian packages fd as `fdfind`.
if command -v fd >/dev/null 2>&1; then
  ok "fd" "$(command -v fd)"
elif command -v fdfind >/dev/null 2>&1; then
  warn "fd" "found fdfind: $(command -v fdfind)"
  printf "  Create ~/.local/bin/fd -> fdfind for plugin compatibility.\n"
else
  fail "fd" "Fast file finder is missing"
  missing_core=$((missing_core + 1))
fi

check_core lazygit "Git TUI used by Snacks"
check_core tree-sitter "Required by current nvim-treesitter"

section "Tooling"

check_optional node "Needed by npm-based Mason tools"
check_optional npm "Needed by prettier / Mermaid tooling"
check_optional cc "Needed to compile Tree-sitter parsers"

section "Documents"

check_optional magick "Image conversion"
check_optional gs "PDF rendering"
check_optional tectonic "LaTeX math rendering"
check_optional mmdc "Mermaid diagram rendering"

# ==============================================================
# Neovim
# ==============================================================

section "Neovim"

if command -v nvim >/dev/null 2>&1; then
  nvim --version | head -3
fi

# ==============================================================
# Git repository
# ==============================================================

section "Configuration Repository"

SCRIPT_DIR="$(
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1
  pwd
)"

CONFIG_DIR="$(
  cd -- "$SCRIPT_DIR/.." >/dev/null 2>&1
  pwd
)"

printf "Config:   %s\n" "$CONFIG_DIR"

if git -C "$CONFIG_DIR" rev-parse --is-inside-work-tree \
  >/dev/null 2>&1; then

  branch="$(
    git -C "$CONFIG_DIR" branch --show-current 2>/dev/null
  )"

  printf "Branch:   %s\n" "${branch:-detached}"

  if [ -z "$(git -C "$CONFIG_DIR" status --porcelain)" ]; then
    ok "git status" "working tree clean"
  else
    warn "git status" "working tree has changes"
  fi
else
  fail "git repo" "configuration is not inside a Git repository"
fi

# ==============================================================
# Summary
# ==============================================================

section "Summary"

if [ "$missing_core" -eq 0 ]; then
  ok "core" "all core dependencies available"
else
  fail "core" "$missing_core core dependency/dependencies missing"
fi

if [ "$missing_optional" -eq 0 ]; then
  ok "optional" "all document/tooling dependencies available"
else
  warn "optional" "$missing_optional optional dependency/dependencies missing"
fi

printf "\n"

if [ "$missing_core" -eq 0 ]; then
  printf "${GREEN}${BOLD}Neovim environment is ready.${RESET}\n"
  exit 0
else
  printf "${RED}${BOLD}Neovim environment needs attention.${RESET}\n"
  exit 1
fi
