class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '北海道' },
    { id: 3, name: '東京' },
    { id: 4, name: '愛知' },
    { id: 5, name: '大阪'},
    { id: 6, name: '沖縄'}
  ]

  include ActiveHash::Associations
  has_many :items
  
  end