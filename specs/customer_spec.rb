require("minitest/autorun")
require("minitest/rg")
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Paul", 20, 21)
    @beer = Drink.new("beer", 5.00, 6)
  end

  def test_name
    assert_equal("Paul", @customer1.name)
  end

  def test_wallet
    assert_equal(20, @customer1.wallet)
  end

  def test_age
    assert_equal(21, @customer1.age)
  end

  def test_drunkeness
    assert_equal(0, @customer1.drunkeness)
  end

  def test_drink_beverage
    @customer1.drink_beverage(@beer)
    assert_equal(6, @customer1.drunkeness)
  end

end
