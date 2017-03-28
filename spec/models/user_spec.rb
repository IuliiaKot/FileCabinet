require 'rails_helper'

describe User do

  describe "validations fails" do
    it 'is invalid without a email' do
      user = User.new(email: "", password: "")
      expect(user).to be_invalid
    end
    it 'is invalid without a password' do
      user = User.new(email: "", password: "")
      expect(user).to be_invalid
    end

    it 'is invalid when password less than 6' do
      user = User.new(email: "test@gmail.com", password: "1")
      expect(user).to be_invalid
    end
  end

  describe "validations pass" do
    it 'is valid with valid attributes' do
      user = User.new(email: "test@gmail.com", password: "123456")
      expect(user).to be_valid
    end
  end

  describe "associations" do
    it "has many docs" do
      assc = described_class.reflect_on_association(:docs)
      expect(assc.macro).to eq :has_many
    end
  end
end
