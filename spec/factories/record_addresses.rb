FactoryBot.define do
  factory :record_address do
    item_id        { 1 }
    user_id        { 1 }
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipality   { '市区町村' }
    address        { '番地' }
    building       { 'ビル名' }
    tel            { '09012345678' }
    record_id      { 1 }
  end
end
