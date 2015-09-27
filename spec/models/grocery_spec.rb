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

  it {should be_valid}

  it "is invalid without a title or description" do
      @grocery.title = @grocery.description = ""
      expect(subject).not_to be_valid
  end 
end