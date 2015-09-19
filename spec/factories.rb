require "faker"

FactoryGirl.define do  factory :user do
    name "MyString"
email "MyString"
  end

  factory :grocery do
    title  { Faker::Name.title }
    description { Faker::Lorem.words(20) }
  end
end