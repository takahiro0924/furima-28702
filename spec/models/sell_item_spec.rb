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
      it'nameが空だと保存できない'do
      @sell_item.name = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Name can't be blank")
      end
      it'explanationが空だと登録できない'do
      @sell_item.explanation = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Explanation can't be blank")
      end
      it'category_idが空だと登録できない'do
      @sell_item.category_id = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
       end
      it'status_idが空だと登録できない'do
      @sell_item.status_id = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Status can't be blank",  "Status is not a number")
      end
      it'delivery_feeが空だと登録できない'do
      @sell_item.delivery_fee_id = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end
      it'area_idが空だと登録できない'do
      @sell_item.area_id = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it'day_idが空だと登録できない'do
      @sell_item.day_id = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end
      it'priceが空だと登録できない'do
      @sell_item.price = ""
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it'priceは半角英数300~9,999,999でないと保存されない'do
      @sell_item.price = "100"
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Price must be greater than 300")
      @sell_item.price = "５０００"
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Price is not a number")
      end
      it'imageは空だと登録できない'do
      @sell_item.image = nil
      @sell_item.valid?
      expect(@sell_item.errors.full_messages).to include("Image can't be blank")
      end
 end
end