defmodule WeatherHistorySpec do
  use ESpec
  let :test_data,
    do: [
     [1366225622, 26, 15, 0.125],
     [1366225622, 27, 15, 0.45],
     [1366225622, 28, 21, 0.25],
     [1366229222, 26, 19, 0.081],
     [1366229222, 27, 17, 0.468],
     [1366229222, 28, 15, 0.60],
     [1366232822, 26, 22, 0.095],
     [1366232822, 27, 21, 0.05],
     [1366232822, 28, 24, 0.03],
     [1366236422, 26, 17, 0.025]
    ]
  describe "for_location_27" do
    subject do: WeatherHistory.for_location_27(test_data)
    it do: expect(subject) |> to have_count 3
    it do: expect(subject) |> to have [1366225622, 27, 15, 0.45]
  end
  describe "for_location" do
    context "target_loc = 27" do
      subject do: WeatherHistory.for_location(test_data, 27)
      it do: expect(subject) |> to have_count 3
      it do: expect(subject) |> to have [1366225622, 27, 15, 0.45]
    end
    context "target_loc = 26" do
      subject do: WeatherHistory.for_location(test_data, 26)
      it do: expect(subject) |> to have_count 4
      it do: expect(subject) |> to have [1366225622, 26, 15, 0.125]
    end
  end
end
