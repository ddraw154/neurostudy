# Neurostudy / Living Core

Experimental artificial-life / adaptive-agent sandbox developed iteratively from a minimal CPU model.

The project explores whether useful behavior can emerge from:

- finite energy and environmental resources;
- mutable neural weights without an externally defined reward function;
- lifetime memory and inherited learned weights;
- reproduction, mutation and lineage selection;
- local communication;
- bounded HTTPS sensing;
- a rare curriculum signal ("Prophet");
- per-organism episodic memory and consent-based memory exchange;
- neural homeostasis that counteracts saturation without imposing a hard weight ceiling.

> **Research status:** this is an experimental dynamical system, not evidence of consciousness or subjective experience. Terms such as "organism", "voice", "Prophet" and "self-preservation" are operational metaphors for measurable behaviors in the simulation.

## Current version

`living_core_cpu_v8_3_social_memory.py` is the latest branch.

Key properties:

- fresh brain width: `dim >= 72`;
- initial episodic archive: 16 KiB per organism;
- individual archive ceiling: 10 MiB;
- default global archive pool: 512 MiB;
- exact local peer UID sensing;
- consensual memory transfer between mutually identified nearby peers;
- organisms can request archive growth;
- sparse paid `x[5]` communication field;
- persistent anti-saturation homeostasis, no hard weight ceiling;
- guarded HTTPS-only browser port with DNS/IP validation, bounded response size and rate limiting;
- optional Prophet curriculum that presents real domain examples as raw bytes, without energy reward.

## Quick start

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

OMP_NUM_THREADS=1 \
OPENBLAS_NUM_THREADS=1 \
MKL_NUM_THREADS=1 \
taskset -c 0 \
nice -n 10 \
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
```

## Repository layout

- `living_core_cpu_v8_3_social_memory.py` — current experiment.
- `history/` — earlier versions from the development sequence.
- `tools/` — forensic/log analyzers and GPU probe.
- `docs/ARCHITECTURE.md` — current model and channel map.
- `docs/EXPERIMENT_NOTES.md` — notable observations and interpretation guardrails.

## Version history at a glance

- **v0-v3** — basic resource world, reproduction, mutation and self-modifying weights.
- **v4** — exact resume and endogenous memory.
- **v4 Voice** — individual `x[5]` observer channel.
- **v5** — local communication field and TUI.
- **v6** — experimental human feedback branch.
- **v7** — guarded HTTPS port and raw-byte responses.
- **v7.1-v7.2** — `x[5]`-gated requests and better web telemetry.
- **v7.3** — removed hard weight ceiling; exposed runaway saturation.
- **v7.4** — soft homeostatic anti-saturation.
- **v8** — persistent homeostasis and sparse paid communication.
- **v8.1** — optional Prophet curriculum.
- **v8.2** — 16 KiB addressable episodic memory per organism.
- **v8.3** — peer identity, consent-based memory exchange, elastic memory up to 10 MiB/organism with a global pool guard.

## Network safety

The web-enabled branches intentionally restrict network access. Do not remove these guards casually.

The current browser path is designed around:

- HTTPS only;
- port 443 only;
- public-routable DNS targets only;
- rejection of localhost/private/link-local/reserved addresses;
- no cookies, credentials or authentication;
- bounded response size;
- explicit rate limiting;
- no automatic redirects;
- invalid hostnames rejected locally before network traffic.

For large GPU sweeps, use a central web broker/cache and a single global external rate limiter rather than allowing each world to contact the public Internet independently.

## Reproducibility

The simulations save NumPy checkpoints and RNG state. Internet responses are external and therefore make web-enabled runs only partially reproducible after the first external request.

Generated checkpoints, response bodies and logs are excluded from Git by default.
