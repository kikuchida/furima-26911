require 'rails_helper'
# 旧カリキュラムの書き方
describe RecordAddress do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    it 'すべての値が正しく入力されていて、且つ建物名は空でも保存できること' do
      expect(@record_address).to be_valid
    end

    it '郵便番号が必須であること' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors[:postal_code]).to include("can't be blank")
    end

    it '都道府県が必須であること' do
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'prefecture_idがnilだった場合保存できないこと' do
      @record_address.prefecture_id = nil
      @record_address.valid?
      expect(@record_address.errors[:prefecture_id]).to include("can't be blank")
    end

    it '市区町村が必須であること' do
      @record_address.municipality = ''
      @record_address.valid?
      expect(@record_address.errors[:municipality]).to include("can't be blank")
    end

    it '番地が必須であること' do
      @record_address.address = ''
      @record_address.valid?
      expect(@record_address.errors[:address]).to include("can't be blank")
    end

    it '電話番号が必須であること' do
      @record_address.tel = ''
      @record_address.valid?
      expect(@record_address.errors[:tel]).to include("can't be blank")
    end

    it '郵便番号にはハイフンが必須であること' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors[:postal_code]).to include('is invalid. Include hyphen(-)')
    end

    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @record_address.tel = '123456789012345'
      @record_address.valid?
      expect(@record_address.errors[:tel]).to include('電話番号にはハイフンは不要で、11桁以内であること')
    end

    it 'tokenが空では登録できないこと' do
      @record_address.token = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空の場合は保存できないこと' do
      @record_address.user_id = ''
      @record_address.valid?
      expect(@record_address.errors[:user_id]).to include("can't be blank")
    end

    it 'item_idが空の場合は保存できないこと' do
      @record_address.item_id = ''
      @record_address.valid?
      expect(@record_address.errors[:item_id]).to include("can't be blank")
    end
  end
end
