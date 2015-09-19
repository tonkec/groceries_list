require 'spec_helper'

RSpec.describe "groceries/edit", type: :view do
  before(:each) do
    @grocery = assign(:grocery, Grocery.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit grocery form" do
    render

    assert_select "form[action=?][method=?]", grocery_path(@grocery), "post" do

      assert_select "input#grocery_title[name=?]", "grocery[title]"

      assert_select "textarea#grocery_description[name=?]", "grocery[description]"
    end
  end
end
