require 'rails_helper'


describe Doc do
  describe "validations fails" do
    it 'is invalid without a title' do
      doc = Doc.new(title: "", content: "hello")
      expect(doc).to be_invalid
    end
    it 'is invalid without a content' do
      doc = Doc.new(title: "DBC", content: "")
      expect(doc).to be_invalid
    end
  end

  describe "validations pass" do
    it 'is valid with a title and content' do
      user = User.create(email: "test@gmail.com", password: "123456")
      doc = Doc.new(title: "DBC", content: "RSpec", user_id: user.id)
      expect(doc).to be_valid
    end

  end

  describe "associations" do
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
      # expect(Doc.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
