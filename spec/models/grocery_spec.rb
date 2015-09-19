require 'rails_helper'

describe Grocery do
  it "is valid with a title and description" do
    grocery = Grocery.new(
      title: "Milk",
      description: "description")
    expect(grocery).to be_valid
  end

  it "is invalid without a title" do
     grocery = Grocery.new(
      title: "",
      description: "description")
     expect(grocery).not_to be_valid
  end
  
  it "is invalid without a description" do
    grocery = Grocery.new(
      title: "as",
      description: "")
    expect(grocery).not_to be_valid
  end
end