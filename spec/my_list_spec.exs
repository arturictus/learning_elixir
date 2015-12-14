defmodule MyListSpec do
  use ESpec
  describe "mapsum" do
    it do: expect MyList.mapsum([1, 2, 3], &(&1 * &1)) |> to eq 14
    it do: expect MyList.mapsum([], &(&1 * &1)) |> to eq 0
  end
  describe "max" do
    it do: expect MyList.max([]) |> to eq nil
    it do: expect MyList.max([1, 2, 3]) |> to eq 3
    it do: expect MyList.max([6, 20, 1, 9, 2, 3]) |> to eq 20
  end

  describe "span" do
    subject { MyList.span(1, 3) }
    xit do: expect subject |> to have_first 1
  end

  describe "caesar" do
    xit do: expect MyList.caesar('ryvkve', 13) |> to eq "elixir"
  end
end
