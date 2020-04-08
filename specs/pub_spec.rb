require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink")
require_relative("../customer")
require_relative("../pub")

class PubTest < MiniTest::Test
  def setup()
    @pub = Pub.new("Friendly Arm Inn", 1000, [])
    @pub2 = Pub.new("The Plausiable Deniability", 3000, [])
    @drink = Drink.new("Vodka", 10, 5)
    @drink2 = Drink.new("Free Grog", 0, 1)
    @drink3 = Drink.new("Absinthe", 30, 15)
    @customer7 = Customer.new("Mr Sober", 40, 67)
    @customer8 = Customer.new("Mr Drunk", 200, 35)
  end

  def test_get_name
    assert_equal("Friendly Arm Inn", @pub.name)
  end

  def test_get_till_amount__pub1
    assert_equal(1000, @pub.till)
  end

  def test_get_till_amount__pub2
    assert_equal(3000, @pub2.till)
  end

  def test_get_stock
    assert_equal([], @pub.stock)
  end

  def test_increase_till_amount()
    assert_equal(1500, @pub.increase_till_amount(500))
  end

  def test_add_drink
    @pub.add_drinks(@drink)
    @pub.add_drinks(@drink2)
    assert_equal(2, @pub.drinks.length)
  end

  def test_serve_customer__true
    assert_equal(true, @pub.serve_customer(@customer7.drunkenness))
  end

  def test_serve_customer__false
    @customer8.drunkenness = 1000
    assert_equal(false, @pub.serve_customer(@customer8.drunkenness))
  end

  def test_add_drinks_to_stock
    @pub.add_drinks(@drink)
    @pub.add_drinks(@drink2)
    @pub.add_drinks(@drink3)
    @pub.add_drinks_to_stock(@pub.drinks)
    assert_equal(3, @pub.stock.length)
  end
end
