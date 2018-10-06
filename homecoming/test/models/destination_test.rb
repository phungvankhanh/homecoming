require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  test "destination name presence validation" do
    destination = Destination.new
    destination.name = ""
    destination.address = "Viet Nam"
    destination.picture_path = "fake_path"
    assert_not destination.save
  end

  test "destination address presence validation" do
    destination = Destination.new
    destination.name = "Ha Long Bay"
    destination.address = ""
    destination.picture_path = "fake_path"
    assert_not destination.save
  end

  test "destination picture_path presence validation" do
    destination = Destination.new
    destination.name = "Ha Long Bay"
    destination.address = "Viet Nam"
    destination.picture_path = ""
    assert_not destination.save
  end
end
