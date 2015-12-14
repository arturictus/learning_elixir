defmodule MyComprehesions do
  for x <- [1, 2, 3, 4, 5], do: x * x
  # => [1, 4, 9, 16, 25]
  for x <- [1, 2, 3, 4, 5], x < 4, do: x * x
  # => [1, 4, 9]
  for x <- [1, 2], y <- [5, 6], do: x * y
  # => [5, 6, 10, 12]
  for x <- [1, 2], y <- [5, 6], do: { x, y }
  # => [{1, 5}, {1, 6}, {2, 5}, {2, 6}]
  min_maxes = [{1,4}, {2, 3}, {10, 15}]
  for {min, max} <- min_maxes, n <- min..max, do: n
  # => [1, 2, 3, 4, 2, 3, 10, 11, 12, 13, 14, 15]
  first8 = [1, 2, 3, 4, 5, 6, 7, 8]
  for x <- first8, y <- first8, x >= y,  rem(x * y, 10), do: { x, y }
  # => [{1, 1}, {2, 1}, {2, 2}, {3, 1}, {3, 2}, {3, 3}, {4, 1}, {4, 2}, {4, 3}, {4, 4},
  # {5, 1}, {5, 2}, {5, 3}, {5, 4}, {5, 5}, {6, 1}, {6, 2}, {6, 3}, {6, 4}, {6, 5},
  # {6, 6}, {7, 1}, {7, 2}, {7, 3}, {7, 4}, {7, 5}, {7, 6}, {7, 7}, {8, 1}, {8, 2},
  # {8, 3}, {8, 4}, {8, 5}, {8, 6}, {8, 7}, {8, 8}]
  reports = [ dallas: :hot, mineapolis: :cold, dc: :muggy, la: :smoggy ]
  for { city, weather } <- reports, do: { weather, city }
  # => [hot: :dallas, cold: :mineapolis, muggy: :dc, smoggy: :la]

  # binary
  for << ch <- "hello" >>, do: ch
  # => 'hello'
  for << ch <- "hello" >>, do: <<ch>>
  # => ["h", "e", "l", "l", "o"]

  # to octal
  for << << b1::size(2), b2::size(3), b3::size(3) >> <- "hello" >>, do: "0#{b1}#{b2}#{b3}"
  # => ["0150", "0145", "0154", "0154", "0157"]

  for x <- ~w{cat dog}, into: %{}, do: { x, String.upcase(x) }
  for x <- ~w{cat dog}, into: Map.new, do: { x, String.upcase(x) }
  # => %{"cat" => "CAT", "dog" => "DOG"}
  for x <- ~w{cat dog}, into: %{ "ant" => "ANT" }, do: { x, String.upcase(x) }
  # => %{"ant" => "ANT", "cat" => "CAT", "dog" => "DOG"}
end
