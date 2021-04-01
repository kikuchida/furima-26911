class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category #カテゴリーテーブルとのアソシエーション
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_schedule

  #空の投稿を保存できないようにする
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, numericality: { other_than: 1 } 

end
