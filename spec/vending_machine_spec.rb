require 'spec_helper'

describe VendingMachine do
  let(:machine) { VendingMachine.new }
  describe '#insert_coin' do
    context '１枚ずつコインを入れる場合' do
      it '複数枚コインを投入した場合、合計金額が一致すること' do
        machine.insert_coin(10, 50, 100, 500, 1000)
        expect(machine.total).to eq 1660
      end
    end
    context '複数枚同時に入れる場合' do
      it '複数枚コインを投入した場合、合計金額が一致すること' do
        [10, 50, 100, 500, 1000].each do |amount|
          machine.insert_coin(amount)
        end
        expect(machine.total).to eq 1660
      end
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
    it '初期状態の場合、コーラが５つ格納されていること' do
       expect(machine.stock).to eq cola: 5
    end
  end

  describe '#buyable?' do
    describe '金額が足りているか確認' do
      it '数量が足りている場合、コーラが１つ買えること' do
        machine.insert_coin(100, 10, 10)
        expect(machine.buyable?(:cola, 1)).to eq true
      end
      it '数量が足りていない場合、コーラが１つ買えないこと' do
        machine.insert_coin(100, 10)
        expect(machine.buyable?(:cola, 1)).to eq false
      end
      it '数量が足りている場合、コーラが２つ買えること' do
        machine.insert_coin(100, 100, 10, 10, 10, 10)
        expect(machine.buyable?(:cola, 2)).to eq true
      end
      it '数量が足りていない場合、コーラが２つ買えないこと' do
        machine.insert_coin(100, 100, 10, 10, 10)
        expect(machine.buyable?(:cola, 2)).to eq false
      end
    end
    describe '数量が足りているか確認' do
      it '数量が足りている場合、コーラが買えること' do
        machine.insert_coin(100, 100, 100, 100, 100, 100)
        expect(machine.buyable?(:cola, 5)).to eq true
      end
      it '数量が足りていない場合、コーラが買えないこと' do
        machine.insert_coin(100, 100, 100, 100, 100, 100, 100, 10, 10)
        expect(machine.buyable?(:cola, 6)).to eq false
      end
    end
  end
end

