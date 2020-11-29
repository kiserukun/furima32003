require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context '出品が保存できる場合' do
      it '全て記入して保存される' do
        expect(@item).to be_valid
      end
    end

    context '出品内容が保存できない場合' do
      it 'カテゴリーが空だと保存できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank", 'Genre is not a number')
      end
      it '商品の状態が空だと保存できない' do
        @item.genre_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre status can't be blank", 'Genre status is not a number')
      end
      it '配送料の負担が空だと保存できない' do
        @item.genre_shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre shipping cost can't be blank", 'Genre shipping cost is not a number')
      end
      it '発送元の地域が空だと保存できない' do
        @item.genre_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre prefecture can't be blank", 'Genre prefecture is not a number')
      end
      it '発送までの日数が空だと保存できない' do
        @item.genre_shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre shipping day can't be blank", 'Genre shipping day is not a number')
      end
      it '価格が空だと保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end

    context '出品内容が保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが--だと保存できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 1')
      end
      it '商品の状態が--だと保存できない' do
        @item.genre_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre status must be other than 1')
      end
      it '配送料の負担が--だと保存できない' do
        @item.genre_shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre shipping cost must be other than 1')
      end
      it '発送元の地域が--だと保存できない' do
        @item.genre_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre prefecture must be other than 1')
      end
      it '発送までの日数が--だと保存できない' do
        @item.genre_shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre shipping day must be other than 1')
      end
      it '価格が300円以下だと保存できない' do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '価格が999999999円以上だと保存できない' do
        @item.selling_price = 9_999_999_991
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 999999999')
      end
      it '価格が全角数字だと保存できない' do
        @item.selling_price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end
