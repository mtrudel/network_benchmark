# NetworkBenchmark

An application to benchmark the Thousand Island / Bandit & Ranch / Cowboy stacks

The application spins up a Bandit server on port 4001 and a Cowboy server on port 4002, each
running the same `Echo` plug, which simply echoes the posted body back to the client.

## Running Manually

1. Run the server via `iex -S mix`
2. Run h2load benchmarks like so:
   ```
   # Test 128 concurrent connections across 4 client thread each making 16 requests
   # Each request uploads and then downloads 10k worth of data, so 10G total each way

   # Time how long it takes to make 1M such requests
   h2load -n 1000000 -d random_10k http://localhost:4001 -m 16 -t 4 -c 128
   h2load -n 1000000 -d random_10k http://localhost:4002 -m 16 -t 4 -c 128

   # Now do it over HTTP/1.1
   h2load -n 1000000 -d random_10k http://localhost:4001 -m 16 -t 4 -c 128 -h1
   h2load -n 1000000 -d random_10k http://localhost:4002 -m 16 -t 4 -c 128 -h1
   ```
