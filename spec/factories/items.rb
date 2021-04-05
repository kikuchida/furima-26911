FactoryBot.define do
  factory :item do
    product                    {'あ'}
    description                {'あ'}
    category_id                {2}
    status_id                  {2}
    shipping_fee_id            {2}
    prefecture_id              {2}
    delivery_schedule_id       {2}
    price                      {10000}
    user
  end
end

#参考
# FactoryBot.define do
#   factory :user do
#     nickname              { 'abe' }
#     email                 { Faker::Internet.email }
#     password              { '00000000a' }
#     password_confirmation { '00000000a' }
#     last_name { '漢字かなカナ' }
#     first_name { '漢字かなカナ' }
#     last_name_reading { 'カナ' }
#     first_name_reading { 'カナ' }
#     birthday { 20_001_231 }
#   end
# end
