require 'rails_helper'

RSpec.describe Api::V1::LinkController, type: :controller do

  def parse_response
    JSON.parse(response.body)
  end

  it "updates a link" do
    link = Link.create(title: "turing", url: "https://www.turing.io/", read: false)

    link_params = { read: true }

    put :update, id: link.id, read: true, format: :json

    link = Link.find(link.id)

    expect(response).to be_success
    expect(response.body).to eq("")

    expect(link.read?).to be true
  end

end
