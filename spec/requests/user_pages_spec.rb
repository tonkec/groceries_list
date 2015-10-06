require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  
  describe "sign up" do
    before {visit signup_path}
    it {should have_content("Sign up")}

    describe "with invalid info" do
      it "does not create a user" do
        expect {click_button("Submit")}.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Name",         with: "Antonija"
        fill_in "Email",        with: "antonija@example.com"
        fill_in "Password",     with: "12345678"
        fill_in "Password confirmation", with: "12345678"
      end

      it "creates a user and redirects to user's page" do
        expect {click_button("Submit")}.to change(User, :count).by(1)
        current_path.should  == "/"    
      end

      describe "after saving the user" do
        before {click_button("Submit")}
        let(:user) {User.find_by(email: "antonija@example.com")}
        it {should have_link("Log out")}
      end
    end
  end

  describe "login" do
    before {visit login_path}
    it {should have_content("Log in")}
    
    describe "with invalid info" do
     before {click_button "Log in"}
     it {should have_title("Log in")}
     it {should have_selector("div.alert.alert-danger")}

     describe "visiting another page" do
      before {visit signup_path}
      it {should_not have_selector("div.alert.alert-danger")}
     end 
   end

    describe "with valid info" do
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it {should have_title("Home")}
      it {should have_link("Log out", href: logout_path)}
      it {should_not have_link("Log in", href: login_path)}

    end
  end
end