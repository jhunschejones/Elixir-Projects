defmodule PingPong do
  @rounds 11 # module attribute assignment

  def ready do
    receive do
      {_sender, _action, @rounds} ->
        IO.puts "Game finished!\n"
        ready()

      {sender, action, turn} ->
        hit_to(sender, switch(action), turn + 1)
        ready()

    after
      1_000 -> IO.puts "**player #{inspect player_pid()} timed out after 1 second of inactivity**"
    end
  end

  def hit_to(opponent_id, action, turn) do
    IO.puts "#{turn}. hit_to #{inspect opponent_id}, #{inspect action}"
    send(opponent_id, {player_pid(), action, turn})
  end

  defp player_pid, do: self()

  defp switch(action) do
    case action do
      :ping -> :pong
      _____ -> :ping
    end
  end
end

# returns the process ID for the current process 
player_1 = self()
# grab index 1 of the returned tuple which is the PID
# player_2 = elem(Task.start(PingPong, :ready, []), 1) 
player_2 = PingPong |> Task.start(:ready, []) |> elem(1) # same as above, using pipe

IO.puts "Todays Players:\n---------------\nplayer_1: #{inspect player_1}\nplayer_2: #{inspect player_2}\n"
PingPong.hit_to(player_2, :ping, 1)

PingPong.ready
