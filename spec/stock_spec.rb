require 'spec_helper'

describe Stock do
  let(:stock) { Stock.new }
  describe '#stock' do
    it '初期状態の場合、コーラが格納されていること' do
      expect(stock.juices).to eq cola: 5
    end
  end
  describe '#buyable?' do
    it '数量が足りている場合、買えること' do
      expect(stock.buyable?(:cola, 1)).to eq true
      expect(stock.buyable?(:cola, 5)).to eq true
    end
    it '数量が足りていない場合、買えないこと' do
      expect(stock.buyable?(:cola, 6)).to eq false
    end
  end
end

