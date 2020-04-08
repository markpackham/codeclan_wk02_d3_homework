require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../food")

class FoodTest < MiniTest::Test
  def setup()
    @food = Food.new("Burger", 8, 3)
    @food2 = Food.new("Spam", 15, 100000)
    @food3 = Food.new("Tofu", 5, 0)
  end

  def test_get_name
    assert_equal("Burger", @food.name)
  end

  def test_get_price
    assert_equal(5, @food3.price)
  end

  def test_get_rejuvenation_level
    assert_equal(3, @food.rejuvenation_level)
  end
end
