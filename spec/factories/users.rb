FactoryBot.define do
  factory :user do
    nickname              { 'テスト用ユーザー' }
    email                 { Faker::Internet.free_email }
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name           { '佐藤' }
    second_name            { '太郎' }
    first_name_kana      { 'サトウ' }
    second_name_kana        { 'タロウ' }
    birthday              { '1970-01-01' }
  end
end