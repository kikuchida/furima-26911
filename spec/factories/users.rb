FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000a' }
    password_confirmation { '00000000a' }
    last_name { '漢字かなカナ' }
    first_name { '漢字かなカナ' }
    last_name_reading { 'カナ' }
    first_name_reading { 'カナ' }
    birthday { 20_001_231 }
  end
end
