FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { 'abc123' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '裕之' }
    family_name_rubi      { 'タナカ' }
    first_name_rubi       { 'ヒロユキ' }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 60) }
  end
end
