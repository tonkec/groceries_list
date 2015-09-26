require "faker"

FactoryGirl.define do
  factory :user do
    name "john"
    email "john@mail.com"
    password "password"
    password_confirmation "password"
  end

  factory :grocery do
    title "Lorem ipsum"
    description "Lorem ipsum dolor amit"
    user 
  end
end