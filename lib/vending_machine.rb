class VendingMachine
  attr_reader :total, :stock

  def initialize
    @total = 0
    @stock = { cola: { price: 120, quantity: 5 } }
  end

  def insert_coin(*coins)
    coins.each do |amount|
      @total += amount if enable_coin?(amount)
    end
  end

  def enable_coin?(amount)
    [10, 50, 100, 500, 1000].include?(amount)
  end

  def buyable?(name, quantity)
    juice = stock[name]
    juice[:price] * quantity <= @total && juice[:quantity] >= quantity
  end
end

