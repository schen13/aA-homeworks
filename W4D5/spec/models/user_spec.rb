require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
    email: "example@example.com",
    password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest )}
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#reset_session_token!" do
    it "generates a new session token" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      # Miniscule chance this will fail.
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "saves the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "confirms that a password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "confirms that a non-password is incorrect" do
      expect(user.is_password?("not_a_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user when given correct username and password" do
      expect(User.find_by_credentials("example@example.com", "password")).to eq(user)
    end

    it "returns nil when given a wrong password" do
      expect(User.find_by_credentials("example@example.com", "not_a_password")).to eq(nil)
    end

    it "returns nil when given a wrong username" do
      expect(User.find_by_credentials("hi@hi.com", "password")).to eq(nil)
    end
  end
end
