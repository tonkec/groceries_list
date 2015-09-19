require 'spec_helper'

RSpec.describe "groceries/show", type: :view do
  before(:each) do
    @grocery = assign(:grocery, Grocery.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
