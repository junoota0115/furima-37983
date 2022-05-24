require 'rails_helper'

RSpec.describe OrderShippingAdd, type: :model do
  describe '購入情報の保存' do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_shipping_add = FactoryBot.build(:order_shipping_add,user_id: @user.id, item_id: @item.id)
    sleep 0.1 
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_shipping_add).to be_valid
    end
    it "建物名が空の場合でも保存できること" do
      @order_shipping_add.building = ''
      expect(@order_shipping_add).to be_valid
    end

    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_shipping_add.building = '1234567891'
      expect(@order_shipping_add).to be_valid
  end
end

  context '商品を購入できないとき' do
    it 'postal_code が空では登録できない' do
      @order_shipping_add.postal_code = ''
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_code が半角のハイフンを含まないと保存できない' do
      @order_shipping_add.postal_code = '123ー4567'
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Postal code 半角の(-)を入れてください")
    end

    it 'prefecture_idが 0 では保存できない' do
      @order_shipping_add.prefecture_id = 0
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'city が空では保存できない' do
      @order_shipping_add.city = ''
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("City can't be blank")
    end

    it 'address が空では保存できない' do
      @order_shipping_add.address = ''
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_number が空では保存できない' do
      @order_shipping_add.phone_number = ''
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Phone number 数字のみ正しく入力してください")
    end
    it 'phone_number 数字のみ9桁以下では保存できない' do
      @order_shipping_add.phone_number = '090111333'
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Phone number 数字のみ正しく入力してください")
    end
    it 'phone_number 数字のみ12桁以上では保存できない' do
      @order_shipping_add.phone_number = '0901111333322'
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Phone number 数字のみ正しく入力してください")
    end
    it 'phone_number に数字以外があると保存できないこと' do
      @order_shipping_add.phone_number = '123-1234-aa'
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Phone number 数字のみ正しく入力してください")
    end

    it "token が空では登録できないこと" do
      @order_shipping_add.token = nil
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Token can't be blank")
    end

    it "user_id が空では登録できないこと" do
      @order_shipping_add.user_id = nil
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("User can't be blank")
    end

    it "item_id が空では登録できないこと" do
      @order_shipping_add.item_id = nil
      @order_shipping_add.valid?
      expect(@order_shipping_add.errors.full_messages).to include("Item can't be blank")
end
end
end
end