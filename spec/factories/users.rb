FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birthday              {'1935-07-08'}
  end
end

