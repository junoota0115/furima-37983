require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '出品できるとき' do
    it 'item_name、content、category、item_status、postage、prefecture、send_day、priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end

  end
  
  context '新規登録できないとき' do
    it 'ユーザー登録している人でないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("User must exist")
    end

  it 'item_nameが空だと登録できない' do
      @item.item_name = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

  it 'contentが空では登録できない' do
      @item.content = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include("Content can't be blank")
  end

  it 'category_idが0では登録できない' do
    @item.category_id,numericality = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

    it 'item_statusが空では登録できない' do
      @item.item_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end

    it 'postage_idが空では登録できない' do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end


    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'send_day_id が空では登録できない' do
      @item.send_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Send day can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '価格が半角数字でないと登録できない' do
      @item.price =  "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'imageが空だと登録できない' do
      @item.image = nil  
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")

  end
end
end
end