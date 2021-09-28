defmodule NetworkBenchmark.BogusRanchHTTPServer do
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(opts) do
    {:ok, _} =
      :ranch.start_listener(
        :ranch_listener,
        :ranch_tcp,
        opts,
        NetworkBenchmark.BogusRanchHTTPWorker,
        []
      )
  end
end
