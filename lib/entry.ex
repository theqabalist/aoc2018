defmodule EntryPoint do
  def main(args) do
    which = hd(args)
    input = File.read("inputs/#{which |> String.downcase}.txt") |> Pair.snd |> String.trim
    run(String.to_existing_atom("Elixir.#{hd(args)}"), input)
  end
  def run(mod, input) do
    {run_time, _} = :timer.tc(fn ->
    solution1 = mod.part1(input)
    solution2 = mod.part2(input)
    IO.puts("Running #{mod}")
    IO.puts("Solution 1: #{solution1}")
    IO.puts("Solution 2: #{solution2}")
    end)

    IO.puts("Time: #{run_time/1000}ms")
  end
end
