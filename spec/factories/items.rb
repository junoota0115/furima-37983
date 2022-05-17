FactoryBot.define do
factory :item do
  
  item_name             {"hoge"}
  content             {1}
  category_id     {1}
  item_status_id  {1}
  postage_id          {13}
  prefecture_id {1}
  send_day_id     {1}
  price            {"9999"}
  
  association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end