# Network Benchmark

An application to benchmark the Thousand Island/Bandit & Ranch/Cowboy stacks

The application spins up two (actual) HTTP servers both serving the same `Echo` Plug:

* a Bandit server on port 4001
* a Cowboy server on port 4002

It also spins up two 'fake' HTTP servers:

* A Thousand Island server on port 5001
* A Ranch server on port 5002

Each of these servers are backed by implementations which do the barest minimum to
mostly-conformantly answer a simple HTTP request with an empty response. This allows them to be
measured using standard HTTP benchmarking tools, providing an idea of what the performance of 
Ranch and Thousand Island are like when used with the most trivial of protocol handlers.

All servers are started with default options.

## Overview

The `Echo` server will echo back the uploaded body as its response to any path. The benchmarking
process will upload the `random_10k` file on each connection & wait for the identical response.
This will induce 10k of traffic in each direction for each request, plus any header and protocol
overhead. 

The benchmark seeks to identify how each server performs in terms of the total number of requests
per second (RPS) it is able to provide, measured as a function of the number of concurrent
connections. This process is repeated for both HTTP/1.1 and h2c (HTTP/2 over cleartext). The tests
are also run with a per-connection request count of 1 and 16 in order to understand how connection
reuse affects their performance.

The `h2load` program from the [nghttp2](https://nghttp2.org) project is used to run all
benchmarks. All tests are run over cleartext to avoid TLS overhead.

## Running

1. Run the server via `iex -S mix`
2. Update the contents of the `run_benchmarks.sh` script to suit your configuration
3. Record the reqs/s from the **finished in x.xs, y.y reqs/s** output
4. Interpret your results

# License

MIT

