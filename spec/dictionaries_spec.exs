defmodule DictionariesSpec do
  use ESpec
  let :kw_list, do: [ name: "Dave", likes: "Programming", where: "Dallas" ]
  let :hashdict, do: Enum.into kw_list, HashDict.new
  let :map, do: Enum.into kw_list, Map.new
  it do: expect(kw_list[:name]) |> to eq "Dave"
  it do: expect(hashdict[:likes]) |> to eq "Programming"
  it do: expect(map[:where]) |> to eq "Dallas"
  describe "Dict.drop" do
    let :drop, do: Dict.drop(hashdict, [:where, :likes])
    it do: expect(drop[:name]) |> to eq "Dave"
    it do: expect(drop[:likes]) |> to eq nil
    it do: expect(drop[:where]) |> to eq nil
  end
  describe "Dict.put" do
    let :put, do: Dict.put(drop, :also_likes, "Ruby")
    it do: expect(put[:also_likes]) |> to eq "Ruby"
  end
  describe "Dict.merge" do
    let :combo, do: Dict.merge(map, hashdict)
    it do: expect(combo[:name]) |> to eq "Dave"
    it do: expect(combo[:likes]) |> to eq "Programming"
    it do: expect(combo[:where]) |> to eq "Dallas"
  end

  describe "KWList allows duplicates" do
    let :kw_list, do: [ name: "Dave", likes: "Programming", likes: "Elixir", where: "Dallas" ]
    describe "Dict.get" do
      let :get, do: Dict.get(kw_list, :likes)
      it do: expect(get) |> to eq "Programming"
    end
    describe "Keyword.get_values" do
      let :get, do: Keyword.get_values(kw_list, :likes)
      it do: expect(get) |> to have_count 2
      it do: expect(get) |> to have "Programming"
      it do: expect(get) |> to have "Elixir"
    end
  end
end
