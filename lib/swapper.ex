defmodule Swapper do
  def swapp([]), do: []
  def swapp([ a, b | tail ]), do: [b, a | swapp(tail) ]
  def swapp([_]), do: raise "Can't swapp a list with an odd number of elements"
end
