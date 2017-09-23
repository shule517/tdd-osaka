class VendingMachine
  attr_reader :total

  def initialize
    @total = 0
    @stock = Stock.new
    @prices = { cola: 120 }
  end

  def insert_coin(*coins)
    coins.each do |amount|
      @total += amount if enable_coin?(amount)
    end
  end

  def stock
    @stock.juices
  end

  def enable_coin?(amount)
    [10, 50, 100, 500, 1000].include?(amount)
  end

  def buyable?(name, quantity)
    buy_amount(name, quantity) <= @total && @stock.buyable?(name, quantity)
  end

  def buy_amount(name, quantity)
    @prices[name] * quantity
  end
end

