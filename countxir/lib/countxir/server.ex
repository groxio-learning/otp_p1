defmodule Countxir.Server do
  use GenServer
  alias Countxir.Core

  #Client
  def start_link(num) when is_binary(num) do
    GenServer.start_link(__MODULE__, num)
  end

  @spec inc(atom | pid | {atom, any} | {:via, atom, any}) :: :ok
  def inc(counter) do
    GenServer.cast(counter, :inc)
  end

  def dec(counter) do
    GenServer.cast(counter, :dec)
  end

  def read(counter) do
    GenServer.call(counter, :read)
  end

  #Server
  def init(num) do
    {:ok, Core.new(num)}
  end

  def handle_call(:read, _from, num) do
    {:reply, Core.message(num), num}
  end

  def handle_cast(:inc, num) do
    {:noreply, Core.add(num, 1)}
  end

  def handle_cast(:dec, num) do
    {:noreply, Core.add(num, -1)}
  end
end
