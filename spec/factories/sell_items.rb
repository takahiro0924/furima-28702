FactoryBot.define do
  factory :sell_item do
    name              {"掃除機"}
    explanation       {Faker::Lorem.sentence}
    category_id       {1}
    status_id         {1}
    delivery_fee_id   {1}
    area_id           {1}
    day_id            {1}
    price             {5000}
    association :user  
  end
end
