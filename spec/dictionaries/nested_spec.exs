defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

defmodule NestedSpec do
  use ESpec
  let :report do
    %BugReport{
      owner: %Customer{
        name: "Dave", company: "Pragmatic"
      },
      details: "broken"
    }
  end
  it do: expect(report.owner.company) |> to eq "Pragmatic"

  describe "Overriding" do
    let :over_report do
      %BugReport{
        report |
        owner: %Customer{
          report.owner |
          company: "PragProg"
        }
      }
    end
    it do: expect(over_report.owner.company) |> to eq "PragProg"
  end
  describe "put_in" do
    let :example1, do: put_in(report.owner.company, "PragProg")
    it do: expect(example1.owner.company) |> to eq "PragProg"
  end
  describe "update_in" do
    let :example2, do: update_in(report.owner.name, &("Mr. " <> &1))
    it do: expect(example2.owner.name) |> to eq "Mr. Dave"
  end

  describe "Nested Accessors and Nonstructs" do
    let :report, do: %{
      owner: %{
        name: "Dave", company: "Pragmatic"
      },
      severity: 1
    }
    it do: expect(report.owner.company) |> to eq "Pragmatic"
    describe "put_in" do
      let :example1, do: put_in(report[:owner][:company], "PragProg")
      it do: expect(example1[:owner][:company]) |> to eq "PragProg"
    end
    describe "update_in" do
      let :example2, do: update_in(report[:owner][:name], &("Mr. " <> &1))
      it do: expect(example2[:owner][:name]) |> to eq "Mr. Dave"
    end
  end

end
