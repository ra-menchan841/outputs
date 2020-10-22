FactoryBot.define do

  factory :user do
    nickname              {"アイウエオカキクケコサシスセソ"}
    sequence(:email)      {Faker::Internet.email}
    password              {"000000"}
    password_confirmation {"000000"}
  end

end