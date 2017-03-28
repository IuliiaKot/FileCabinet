require 'rails_helper'

describe User do

  it 'is invalid without a email' do
    user = User.new(email: "", password: "")
    expect(user).to be_invalid
  end
end
