FactoryBot.define do
  factory :item do
    name {'商品名'}
    explanation {'説明文'}
    category_id { 2 }
    status_id { 2 }
    shopping_fee_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/sample.jpg')),
        filename: 'sample.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
