defmodule WordFrequency.CLI do
  def main(args) do
    case {args, IO.stream(:stdio, :line)} do
      {[], input} -> WordFrequency.synchronous_pipeline(input)
      {input, _} -> WordFrequency.file_pipeline(input)
    end
  end

  def output_results(result_list) do
    result_list
    |> Enum.each(fn result ->
      phrase = Enum.join(elem(result, 0), " ")
      count = elem(result, 1)
      IO.puts "#{phrase} - #{count}"
    end)
  end
end
