FactoryBot.define do
  factory :thing do
    name              {"私のお気に入り"}
    explanation       {"あいうえお"}
    price             {12345}
    score             {100}
    date              { 19_990_101 }
    association :user
  end
end
