defmodule SubscriverSpec do
  use ESpec
  describe "Struct" do
    describe "initial state" do
      let :sl, do: %Subscriber{}
      it do: expect(sl.name) |> to eq ""
      it do: expect(sl.paid) |> to eq false
      it do: expect(sl.over_18) |> to eq true
    end
    describe "Passing a map" do
      let :sl, do: %Subscriber{ name: "Dave" }
      it do: expect(sl.name) |> to eq "Dave"
      it do: expect(sl.paid) |> to eq false
      it do: expect(sl.over_18) |> to eq true
    end

    describe "pattern matching" do
      let :s3, do: %Subscriber{ name: "Mary" }
      it do
        %Subscriber{ name: a_name } = s3
        expect(a_name) |> to eq s3.name
      end
    end
    describe "Updateting" do
      let :s4, do: %Subscriber{ s3 | name: "Marie" }
      it do
        expect(s4.name) |> to eq "Marie"
      end
    end
  end
  describe "print_vip_badge" do
    let :ai, do: %Subscriber{ name: "Dave", over_18: true }
    it do: expect(Subscriber.may_attend_after_party(ai)) |> to eq false
  end

  # describe "derive" do
  #   let :a, do: %Attendee{ name: "Sally", over_18: true }
  #   it expect(a[:name]).to eq "Sally"
  #   it expect(a[:over_18]).to eq true
  # end

end
