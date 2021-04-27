require 'rails_helper'
# 旧カリキュラムの書き方
describe RecordAddress do
  describe '#create' do
    before do
      @record_address = FactoryBot.build(:record_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do # 1
      expect(@record_address).to be_valid
    end

    it '郵便番号が必須であること' do # 2
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors[:postal_code]).to include("can't be blank")
    end

    it '都道府県が必須であること' do # 3
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors[:prefecture_id]).to include("can't be blank")
    end

    it '市区町村が必須であること' do # 4
      @record_address.municipality = ''
      @record_address.valid?
      expect(@record_address.errors[:municipality]).to include("can't be blank")
    end

    it '番地が必須であること' do # 5
      @record_address.address = ''
      @record_address.valid?
      expect(@record_address.errors[:address]).to include("can't be blank")
    end

    it '電話番号が必須であること' do # 6
      @record_address.tel = ''
      @record_address.valid?
      expect(@record_address.errors[:tel]).to include("can't be blank")
    end

    it '郵便番号にはハイフンが必須であること' do # 7
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors[:postal_code]).to include('is invalid. Include hyphen(-)')
    end

    it '電話番号にはハイフンは不要で、11桁以内であること' do # 8
      @record_address.tel = '123456789012345'
      @record_address.valid?
      expect(@record_address.errors[:tel]).to include('電話番号にはハイフンは不要で、11桁以内であること')
    end

    it 'tokenが空では登録できないこと' do
      @record_address.token = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
