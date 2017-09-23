class VendingMachine
  attr_reader :total

  def initialize
    @total = 0
  end

  # vimの人きたああああ
  def insert_coin(amount)
   @total += amount if enable_coin?(amount)
  end

  def enable_coin?(amount)
    [10, 50, 100, 500, 1000].include?(amount)
  end
end

