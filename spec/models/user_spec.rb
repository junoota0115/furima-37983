require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'nickname、email、password、password_confirmation、first_name、second_name、
    first_name_kana、second_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = '890iop'
      @user.password_confirmation = '890iop'
      expect(@user).to be_valid
    end
  end
  
  context '新規登録できないとき' do
  it 'nicknameが空だと登録できない' do
      @user.nickname = ''  
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できない' do
      @user.email = ''  
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
   it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは英数字混合でないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end


    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角文字でなければ登録できない' do
      @user.first_name_kana = 'ﾎｹﾞﾎｹﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
    end

    it 'second_nameが空では登録できない' do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank")
    end
    it 'second_name_kanaが空では登録できない' do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank")
    end

    it 'second_nameが半角では登録できない' do
      @user.second_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name 全角文字を使用してください")
    end

    it 'second_name_kanaが全角文字でなければ登録できない' do
      @user.second_name_kana = 'ﾎｹﾞﾎｹﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Second name kana 全角カナを使用してください')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
end
end
end

