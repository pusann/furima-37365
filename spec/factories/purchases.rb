FactoryBot.define do
  factory :purchase do
    post_code { '123-4567' }
    prefectures { 1 }
    municipality {'横浜市'}
    address    {'1-1'}
    building_name  {'横ハイツ'}
    telephone_number  {'09012345678'}
  end
end
