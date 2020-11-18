defmodule Day1 do
  defp input_as_int_stream(input) do
    input
    |> String.split("\n")
    |> Stream.map(&Integer.parse/1)
    |> Stream.map(&Pair.fst/1)
  end

  def part1(input) do
    input_as_int_stream(input)
     |> Enum.reduce(0, &+/2)
  end

  def part2(input) do
    input_as_int_stream(input)
    |> Stream.cycle
    |> Stream.scan(0, &+/2) # 0, 1, 3, 6, 10, 15
    |> Stream.scan({:nothing, MapSet.new()}, fn (e, {_, seen}) ->
      if MapSet.member?(seen, e) do
        {e, seen}
      else
        {:nothing, MapSet.put(seen, e)}
      end
    end)
    |> Stream.filter(&(Pair.fst(&1) |> Kernel.!=(:nothing)))
    |> Stream.map(&Pair.fst/1)
    |> Stream.take(1)
    |> Enum.to_list()
    |> hd
  end
end
