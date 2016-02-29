require 'rails_helper'

RSpec.describe User, type: :model do

  describe "user registration" do
    it "must have a unique email address" do
      User.create(email: "hi@email.com", password: "pw")

      user = User.new(email: "hi@email.com", password: "lol")

      expect(user.save).to be false
    end
  end

end
