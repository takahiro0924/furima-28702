FactoryBot.define do
  factory :user do
    nick_name             {"たかひろ"}
    email                 {Faker::Internet.free_email}
    password              {"Takahiro0924"}
    password_confirmation {password}
    first_furigana        {"タカヒロ"}
    family_furigana       {"ネモト"}
    birthday              {Faker::Date.birthday.strftime('%y%m%d')}
    first_name            {"昂宏"}
    family_name           {"根本"}
    
  end

end