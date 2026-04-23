require 'rails_helper'

RSpec.describe "Events", type: :request do
  let!(:event) { Event.create!(title: "Test", start_date: Time.now) }

  it "loads events index" do
    get "/"
    expect(response).to have_http_status(:ok)
  end

  it "blocks voting without user" do
    post "/events/#{event.id}/upvote"
    expect(response).to redirect_to(root_path)
  end
end