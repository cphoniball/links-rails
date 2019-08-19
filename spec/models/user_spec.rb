require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "has the expected attributes" do
    expect(user.username).to be_a(String)
    expect(user.email).to be_a(String)
  end
end
