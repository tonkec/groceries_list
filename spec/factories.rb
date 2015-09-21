require "faker"

FactoryGirl.define do
  factory :user do
    name "john"
    email "john@mail.com"
    password "password"
    password_confirmation "password"
  end

factory :grocery do
  title  { Faker::Name.title }
  description { Faker::Lorem.words(20) }
end
end