FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000a"}
    password_confirmation {password}
    birthday              { 19_990_101 }
    gender_id              { 1 }
  end
end
