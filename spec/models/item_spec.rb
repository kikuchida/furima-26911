require 'rails_helper'

# RSpec.describe Item, type: :model do
#   describe Item do
#     describe '#create' do
#新カリキュラムは上の書き方。旧は下の書き方
describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'is valid with a image, product, description, category_id, status_id, shipping_fee_id, prefecture_id, delivery_schedule_id, price, user_id' do #0
      # item = buile(:item) 10行目と同じ内容なので不要
      expect(@item).to be_valid
    end

    it '画像が必須であること' do #1
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    it '商品名が必須であること' do #2
      @item.product = ''
      @item.valid?
      expect(@item.errors[:product]).to include("can't be blank")
    end

    it '商品の説明が必須であること' do #3
      @item.description = ''
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do #4
      @item.category_id = ''
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'カテゴリーの選択が「--」の時は保存できないようにすること' do #5
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include('must be other than 1')
    end

    it '商品の状態についての情報が必須であること' do #6
      @item.status_id = ''
      @item.valid?
      expect(@item.errors[:status_id]).to include("can't be blank")
    end

    it '商品の選択が「--」の時は保存できないようにすること' do #7
      @item.status_id = 1
      @item.valid?
      expect(@item.errors[:status_id]).to include('must be other than 1')
    end

    it '配送料の負担についての情報が必須であること' do #8
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it '配送料の選択が「--」の時は保存できないようにすること' do #9
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors[:shipping_fee_id]).to include('must be other than 1')
    end

    it '発送元の地域についての情報が必須であること' do #10
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it '発送元の地域についての選択が「--」の時は保存できないようにすること' do #11
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include('must be other than 1')
    end

    it '発送までの日数についての情報が必須であること' do #12
      @item.delivery_schedule_id = ''
      @item.valid?
      expect(@item.errors[:delivery_schedule_id]).to include("can't be blank")
    end

    it '発送までの日数についての選択が「--」の時は保存できないようにすること' do #13
      @item.delivery_schedule_id = 1
      @item.valid?
      expect(@item.errors[:delivery_schedule_id]).to include('must be other than 1')
    end

    it '価格についての情報が必須であること' do #14
      @item.price = ''
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it '価格の範囲が¥300~¥9,999,999の間であること' do #15
      @item.price = 200
      @item.valid?
      expect(@item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it '販売価格は半角数字のみ保存可能であること' do #16
      @item.price = '１２３４５' #全角数字を入力
      @item.valid?
      expect(@item.errors[:price]).to include('is not a number')
    end

  end
end
