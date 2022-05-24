FactoryBot.define do
  factory :order_shipping_add do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '新潟市' }
    address { '1-1' }
    building { '' }
    phone_number { '09077773333' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
