defmodule NetworkBenchmark.BogusRanchHTTPWorker do
  def start_link(ref, socket, transport, opts) do
    pid = spawn_link(__MODULE__, :init, [ref, socket, transport, opts])
    {:ok, pid}
  end

  def init(ref, socket, transport, _opts) do
    :ok = :ranch.accept_ack(ref)
    # Ensure we wait for at least one byte of data
    {:ok, "GET / HTTP/1.1"} = transport.recv(socket, 14, 5000)
    transport.send(socket, "HTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n")
    transport.close(socket)
  end
end
