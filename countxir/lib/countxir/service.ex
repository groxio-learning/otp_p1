defmodule Countxir.Service do
  alias Countxir.Core

  def start(string) do
    spawn(fn -> string |> Core.new |> run end)
  end
  def run(num) do
    num |> listen() |> run()
  end
  def listen(num) do
    receive do
      :inc ->
        Core.add(num, 1)
      {:read, from} ->
        send(from, num)
        num
    end
  end
end
