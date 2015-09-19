require 'spec_helper'

RSpec.describe "groceries/new", type: :view do
  before(:each) do
    assign(:grocery, Grocery.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new grocery form" do
    render

    assert_select "form[action=?][method=?]", groceries_path, "post" do

      assert_select "input#grocery_title[name=?]", "grocery[title]"

      assert_select "textarea#grocery_description[name=?]", "grocery[description]"
    end
  end
end
