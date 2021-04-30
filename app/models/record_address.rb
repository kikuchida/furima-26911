class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :record_id, :token
  # :tokenは、orders_controllerモデルにtokenという属性が存在しない。使用できるようにするために書く

  with_options presence: true do
    # recordsテーブルのバリデーション
    validates :user_id
    validates :item_id
    # addressesテーブルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } # numericality（数値であること）
    validates :municipality
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: '電話番号は数字のみで、10桁又は11桁以内であること' }
    validates :token
  end

  def save
    # recordsの情報を保存
    record = Record.create(user_id: user_id, item_id: item_id)
    # addressesの情報を保存
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    building: building, tel: tel, record_id: record.id)
  end
end
