defmodule EntryPoint do
  def run(mod) do
    then = Time.utc_now()
    input = IO.read(:stdio, :all)
      |> String.trim()
    solution1 = mod.part1(input)
    solution2 = mod.part2(input)
    IO.puts("Running #{mod}")
    IO.puts("Solution 1: #{solution1}")
    IO.puts("Solution 2: #{solution2}")
    now = Time.utc_now()
    delta = Time.diff(now, then, :millisecond)
    IO.puts("Time: #{delta}ms")
  end
end
