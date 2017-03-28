require 'rails_helper'

describe User do

  it 'is invalid without a email' do
    user = User.new(email: "test@gmail.com", password: "nil66666")
    expect(user).to be_invalid
  end
end
