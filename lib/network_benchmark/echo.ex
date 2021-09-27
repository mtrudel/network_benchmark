defmodule NetworkBenchmark.Echo do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    {:ok, body, conn} = read_body(conn)

    conn
    |> send_resp(200, body)
  end
end
