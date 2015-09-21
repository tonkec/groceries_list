require "rails_helper"

RSpec.describe "Users signup", :type => :request do

  it "creates a user and redirects to the users's page" do
    get "/users/new"
    #puts "#{User.count}"
    expect(response).to render_template(:new)

    post "/users", :user => {:name => "john",
                             :email => "john@mail.com",
                             :password => "password",
                             :password_confirmation => "password"}
                             # puts "#{User.count}"
    #expect{User.count}.to change{User.count}.by(1)
    expect(response).to redirect_to(assigns(:user))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Welcome")
    
  end

  it "does not create a user and renders new again" do
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users", :user => {:name => "john",
                             :email => "",
                             :password => "",
                             :password_confirmation => ""}
    expect{User.count}.to change{User.count}.by(0)
    expect(response).to render_template(:new)
  end

end