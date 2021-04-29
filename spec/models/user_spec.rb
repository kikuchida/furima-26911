require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'is valid with a nickname, email, password, password_confirmation' do
      # user = build(:user) 6行目と同じ内容なので不要
      expect(@user).to be_valid
    end

    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user = create(:user) # はじめにユーザーを登録
      another_user = build(:user, email: @user.email) # (:user)はfactoryのusers.rbを指定
      # ↑先に登録したユーザー(@user)と同じemailの値を持つanother_userのインスタンスを作成
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'メールアドレスは@を含むこと' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'パスワードは6文字以上であること' do
      @user.password = '123a'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合であること' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('パスワードは半角英数字混合で入力して下さい')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'ユーザー本名が、名字と名前それぞれ必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'ユーザー本名が、名字と名前それぞれ必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'ユーザー本名は全角（漢字ひらがなカタカナ）で入力されていること' do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors[:last_name]).to include('は全角で入力してください。')
    end

    it 'ユーザー本名は全角（漢字ひらがなカタカナ）で入力されていること' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors[:first_name]).to include('は全角で入力してください。')
    end

    it 'ユーザー本名のフリガナが、名字と名前それぞれ必須であること' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors[:last_name_reading]).to include("can't be blank")
    end

    it 'ユーザー本名のフリガナが、名字と名前それぞれ必須であること' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors[:first_name_reading]).to include("can't be blank")
    end

    it 'ユーザー本名のフリガナは全角カタカナで入力されていること' do 
      @user.last_name_reading = 'ひらがな'
      @user.valid?
      expect(@user.errors[:last_name_reading]).to include('は全角カタカナで入力して下さい。')
    end

    it 'ユーザー本名のフリガナは全角カタカナで入力されていること' do 
      @user.first_name_reading = 'ひらがな'
      @user.valid?
      expect(@user.errors[:first_name_reading]).to include('は全角カタカナで入力して下さい。')
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do 
      @user.password = '11111a'
      @user.password_confirmation = '1111aa'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'パスワードは半角英語のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('パスワードは半角英数字混合で入力して下さい')
    end

    it 'パスワードは全角では登録できないこと' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors[:password]).to include('パスワードは半角英数字混合で入力して下さい')
    end

    it 'フリガナは半角文字だと登録できないこと' do
      @user.last_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:last_name]).to include('は全角で入力してください。')
    end

    it 'フリガナは半角文字だと登録できないこと' do
      @user.first_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:first_name]).to include('は全角で入力してください。')
    end
  end
end
