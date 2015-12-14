defmodule MyEnumSpec do
  use ESpec
  describe "all?" do
    let :func, do: &(&1 < 4)
    it do: expect(MyEnum.all?([1, 2, 3], func)) |> to be_true
    it do: expect(MyEnum.all?([4, 5, 6], func)) |> to be_false
  end
  describe "each" do
    let :cont, do: []
    let :func, do: &(List.insert_at(cont, -1, &1))
    it do
      list = [1, 2, 3]
      expect(MyEnum.each(list, func)) |> to eq :ok
      # expect(cont) |> to eq list
    end
    it do: expect(MyEnum.each([4, 5, 6], func)) |> to eq :ok
  end

  describe "filter" do
    let :func, do: &(&1 == 2)
    it do: expect(MyEnum.filter([2, 1, 4], func)) |> to eq [2]
  end
  describe "split" do
    xit do: expect(MyEnum.split([1, 2, 3, 4, 5], 3)) |> to eq {[1, 2, 3], [4, 5]}
  end
end
