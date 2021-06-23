defmodule Enigma.Server do
  use GenServer
  alias Enigma.Game

  def init(starting_value) do
    {:ok, Game.new(starting_value || Enum.take_random(1..8, 4)) }
  end

  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.move(game, guess)
    {:reply, Game.to_map(new_game), new_game}
  end

end
