# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |n| "name#{n}" }

  factory :category do
    name
  end
end
