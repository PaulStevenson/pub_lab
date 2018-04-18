class Customer
  attr_reader :name, :wallet, :age, :drunkeness
  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = 0
  end

  def drink_beverage(drink)
    @drunkeness += drink.units
  end

  def check_wallet(value)
    return @wallet >= value
  end

  def pay_money(value)
    @wallet -= value
  end

  def buy_drink(pub, drink_name)
    return if pub.check_drink(drink_name) == false
    price = pub.get_price(drink_name)
    return if check_wallet(price) == false
    pay_money(price)
    pub.take_money(price)
    drink = pub.fetch_drink(drink_name)
    drink_beverage(drink)
  end
end
