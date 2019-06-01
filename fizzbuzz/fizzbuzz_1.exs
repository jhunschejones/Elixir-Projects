# implementation using function overloading
# run with `elixir fizzbuzz_1.exs`
defmodule FizzBuzz do
  def go(min, max) do
    min..max
    # |> Enum.each(fn num -> go(num) end)
    |> Enum.each(&go(&1))
  end

  def go(num) when rem(num, 3) == 0 and rem(num, 5) == 0, do: IO.puts "fizzbuzz"
  def go(num) when rem(num, 3) == 0, do: IO.puts "fizz"
  def go(num) when rem(num, 5) == 0, do: IO.puts "buzz"
  def go(num), do: IO.puts num
end

FizzBuzz.go(1, 100)
