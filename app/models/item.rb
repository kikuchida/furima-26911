class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category # カテゴリーテーブルとのアソシエーション
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_schedule
  belongs_to :user
  has_one :record

  validates :image, :product, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, :price, presence: true

  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/, message: '価格は半角数字で入力して下さい' }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # numericalityは整数の場合(formatは文字列の場合)
end
