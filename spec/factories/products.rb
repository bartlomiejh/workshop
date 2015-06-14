FactoryGirl.define do
  sequence(:title) { |n| "title#{n}" }

  factory :product do
    title
    description "MyText"
    price 1.5
    user
    category
  end
end
