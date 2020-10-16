FactoryBot.define do

  factory :user do
    nickname              {"テスト"}
    email                 {"test@gmail.com"}
    password              {"000000"}
    password_confirmation {"00000000"}
  end

end