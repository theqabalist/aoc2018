defmodule Pair do
  def fst({x, _}), do: x

  def snd({_, y}), do: y
end
