FactoryBot.define do

  factory :post do
    title              {Faker::Lorem.sentence}
    content            {"カキクケコ"}
    user
    created_at         { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end