defmodule Countxir.Core do
  def new(num) when is_binary(num) do
    String.to_integer(num)
  end

  def add(acc, num) do
    acc + num
  end

  def message(num) do
    "The treasure is at #{num}"
  end
end
