defmodule DynamicNestedSpec do
  use ESpec
  let :nested do
    %{
      buttercup: %{
        actor: %{
          first: "Robin",
          last: "Wright"
        },
        role: "princess"
      },
      westley: %{
        actor: %{
          first: "Carey",
          last: "Ewes" # typo!
        },
        role: "farm boy"
      }
    }
  end
  describe "get_in" do
    it do: expect(get_in(nested, [:buttercup, :actor])) |> to eq %{ first: "Robin", last: "Wright" }
    it do: expect(get_in(nested, [:buttercup, :actor, :first])) |> to eq "Robin"
  end

  describe "get_in with func" do
    let :authors do
      [
        %{ name: "José", language: "Elixir" },
        %{ name: "Matz", language: "Ruby" },
        %{ name: "Larry", language: "Perl" }
      ]
    end
    let :languages_with_an_r do
      fn (:get, collection, next_fn) ->
        for row <- collection do
          if String.contains?(row.language, "r") do
            next_fn.(row)
          end
        end
      end
    end

    it do: expect(get_in(authors, [languages_with_an_r, :name])).to eq [ "José", nil, "Larry" ]
  end

end
