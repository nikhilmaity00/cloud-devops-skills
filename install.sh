#!/usr/bin/env bash
# Installation helper for Cloud & DevOps AI Agent Skills

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="antigravity"
SCOPE="global"
PROJECT_DIR=""

usage() {
  cat <<EOF
Usage: ./install.sh [OPTIONS]

Options:
  --target <antigravity|claude|cursor>   Target AI harness (default: antigravity)
  --scope <global|project>               Installation scope (default: global)
  --project-dir <path>                   Path to project (required if scope is 'project')
  -h, --help                             Show this help message

Examples:
  ./install.sh --target antigravity --scope global
  ./install.sh --target claude --scope global
  ./install.sh --target antigravity --scope project --project-dir /home/nikhil/Projects/my-app
EOF
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --scope)
      SCOPE="$2"
      shift 2
      ;;
    --project-dir)
      PROJECT_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

if [[ "$SCOPE" == "project" && -z "$PROJECT_DIR" ]]; then
  echo "Error: --project-dir is required when --scope is 'project'."
  exit 1
fi

DEST_DIR=""

case "$TARGET" in
  antigravity)
    if [[ "$SCOPE" == "global" ]]; then
      DEST_DIR="$HOME/.gemini/antigravity-cli/skills"
    else
      DEST_DIR="$PROJECT_DIR/.agents/skills"
    fi
    ;;
  claude)
    if [[ "$SCOPE" == "global" ]]; then
      DEST_DIR="$HOME/.claude/skills"
    else
      DEST_DIR="$PROJECT_DIR/.claude/skills"
    fi
    ;;
  cursor)
    if [[ "$SCOPE" == "global" ]]; then
      DEST_DIR="$HOME/.cursor/skills"
    else
      DEST_DIR="$PROJECT_DIR/.cursor/skills"
    fi
    ;;
  *)
    echo "Unknown target harness: $TARGET"
    exit 1
    ;;
esac

echo "============================================="
echo " Installing Cloud & DevOps Skills"
echo " Target Harness: $TARGET"
echo " Scope:          $SCOPE"
echo " Destination:    $DEST_DIR"
echo "============================================="

mkdir -p "$DEST_DIR"

COUNT=0
for skill_dir in "$SCRIPT_DIR"/skills/*; do
  if [[ -d "$skill_dir" ]]; then
    skill_name="$(basename "$skill_dir")"
    rm -rf "${DEST_DIR:?}/$skill_name"
    cp -r "$skill_dir" "$DEST_DIR/"
    ((COUNT++))
  fi
done

echo "Successfully installed $COUNT skills to $DEST_DIR"
EOF
