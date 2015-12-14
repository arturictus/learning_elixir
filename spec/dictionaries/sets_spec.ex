defmodule SetsSpec do
  use ESpec
  let :set1, do: Enum.into 1..5, HashSet.new
  it do: expect(Set.member? set1, 3) |> to be_truthy
  let :set2, do: Enum.into 3..8, HashSet.new
  describe "Set.union(set1, set2)" do
    #=> HashSet<[7, 6, 4, 1, 8, 2, 3, 5]>
    it do: Set.union(set1, set2) |> Set.member?(3) |> expect |> to be_truthy
    it do: Set.union(set1, set2) |> Set.member?(8) |> expect |> to be_truthy
  end
  describe "Set.difference(set1, set2)" do
    #=> HashSet<[1, 2]>
    let :diff, do: Set.difference(set1, set2)
    it do: diff |> Set.member?(3) |> expect |> to be_falsy
    it do: diff |> Set.member?(8) |> expect |> to be_falsy
    it do: diff |> Set.member?(1) |> expect |> to be_truthy
    it do: diff |> Set.member?(2) |> expect |> to be_truthy
  end
  describe "Set.difference(set2, set1)" do
    let :diff, do: Set.difference(set2, set1)
    #=> HashSet<[6, 7, 8]>
    it do: diff |> Set.member?(3) |> expect |> to be_falsy
    it do: diff |> Set.member?(1) |> expect |> to be_falsy
    it do: diff |> Set.member?(2) |> expect |> to be_falsy
    it do: diff |> Set.member?(6) |> expect |> to be_truthy
    it do: diff |> Set.member?(7) |> expect |> to be_truthy
    it do: diff |> Set.member?(8) |> expect |> to be_truthy
  end
  describe "Set.intersection set1, set2" do
    #=> #HashSet<[3, 4, 5]>
    let :intersection, do: Set.intersection(set1, set2)
    it do: intersection |> Set.member?(3) |> expect |> to be_truthy
    it do: intersection |> Set.member?(4) |> expect |> to be_truthy
    it do: intersection |> Set.member?(5) |> expect |> to be_truthy
    it do: intersection |> Set.member?(1) |> expect |> to be_falsy
    it do: intersection |> Set.member?(2) |> expect |> to be_falsy
    it do: intersection |> Set.member?(6) |> expect |> to be_falsy
    it do: intersection |> Set.member?(7) |> expect |> to be_falsy
    it do: intersection |> Set.member?(8) |> expect |> to be_falsy
  end
end
