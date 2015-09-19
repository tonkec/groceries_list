require 'rails_helper'

describe User do
  let!(:user) {User.create(name: "john", email: "john@mail.com", password: "foobarar", password_confirmation: "foobarar")}
  it "should be valid" do
    expect(user).to be_valid
  end

  it "should have name" do
    user.name = ""
    expect(user).not_to be_valid
  end

  it "has name with max length of 50 char" do
    user.name = "j"
    user.name *= 51
    expect(user).not_to be_valid
  end

  it "should have mail" do
    user.email = ""
    expect(user).not_to be_valid
  end

  it "should have valid format of email" do

   user.email = ""
   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
     first.last@foo.jp alice+bob@baz.cn]
     valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it "should not have invalid format of email" do
   user.email = ""
   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
     foo@bar_baz.com foo@bar+baz.com]
     invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to be_valid
    end
  end

  it "should have unique email" do
    other_user = user.dup
    other_user.save
    other_user.email = user.email.upcase
    expect(other_user).not_to be_valid
  end

  #it "should not have blank password" do
  #  user.password = ""
   #  puts "#{user.password} weeee"
   # expect(user).not_to be_valid
#  end

  it "should have password at least 8chr long" do
    user.password = "a"
    user.password *= 9
    expect(user).not_to be_valid
  end
end
