FactoryBot.define do
  factory :item do
    product_name                   {'テスト'}
    product_description            {'説明'}
    category_id                    {'1'}
    product_condition_id           {'1'}
    burden_of_shipping_charges_id  {'1'}
    shipping_area_id               {'1'}
    days_to_ship_id                {'1'}
    selling_price                  {'2000'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
