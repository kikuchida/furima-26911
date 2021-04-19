class RecordAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :record

  with_options presence: true do
    # recordsテーブルのバリデーション
    validates :user
    validates :item
    # addressesテーブルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" } # numericality（数値であること）
    validates :municipality
    validates :address
    validates :tel
    validates :record
  end

  def save
    # recordsの情報を保存
    Record.create(user_id: user_id, item_id: item_id)
    # addressesの情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
                    municipality: municipality, address: address, building: building, tel: tel, record: record)
  end

end