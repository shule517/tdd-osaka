class Stock
  attr_reader :juices

  def initialize
    @juices = { cola: 5 }
  end

  def buyable?(name, quantity)
    @juices[name] >= quantity
  end
end

