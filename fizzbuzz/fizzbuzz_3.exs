# implementation using case and pattern matching
# run with `elixir fizzbuzz_3.exs`
defmodule FizzBuzz do
  def go(min, max), do: Enum.each(min..max, &go/1)
  def go(num) do
    case {rem(num, 3), rem(num, 5)} do
      {0, 0} -> IO.puts "fizzbuzz"
      {0, _} -> IO.puts "fizz"
      {_, 0} -> IO.puts "buzz"
      _ -> IO.puts num
    end
  end
end

FizzBuzz.go(1, 100)
