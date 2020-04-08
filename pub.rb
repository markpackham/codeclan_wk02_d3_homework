class Pub
  attr_accessor :name, :till
  attr_reader :stock, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = []
    @stock = []
  end

  def increase_till_amount(amount)
    @till += amount
  end

  def add_drinks(drink)
    @drinks << drink
  end

  def serve_customer(drunk_level)
    if drunk_level < 10
      return true
    else
      return false
    end
  end

  def add_drinks_to_stock(drinks)
    for drin in drinks
      @stock << drin
    end
  end
end
