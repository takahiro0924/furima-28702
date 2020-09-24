require 'rails_helper'

RSpec.describe BuyItemsInfo, type: :model do
  describe '#create' do
    before do
      @info = FactoryBot.build(:buy_items_info)
    end
    it 'postal_code、prefecture_id、city、address、building、phone_numberが存在すれば保存できる' do
      expect(@info).to be_valid
    end
    it 'buildingが空でも登録できる' do
      @info.building = ''
      expect(@info).to be_valid
    end
    it 'postal_codeが空だと登録できない' do
      @info.postal_code = ''
      @info.valid?
      expect(@info.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
    end
    it 'postal_codeに-を入れないと登録できない' do
      @info.postal_code = '1234567'
      @info.valid?
      expect(@info.errors.full_messages).to include("郵便番号は不正な値です")
    end
    it 'prefecture_idが0だと登録できない' do
      @info.prefecture_id = '0'
      @info.valid?
      expect(@info.errors.full_messages).to include("都道府県は0以外の値にしてください")
    end
    it 'cityが空だと登録できない' do
      @info.city = ''
      @info.valid?
      expect(@info.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressが空だと登録できない' do
      @info.address = ''
      @info.valid?
      expect(@info.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが空だと登録できない' do
      @info.phone_number = ''
      @info.valid?
      expect(@info.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
    end
    it 'phone_numberが全角だと登録できない' do
      @info.phone_number = '０８０１２３４５６７８'
      @info.valid?
      expect(@info.errors.full_messages).to include("電話番号は不正な値です")
    end
    it 'tokenが空だと登録できない' do
      @info.token = ''
      @info.valid?
      expect(@info.errors.full_messages).to include("カード情報を入力してください")
    end
  end
end
