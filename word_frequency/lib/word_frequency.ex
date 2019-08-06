defmodule WordFrequency do
  def run do
    case {System.argv(), IO.stream(:stdio, :line)} do
      {[], input} -> stream_pipeline(input)
      {input, _} -> file_pipeline(input)
    end
  end

  def stream_pipeline(input) do
    input
    |> input_to_line_list()
    |> lines_to_phrase_map()
    |> top_phrases()
    |> output_results()
  end

  def file_pipeline([_ | additional_files] = input) do
    case additional_files do
      [] ->
        file_synchronous_pipeline(input)
      _ ->
        file_async_pipeline(input)
    end
  end

  def file_synchronous_pipeline(input) do
    input
    |> Stream.flat_map(&(File.stream!(&1)))
    |> input_to_line_list()
    |> lines_to_phrase_map()
    |> top_phrases()
    |> output_results()
  end

  def file_async_pipeline(input) do
    input
    |> Enum.map(fn file ->
      Task.async(fn ->
        file
        |> File.stream!()
        |> input_to_line_list()
        |> lines_to_phrase_map()
      end)
    end)
    |> Enum.map(fn task -> Task.await(task) end)
    # |> Task.async_stream(fn file ->
    #     file
    #     |> File.stream!()
    #     |> input_to_line_list()
    #     |> lines_to_phrase_map()
    #   end)
    # |> Enum.map(fn {:ok, result} -> result end)
    |> merge_phrase_maps()
    |> top_phrases()
    |> output_results()
  end

  def input_to_line_list(stream) do
    stream
    |> Stream.map(&(filter_line(&1)))
    |> Stream.filter(&(&1 != ""))
    |> Stream.flat_map(&(String.split(&1, " ")))
  end

  def filter_line(line) do
    line
    |> String.replace(~r/[^a-zA-Z0-9\s]+/, "")
    |> String.trim()
    |> String.downcase()
  end

  def lines_to_phrase_map(lines) do
    lines
    |> Enum.chunk_every(3, 1)
    |> Enum.reduce(%{}, fn phrase, acc -> Map.update(acc, phrase, 1, &(&1 + 1)) end)
  end

  def merge_phrase_maps(unmerged_phrase_maps) do
    merge_phrase_maps(unmerged_phrase_maps, %{})
  end
  def merge_phrase_maps([], merged_phrase_maps), do: merged_phrase_maps
  def merge_phrase_maps([next | remaining], merged_phrase_maps) do
    remaining
    |> merge_phrase_maps(
        Map.merge(
          next,
          merged_phrase_maps,
          fn _k, count_1, count_2 -> count_1 + count_2 end
        )
      )
  end

  def top_phrases(map, top_count \\ 100) do
    map
    |> Enum.sort_by(&(elem(&1, 1)))
    |> Enum.reverse()
    |> Enum.take(top_count)
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

WordFrequency.run()
