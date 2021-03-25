require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'is valid with a nickname, email, password, password_confirmation' do
      # user = build(:user)
      expect(@user).to be_valid
    end

    #   # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    #   it "is invalid without a password_confirmation" do
    #     user = build(:user, password_confirmation: "")
    #     user.valid?
    #     expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    #   end

    #   # 8. 重複したemailが存在する場合登録できないこと
    #   it "is invalid with a duplicate email address" do
    #     user = create(:user)
    #     another_user = build(:user, email: user.email)
    #     another_user.valid?
    #     expect(another_user.errors[:email]).to include("has already been taken")
    #   end

    it 'ニックネームが必須であること' do # 1
      @user.nickname = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'メールアドレスが必須であること' do # 2
      @user.email = ''
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'メールアドレスが一意性であること' do # 3
      @user = create(:user) # はじめにユーザーを登録
      another_user = build(:user, email: @user.email) # (:user)はfactoryのusers.rbを指定
      # ↑先に登録したユーザー(@user)と同じemailの値を持つanother_userのインスタンスを作成
      another_user.valid? # .valid?→異常系のテスト
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'メールアドレスは@を含むこと' do # 4
      @user.email = 'kkkgmail.com' # @を抜いたアドレスを作成
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'パスワードが必須であること' do # 5
      @user.password = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'パスワードは6文字以上であること' do # 6
      @user.password = '123a' # 6字以上にしてない
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合であること' do # 7
      @user.password = '111111' # 半角英字を入れない
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:password]).to include('パスワードは半角英数字混合で入力して下さい')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do # 8
      @user.password_confirmation = '' # password_confirmationを空にする
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'ユーザー本名が、名字と名前それぞれ必須であること' do # 9-1(名字)
      @user.last_name = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'ユーザー本名が、名字と名前それぞれ必須であること' do # 9-2(名前)
      @user.first_name = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'ユーザー本名は全角（漢字ひらがなカタカナ）で入力されていること' do # 10-1(名字)
      @user.last_name = 'abc' # 漢字ひらがなカタカナではない文字
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:last_name]).to include('は全角で入力してください。')
    end

    it 'ユーザー本名は全角（漢字ひらがなカタカナ）で入力されていること' do # 10-2(名前)
      @user.first_name = 'abc' # 漢字ひらがなカタカナではない文字
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:first_name]).to include('は全角で入力してください。')
    end

    it 'ユーザー本名のフリガナが、名字と名前それぞれ必須であること' do # 11-1(名字)
      @user.last_name_reading = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:last_name_reading]).to include("can't be blank")
    end

    it 'ユーザー本名のフリガナが、名字と名前それぞれ必須であること' do # 11-2(名前)
      @user.first_name_reading = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:first_name_reading]).to include("can't be blank")
    end

    it 'ユーザー本名のフリガナは全角カタカナで入力されていること' do # 12-1(名字)
      @user.last_name_reading = 'ひらがな' # カタカナじゃない文字
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:last_name_reading]).to include('は全角カタカナで入力して下さい。')
    end

    it 'ユーザー本名のフリガナは全角カタカナで入力されていること' do # 12-2(名前)
      @user.first_name_reading = 'ひらがな' # カタカナじゃない文字
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:first_name_reading]).to include('は全角カタカナで入力して下さい。')
    end

    it '生年月日が必須であること' do # 13
      @user.birthday = '' # ""又はnilでもよい
      @user.valid? # .valid?→異常系のテスト
      expect(@user.errors[:birthday]).to include("can't be blank")
    end
  end
end
