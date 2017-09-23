require 'spec_helper'

describe VendingMachine do
  let(:machine) { VendingMachine.new }
  describe '#insert_coin' do
    it '10円玉が投入できること' do
      machine.insert_coin(10)
      expect(machine.total).to eq 10
    end
    it '複数枚コインを投入した場合、合計金額が一致すること' do
      machine.insert_coin(10, 50, 100, 500, 1000)
      expect(machine.total).to eq 1660
    end
    it '複数枚コインを投入した場合、合計金額が一致すること' do
      [10, 50, 100, 500, 1000].each do |amount|
        machine.insert_coin(amount)
      end
      expect(machine.total).to eq 1660
    end
    describe '扱えるお金の判定' do
      [10, 50, 100, 500, 1000].each do |amount|
        context "#{amount}円玉の場合" do
          it '扱えるお金は合計金額に加算されること' do
            machine.insert_coin(amount)
            expect(machine.total).to eq amount
          end
        end
      end
      [1, 5, 2000, 10000, 2, -1].each do |amount|
        context "#{amount}円玉の場合" do
          it '扱えないお金は返却すること' do
            machine.insert_coin(amount)
            expect(machine.total).to eq 0
          end
        end
      end
    end
  end

  describe '#stock' do
    it '初期状態の場合、コーラが格納されている' do
       expect(machine.stock).to eq name: 'コーラ', price: 120, quantity: 5
    end
  end

#  describe 'buyable?' do
#    it '' do
#      machine.insert_coin(100)
#    end
#  end
end

