defmodule TaskList do
  
  def add_task(task) do
    "Task to add: #{task}"
  end

  # single line function
  def yell_task(task), do: String.upcase(task)
end

IO.inspect TaskList.add_task("learn what pattern-matching is")
IO.inspect TaskList.yell_task("my brain is hurting!")
