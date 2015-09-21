require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  describe "GET /login_path" do
    it "should not log in user" do
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

    it "should log in user" do
      get login_path
      expect(response).to render_template("sessions/new")
      expect(response).to have_http_status(200)
      post login_path, :session => {:email => user.email,
                              :password => user.password}
      expect(response).to redirect_to(user)
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end
end
