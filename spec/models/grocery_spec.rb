require 'rails_helper'

describe Grocery do
  let!(:user) { FactoryGirl.create(:user)}

  before do
    @grocery = user.groceries.build(title: "title", description: "description")
  end

  subject {@grocery}

  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  it {should respond_to(:amount)}
  it {should respond_to(:price)}
  it {should respond_to(:checked)}

  it {should be_valid}

  it "is invalid without a title" do
    subject.title = ""
    expect(subject).not_to be_valid
  end 

  it "is invalid without a user's id" do
    subject.user_id = ""
    expect(subject).not_to be_valid
  end

  it "has description with less than 250chr" do
    subject.description = "a" * 251
    expect(subject).not_to be_valid
  end 
end