FactoryBot.define do

  factory :user do
    id                    {1}
    nickname              {"アイウエオカキクケコサシスセソ"}
    email                 {"test@gmail.com"}
    password              {"000000"}
    password_confirmation {"000000"}
  end

end