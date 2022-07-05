require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    User.new(
      first_name: "ftest",
      last_name: "ltest",
      email: "test@test.com",
      password: "12345",
      password_confirmation: "12345"
    )
  end

  before { subject.save }

  describe "Valudations" do
    context "Create User" do
      it "is valid with no empty field" do
        expect(subject).to be_valid
      end

      it "is valid when password same as password_confirmation" do
        expect(subject.password_confirmation).to eq(subject.password)
      end

      it "is invalid when password different as password_confirmation" do
        subject.password = "12399"
        expect(subject.password_confirmation).not_to eq(subject.password)
      end

      it "is invalid when first name is empty" do
        subject.first_name = nil
        expect(subject).not_to be_valid
      end

      it "is invalid when last name is empty" do
        subject.last_name = nil
        expect(subject).not_to be_valid
      end

      it "cannot save with same email" do
        newSubject =
          User.new(
            first_name: "ftest",
            last_name: "ltest",
            email: "test@test.com",
            password: "12345",
            password_confirmation: "12345"
          )
        expect(newSubject).not_to be_valid
      end

      it "password cannot be less than 3 char" do
        subject.password = "12"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".authenticate_with_credentials" do
    it "return user" do
      loginEmail = "   test@Test.com   "
      longinPass = "12345"
      checkedUser = User.authenticate_with_credentials(loginEmail, longinPass)
      expect(checkedUser).should_not be_nil
    end
  end
end
