class VendingMachine
  attr_reader :total

  def initialize
    @total = 0
  end

  # vimの人きたああああ
  def insert_coin(amount)
    @total += amount
  end

  # やばい こないだまでjs書いてたら 変なくせがのこってる
end

