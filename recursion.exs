defmodule Recursion do
  
  def countdown(0), do: IO.puts "Done!" 
  def countdown(n) do
    IO.puts n
    countdown(n - 1)
  end
end
Recursion.countdown(5)
