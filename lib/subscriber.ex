defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Subscriber{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Subscriber{ name: name }) when name != "" do
    "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Subscriber{}) do
    raise "missing name for badge"
  end
end

# Access is not a protocol, it has been deprecated
# defmodule Attendee do
#   @derive Access
#   defstruct name: "", paid: false, over_18: true
# end
