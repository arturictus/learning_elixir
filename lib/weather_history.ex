defmodule WeatherHistory do
  def for_location([], _taget_loc), do: []
  def for_location([ head = [ _, target_loc, _, _ ] | tail ], target_loc),
    do: [head | for_location(tail, target_loc) ]
  def for_location([ _ | tail ], target_loc),
    do: for_location(tail, target_loc)

  def for_location_27([]), do: []
  def for_location_27([[ time, 27, temp, rain ] | tail ]),
    do: [[ time, 27, temp, rain ] | for_location_27(tail) ]
  def for_location_27([ _ | tail ]),
    do: for_location_27(tail)
end
