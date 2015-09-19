require "faker"

FactoryGirl.define do
  factory :grocery do
    title  { Faker::Name.title }
    description { Faker::Lorem.words(20) }
  end
end