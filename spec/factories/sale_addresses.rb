FactoryBot.define do
  factory :sale_address do
    post_code { '123-1234' }
    prefecture_id { '2' }
    municipalities { '渋谷区渋谷' }
    street_address { '1-2-3' }
    building { 'ABCビル' }
    telephone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
