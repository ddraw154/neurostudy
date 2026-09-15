#!/usr/bin/env bash
set -euo pipefail

export OMP_NUM_THREADS=${OMP_NUM_THREADS:-1}
export OPENBLAS_NUM_THREADS=${OPENBLAS_NUM_THREADS:-1}
export MKL_NUM_THREADS=${MKL_NUM_THREADS:-1}

python3 living_core_cpu_v8_3_social_memory.py \
  --fresh \
  --seed 674651885 \
  --steps 1000000 \
  --population 96 \
  --max-population 192 \
  --dim 72 \
  --archive-bytes 16384 \
  --archive-max-mib 10 \
  --archive-global-max-mib 512 \
  --archive-growth-min-kib 16 \
  --archive-growth-max-kib 256 \
  --archive-growth-cooldown 500 \
  --peer-radius 4 \
  --share-max-bytes-tick 32 \
  --checkpoint living_core_v83_social_memory.npz \
  --checkpoint-every 10000 \
  --log-every 500 \
  --metrics-log living_core_v83_metrics.log.gz \
  --memory-transfer-log memory_transfers_v83.jsonl.gz \
  --browser-enable \
  --browser-log browser_requests_v83.jsonl.gz \
  --browser-response-dir browser_responses_v83 \
  --browser-trigger-mode x5 \
  --browser-x5-threshold 0.05 \
  --browser-cooldown 500 \
  --browser-char-every 8 \
  --prophet-enable \
  --prophet-every 5000 \
  --prophet-start 5000 \
  --prophet-target browser \
  --prophet-mode demo \
  --prophet-sites example.com,iana.org,wikipedia.org,ya.ru,google.com \
  --prophet-max-bytes 4096 \
  --prophet-log prophet_v83.jsonl.gz \
  --tui \
  --tui-every 100
