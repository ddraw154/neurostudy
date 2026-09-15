#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-$HOME/Загрузки}"
ROOT="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT/history" "$ROOT/tools" "$ROOT/docs"

LATEST="living_core_cpu_v8_3_social_memory.py"
if [[ ! -f "$SRC_DIR/$LATEST" ]]; then
  echo "Missing $SRC_DIR/$LATEST" >&2
  exit 1
fi

cp "$SRC_DIR/$LATEST" "$ROOT/$LATEST"

history_files=(
  living_core_cpu.py
  living_core_cpu_v1.py
  living_core_cpu_v2.py
  living_core_cpu_v3.py
  living_core_cpu_v4.py
  living_core_cpu_v4_voice.py
  living_core_cpu_v5_comm.py
  living_core_cpu_v5_comm_tui.py
  living_core_cpu_v6_feedback.py
  living_core_cpu_v7_web.py
  living_core_cpu_v7_1_web.py
  living_core_cpu_v7_2_web.py
  living_core_cpu_v7_3_unbounded_web.py
  living_core_cpu_v7_4_homeostatic_web.py
  living_core_cpu_v8_fresh.py
  living_core_cpu_v8_1_prophet.py
  living_core_cpu_v8_2_memory.py
)

for f in "${history_files[@]}"; do
  [[ -f "$SRC_DIR/$f" ]] && cp "$SRC_DIR/$f" "$ROOT/history/$f"
done

tool_files=(
  analyze_living_core_logs.py
  analyze_uid_forensics.py
  analyze_uid_forensics_progress.py
  living_core_gpu_probe.py
)

for f in "${tool_files[@]}"; do
  [[ -f "$SRC_DIR/$f" ]] && cp "$SRC_DIR/$f" "$ROOT/tools/$f"
done

chmod +x "$ROOT/$LATEST" "$ROOT"/history/*.py "$ROOT"/tools/*.py 2>/dev/null || true

git add README.md .gitignore requirements.txt run_v83.sh docs scripts "$LATEST" history tools

if git diff --cached --quiet; then
  echo "Nothing new to commit."
  exit 0
fi

git commit -m "Import Living Core source history and analysis tools"
git push origin HEAD

echo "Imported source from: $SRC_DIR"
echo "Repository: $(git remote get-url origin)"
