defmodule MyEnum do
  def all?([], _), do: false
  def all?([x], func), do: func.(x)
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []

  # My solution
  def filter(list, func), do: filter(list, [], func)
  def filter([], acomulator, _), do: acomulator
  def filter([ head | tail ], acomulator, func) do
    if func.(head) do
      acomulator = List.insert_at(acomulator, -1, head)
    end
    filter(tail, acomulator, func)
  end

  # Expected `[2, [[[]]]]` to equals (==) `[2]`, but it doesn't.
  # def filter([ head | tail ], func) do
  #   if func.(head) do
  #     [ head, filter(tail, func) ]
  #   else
  #     [ filter(tail, func) ]
  #   end
  # end

  # def split([], _), do: []
  # def split(list, number), do: split(list, number)
  # def split(list, number, acomulator), do: []
end
