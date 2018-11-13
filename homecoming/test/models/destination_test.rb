require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  test "add new destination" do
    destination = Destination.new
    destination.name = "Ha Long"
    destination.address = "Viet Nam"
    assert_not(Destination.where(name: 'Ha Long').first, nil)
  end

end
