require 'rails_helper'

RSpec.describe SellItem, type: :model do
  describe '#create' do
    before do
      @sell_item = FactoryBot.build(:sell_item)
      @sell_item.image = fixture_file_upload('public/P6010011-r.jpg')
    end
    it '商品名、商品の説明、カテゴリーの情報、商品の状態、配送料の負担、配送元の地域、配送までの日数、価格、画像があれば商品は保存される' do
      expect(@sell_item).to be_valid
    end
    it 'nameが空だと保存できない' do
      @sell_item.name = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("商品名を入力してください")
    end
    it 'explanationが空だと登録できない' do
      @sell_item.explanation = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'category_idが空だと登録できない' do
      @sell_item.category_id = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーは数値で入力してください")
    end
    it 'status_idが空だと登録できない' do
      @sell_item.status_id = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("商品の状態を入力してください", "商品の状態は数値で入力してください")
    end
    it 'delivery_feeが空だと登録できない' do
      @sell_item.delivery_fee_id = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("配送料の負担を入力してください", "配送料の負担は数値で入力してください")
    end
    it 'area_idが空だと登録できない' do
      @sell_item.area_id = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("配送元地域を入力してください", "配送元地域は数値で入力してください")
    end
    it 'day_idが空だと登録できない' do
      @sell_item.day_id = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("配送までの日数を入力してください", "配送までの日数は数値で入力してください")
    end
    it 'priceが空だと登録できない' do
      @sell_item.price = ''
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
    end
    it 'priceは300以下だと保存されない' do
      @sell_item.price = '100'
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("価格は300より大きい値にしてください")
    end
    it 'priceは9,999,999以上だと保存されない' do
      @sell_item.price = '10000000'
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("価格は9999999より小さい値にしてください")
    end
    it '半角英数300以外だと保存されない' do
      @sell_item.price = '５０００'
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("価格は数値で入力してください")
    end
    it 'imageは空だと登録できない' do
      @sell_item.image = nil
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("画像を入力してください")
    end
  end
end
