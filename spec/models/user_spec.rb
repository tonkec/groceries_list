require 'rails_helper'

describe User do
  before {@user = User.new(name: "Antonija", email: "antonija@gmail.com",
          password: "12345678", password_confirmation: "12345678")}
  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:password)}
  it {should respond_to(:authenticate)}

  it {should be_valid}

  describe "when name is not present" do
    before {subject.name = ""}
    it {should_not be_valid}
  end

  describe "when email is not present" do
    before {subject.email = ""}
    it {should_not be_valid}
  end

  describe "when password is not present" do
    before {subject.password = " "}
    it {should_not be_valid}
  end

  describe "when password is too short" do
    before {subject.password = "a" * 7}
    it {should_not be_valid}
  end

  describe "when password confirmation mismatch" do
    before do
      subject.password = "a"
      subject.password_confirmation = "b"
    end

    it {should_not be_valid}
  end

  describe "when email format is invalid" do
   it "it is invalid" do
     invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
     foo@bar_baz.com foo@bar+baz.com]
     invalid_addresses.each do |invalid_address|
      subject.email = invalid_address
      expect(subject).not_to be_valid
    end
   end
  end

  describe "when email format is valid" do
   it "it is valid" do
     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
     first.last@foo.jp alice+bob@baz.cn]
     valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid
    end
   end
  end

  describe "when email address is already taken" do
  
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid }
   
  end

  describe "return value of authenticate" do
    before {@user.save}
    let (:found_user) {User.find_by_email(@user.email)}

    describe "with valid psswd" do
      it {should eq found_user.authenticate(@user.password)}
    end

    describe "with invalid psswd" do
      it {should_not eq found_user.authenticate("wrong password")}
    end
  end
end
