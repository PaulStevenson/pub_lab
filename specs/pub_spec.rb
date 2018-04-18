require("minitest/autorun")
require("minitest/rg")
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class PubTest < MiniTest::Test
  def setup
    @beer = Drink.new("beer", 5.00, 6)
    @rum = Drink.new("rum", 7.00, 8)
    @inventory = [@beer, @rum]
    @pub = Pub.new("Fubar", 500, @inventory)
  end

  def test_name
    assert_equal("Fubar", @pub.name)
  end

  def test_till
    assert_equal(500, @pub.till)
  end

  def test_inventory
    assert_equal(@inventory, @pub.inventory)
  end

  def test_check_drink__true
    assert_equal(true, @pub.check_drink("beer"))
  end

  def test_check_drink__false
    assert_equal(false, @pub.check_drink("vodka"))
  end

  def test_fetch_drink
    drink = @pub.fetch_drink("beer")
    assert_equal(1, @pub.inventory.count())
    assert_equal("beer", drink.name)
  end

end
