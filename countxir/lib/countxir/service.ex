defmodule Countxir.Service do
  alias Countxir.Core

  def start(string) do
    spawn(fn -> string |> Core.new |> run end)
  end

  def inc(counter) do
    send(counter, :inc)
  end

  def read(counter) do
    send(counter, {:read, self()})
    receive do
      string -> string
    end
  end

  def run(num) do
    num |> listen() |> run()
  end

  def listen(num) do
    receive do
      :inc ->
        Core.add(num, 1)
      {:read, from} ->
        send(from, Core.message(num))
        num
    end
  end
end
