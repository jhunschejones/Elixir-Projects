card_one = 13
card_two = 3

find_three = fn 
  (3) -> "Bingo!"
  (_) -> "Sorry!" # wild-card operator
end

IO.puts find_three.(card_one)
IO.puts find_three.(card_two)
