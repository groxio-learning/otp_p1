defmodule Enigma do
  use GenServer
  alias Enigma.Game

  def start_link({starting_value, name}) do
    IO.puts("Make a guess, #{name} (e.g. Enigma.guess([1,2,3,4])")
    GenServer.start_link(__MODULE__, starting_value, name: name || __MODULE__)
  end

  def guess(game \\ __MODULE__, guess) do
    GenServer.call(game, {:guess, guess})
    |> IO.puts
  end

  def child_spec({_starting_value, name}) do
    %{id: name, start: {Enigma, :start_link, [{nil, name}]}}
  end

  def play(name) do
    DynamicSupervisor.start_child(:sup, {Enigma, {nil, name}})
  end

  def init(starting_value) do
    {:ok, Game.new(starting_value || Enum.take_random(1..8, 4)) }
  end

  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.move(game, guess)
    {:reply, Game.to_map(new_game), new_game}
  end
end
