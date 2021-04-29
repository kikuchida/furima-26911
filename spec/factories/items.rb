FactoryBot.define do
  factory :item do
    product                    { 'あ' }
    description                { 'あ' }
    category_id                { 2 }
    status_id                  { 2 }
    shipping_fee_id            { 2 }
    prefecture_id              { 2 }
    delivery_schedule_id       { 2 }
    price                      { 10_000 }
    user
  end
end