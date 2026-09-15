# Living Core v8.3 architecture

## Organism

Each organism has:

- recurrent state vector `x`;
- mutable weight matrix `W`;
- working memory `mem`;
- persistent saturation trace for homeostasis;
- byte-addressable episodic archive;
- energy, position, age, lineage, generation and immutable UID.

Children inherit the parent's current learned weights plus mutation, but start with an empty episodic archive. This separates weight inheritance from cultural/episodic transmission.

## Environment

The world is a toroidal resource field with regeneration. Computation, movement, plasticity, memory, communication, archive growth and memory transfer have energy costs.

There is no explicit reward scalar or target such as `survive`, `reproduce`, `browse`, or `talk`.

## Neural homeostasis

Weights have no hard upper ceiling. Instead, every neuron maintains an exponential trace of persistent activation saturation. A row that remains saturated:

1. learns more slowly;
2. gradually scales down its incoming weights;
3. can amplify this unclamping through an internal self-gate.

This is intended to prevent the `W -> tanh saturation -> stronger W` runaway observed in v7.3.

## Communication

`x[5]` is the raw internal/voice channel. Only amplitudes outside a dead-zone are emitted into a signed local communication field. Broadcasting costs energy and the cost grows nonlinearly with amplitude.

The hexadecimal 128-bit voice trace is an observer-side encoding of the sign of `x[5]`; it is not a predefined language.

## Episodic archive

Each organism starts with 16 KiB. External web/Prophet bytes are archived exactly. The organism can move a read head and can also write bytes itself.

In v8.3 organisms can request archive expansion. Default constraints:

- 16 KiB initial capacity;
- 10 MiB maximum per organism;
- 512 MiB total population archive pool;
- cooldown and energy cost for growth.

## Social memory

Nearby organisms perceive the exact 32-bit UID of their nearest visible peer plus relative position, energy and social-memory gate states.

Outputs:

- `x[32]`: offer memory;
- `x[33]`: accept/reject memory;
- `x[34]`: transfer size;
- `x[35]`: request more archive capacity;
- `x[36]`: requested growth amount.

A memory transfer occurs only between mutually nearest peers when the sender offers and receiver accepts. The sender's current archive read head selects the transmitted portion. Both sides pay energy costs.

## HTTPS port

One long-lived organism owns the scarce browser port. It builds a hostname from internal state, requests HTTPS, and receives response/error bytes through the same raw sensory byte interface used by Prophet demonstrations.

Network validation deliberately rejects malformed and non-public destinations before an external connection when possible.

## Prophet curriculum

Prophet is optional guided learning, not a separate organism and not a reward mechanism. At rare intervals it sends a valid domain string as raw bytes to a selected organism. In `demo` mode it then appends the real HTTPS response.

Prophet does not:

- modify weights directly;
- add energy;
- copy the domain into the browser transmit buffer;
- label HTTP status codes as good or bad.

It does provide prior examples, so Prophet-enabled experiments must be distinguished from zero-prior discovery experiments.
