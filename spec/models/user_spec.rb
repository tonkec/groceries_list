require 'rails_helper'

describe User do
 
 it "should be valid" do
  user = User.new(name: "John", email: "john@mail.com")
  expect(user).to be_valid
 end

 it "should have name" do
  user = User.new(name: "", email: "john@mail.com")
  expect(user).not_to be_valid
 end

 it "has name with max length of 50 char" do
  user = User.new(name: "j", email: "john@mail.com")
  user.name *= 51
  expect(user).not_to be_valid
  end
end
