defmodule SwapperSpec do
  use ESpec
  describe "swapp" do
    it do: expect Swapper.swapp([1, 2]) |> to eq [2, 1]
    xit do: expect Swapper.swapp([1]) |> to raise_exception
  end
end
