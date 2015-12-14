defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head * head | square(tail)]

  def add_1([]), do: []
  def add_1([ head | tail]), do: [ head + 1 | add_1(tail) ]

  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head)| map(tail, func)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)

  # Doesn't work bad arithmetic error ??
  # def sum1([]), do: []
  # def sum1([ head | tail ]), do: head + sum1(tail)

  def sum2(list, total \\ 0)
  def sum2([], total), do: total
  def sum2([ head | tail ], total), do: _sum(tail, head+total)

  def reduce([], value, _), do: value
  def reduce([ head | tail ], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum([], _), do: 0
  def mapsum([ head | tail ], func), do: _mapsum(tail, func.(head), func)
  defp _mapsum([], total, _), do: total
  defp _mapsum([ head | tail ], total, func), do: _mapsum(tail, func.(head)+total, func)

  # My solution
  # def max([]), do: nil
  # def max([ head | tail ]), do: _max(tail, head)
  # defp _max([], big), do: big
  # defp _max([ head | tail ], big) do
  #   bigger = if big > head, do: big, else: head
  #   _max(tail, bigger)
  # end

  def max([]), do: nil
  def max([x]), do: x
  def max([ head | tail ]), do: Kernel.max(head, max(tail))

  # def caesar([], _n), do: []
  # def caesar([ head | tail ], n)
  #   when head+n <= ?n,
  #   do: [ head+n | caesar(tail, n)]
  # def caesar([ head | tail ], n),
  #   do: [ head+n-26 | caesar(tail, n)]

  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from+1, to) ]
end
