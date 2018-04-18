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

end
