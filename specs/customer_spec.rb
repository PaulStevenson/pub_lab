require("minitest/autorun")
require("minitest/rg")
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Paul", 20, 21)
    @beer = Drink.new("beer", 5.00, 6)
    @rum = Drink.new("rum", 7.00, 8)
    @inventory = [@beer, @rum]
    @pub = Pub.new("Fubar", 500, @inventory)
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

  def test_check_wallet__true
    assert_equal(true, @customer1.check_wallet(5))
  end

  def test_check_wallet__false
    assert_equal(false, @customer1.check_wallet(25))
  end

  def test_pay_money
    @customer1.pay_money(5)
    assert_equal(15, @customer1.wallet)
  end

  def test_buy_drink__success
    @customer1.buy_drink(@pub,"beer")
    assert_equal(15, @customer1.wallet)
    assert_equal(505, @pub.till)
    assert_equal(1, @pub.inventory.count)
    assert_equal(6, @customer1.drunkeness)
  end

  def test_buy_drink__fail
    @customer1.buy_drink(@pub,"vodka")
    assert_equal(20, @customer1.wallet)
    assert_equal(500, @pub.till)
    assert_equal(2, @pub.inventory.count)
    assert_equal(0, @customer1.drunkeness)
  end



end
