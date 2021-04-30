FactoryBot.define do
  factory :record_address do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipality   { '市区町村' }
    address        { '番地' }
    building       { 'ビル名' }
    tel            { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
