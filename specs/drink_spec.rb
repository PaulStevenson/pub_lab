require("minitest/autorun")
require("minitest/rg")
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @beer = Drink.new("beer", 5.00, 6)
  end

  def test_name
    assert_equal("beer", @beer.name)
  end

  def test_price
    assert_equal(5.00, @beer.price)
  end

  def test_units
    assert_equal(6, @beer.units)
  end
end
