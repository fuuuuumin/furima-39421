FactoryBot.define do
  factory :item do
    name { 'testname' }
    description { 'testdescription' }
    price { '5000' }
    category_id             { '2' }
    condition_id            { '2' }
    postage_id { '2' }
    prefecture_id { '2' }
    shipment_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
