require 'rails_helper'

RSpec.describe Link, type: :model do
  it "must have a valid url" do
    invalid_link = Link.new(title: "hi", url: "badurl")
    valid_link = Link.new(title: "hi", url: "https://www.turing.io/")

    expect(invalid_link.save).to be false
    expect(valid_link.save).to be true
  end
end
