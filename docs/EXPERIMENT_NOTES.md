# Experiment notes and interpretation guardrails

These are observations from the iterative runs that motivated the current architecture. They are not claims of consciousness.

## Energy-dependent behavior

For early long-lived organism `uid=0`, forensic replay showed a systematic low-energy regime:

- increased absorption command;
- reduced movement magnitude;
- stronger alignment of movement toward richer resource gradients;
- lower net energy loss around the critical range.

The organism still died when local resource became too scarce. This supports the operational description **self-preserving policy**, not subjective desire to live.

A later long-lived organism (`uid=12880`) maintained low energy for tens of thousands of ticks with state-dependent absorption/movement responses and periods of positive net energy balance, consistent with a homeostatic regime.

## Communication traces

Several old/low-energy organisms showed a transition from constant `x[5]` sign to structured long blocks of positive/negative signal. High voice entropy with low flip rate means long runs of bits, not white noise and not proven language.

## Runaway saturation

Removing the old row-L1 weight ceiling caused rapid growth in `W`, increasing `Xsat` toward 1.0. The result was stronger but less discriminating neural activity and near-global communication-field flooding.

This motivated persistent anti-saturation homeostasis rather than restoring a hard cap.

## Web interaction

Early browser organisms generated malformed hostnames and received local `HOST_LABEL` / `HOST_IDNA` errors. These validation failures occurred before outbound DNS/HTTPS in many cases.

A valid HTTP response is treated as sensory input, not reward. A site is not considered "understood" simply because a GET succeeds.

## What would count as stronger evidence of learning?

Examples:

- fewer malformed hostnames after repeated structured examples;
- emergence of dots / valid DNS labels after Prophet demonstrations;
- behavior changes that are counterfactually attributable to received bytes;
- a non-Prophet organism reproducing useful information after receiving another organism's episodic memory;
- repeated memory-transfer chains that change downstream behavior;
- stable neural homeostasis while weights continue to reorganize.

## Terms to use carefully

Prefer operational descriptions:

- "energy-dependent policy" over "fear of death";
- "communication signal" over "language" until semantics are demonstrated;
- "episodic archive transfer" over "teaching" until transferred content causes reproducible behavior;
- "agent-like" or "artificial-life-like" over "conscious".
