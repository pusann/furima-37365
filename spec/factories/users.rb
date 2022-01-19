FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'3ie98n'}
    password_confirmation {password}
    first_name            {'太郎'}
    last_name             {'山田'}
    first_name_kana       {'タロウ'}
    last_name_kana        {'ヤマダ'}
    date_of_birth         {'2000-01-01'}
  end
end