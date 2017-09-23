require 'spec_helper'

# tmaxって画面分割のこと？画面分割すると 分割した先の画面がScreenXTVにのらなくて つらい
# ちがうのか
# おお！ 最高！！ vim初心者です むずかしい いつもはVSCode使ってます

describe VendingMachine do
  let(:machine) { VendingMachine.new }
  describe '#insert_coin' do
    it '10円玉が投入できること' do
      machine.insert_coin(10)
      expect(machine.total).to eq 10
    end
  end
end

# まずはこんな感じかな？
# コメントで会話していこう

