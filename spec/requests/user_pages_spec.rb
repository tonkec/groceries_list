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
    
      it "does not log in user" do
        get login_path
        expect(response).to render_template("sessions/new")
        expect(response).to have_http_status(200)
        post login_path, :session => {:email => "",
                                :password => ""}
        expect(response).to render_template("sessions/new")
        expect(flash[:danger]).to be_present
        get login_path
        expect(flash[:danger]).not_to be_present
      end

      it "logs in user" do
        get login_path
        expect(response).to render_template("sessions/new")
        expect(response).to have_http_status(200)
        post login_path, :session => {:email => user.email,
                                :password => user.password}
        expect(response).to redirect_to(root_url)
        follow_redirect!
        expect(response).to render_template(:home)
      end
    end
  end
