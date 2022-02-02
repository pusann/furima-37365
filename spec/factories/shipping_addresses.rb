FactoryBot.define do
  factory :shipping_address do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    municipality {'横浜市'}
    address    {'1-1'}
    building_name  {''}
    telephone_number  {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
