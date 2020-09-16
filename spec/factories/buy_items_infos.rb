FactoryBot.define do
  factory :buy_items_info do
    postal_code            { '123-4567' }
    prefecture_id          { 1 }
    city                   { '東京都' }
    address                { '武蔵野市' }
    building               { 'あいうえお' }
    phone_number           { '08012345678' }
    token                  {'abc'}
  end
end
