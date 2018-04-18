class Pub
  attr_reader :name, :till, :inventory

  def initialize(name, till, inventory)
    @name = name
    @till = till
    @inventory = inventory
    @MAX_DRUNKENESS = 20
    @MIN_AGE = 18
  end

  def check_drink(drink_name)
    for drink in @inventory
        return true if drink_name == drink.name
    end
    return false
  end

  def fetch_drink(drink_name)
    for drink in @inventory
      if drink_name == drink.name
        fetched_drink = drink
        @inventory.delete(drink)
        return fetched_drink
      end
    end
  end

  def get_price(drink_name)
    for drink in @inventory
        return drink.price if drink_name == drink.name
    end
  end

  def take_money(amount)
    @till += amount
  end
end
