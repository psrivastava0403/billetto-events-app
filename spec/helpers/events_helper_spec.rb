require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  let(:event) { Event.create!(title: "Test", start_date: Time.now) }

  it "returns vote count" do
    VoteService.upvote(event.id, "user-1")

    count = helper.vote_count(event)

    expect(count).to eq(1)
  end
end