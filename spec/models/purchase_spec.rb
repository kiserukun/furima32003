require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入の保存' do
    context '購入が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
    end

  context 'うまくいかないとき' do
      it 'postal_codeが空だと保存できない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.postal_code = 1234567
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it 'genre_prefecture_idが--では保存できないこと' do
          @purchase.genre_prefecture_id = 1
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Genre prefecture must be other than 1")
      end
      it 'cityが空では保存できないこと' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
      it 'house_numberが空では保存できないこと' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
      it 'phone_numberが空では保存できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
      it 'phone_numberが11桁以下では保存できないこと' do
        @purchase.phone_number = 222
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
      it 'phone_numberが12桁以上では保存できないこと' do
        @purchase.phone_number = 222222222222
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
      it 'phone_numberが数字以外が入ると保存できないこと' do
        @purchase.phone_number = "2222222222e"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    end
  end
end
