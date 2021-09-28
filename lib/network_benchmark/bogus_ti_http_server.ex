defmodule NetworkBenchmark.BogusTIHTTPServer do
  use ThousandIsland.Handler

  @impl ThousandIsland.Handler
  def handle_data("GET / HTTP/1.1" <> <<rest::binary>>, socket, state) do
    ThousandIsland.Socket.send(socket, "HTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n")
    {:ok, :close, state}
  end
end
