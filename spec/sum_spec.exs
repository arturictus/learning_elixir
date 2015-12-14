defmodule SumSpec do
  use ESpec
  describe "values" do
    let :hd, do: [ one: 1, two: 2, three: 3] |> Enum.into HashDict.new
    let :map, do: %{ four: 4, five: 5, six: 6 }
    it do: expect(Sum.values(hd)) |> to eq 6
    it do: expect(Sum.values(map)) |> to eq 15
  end
end
