require 'rails_helper'

RSpec.describe VoteService do
  let(:event) { Event.create!(title: "Test", start_date: Time.now) }
  let(:user_id) { "user-1" }

  it "creates an upvote event" do
    VoteService.upvote(event.id, user_id)

    events = Rails.configuration.event_store
                .read
                .stream("Event$#{event.id}")
                .to_a

    expect(events.count).to eq(1)
    expect(events.first.event_type).to eq("EventUpvoted")
  end

  it "prevents duplicate votes from same user" do
    VoteService.upvote(event.id, user_id)
    VoteService.upvote(event.id, user_id)

    events = Rails.configuration.event_store
                .read
                .stream("Event$#{event.id}")
                .to_a

    expect(events.count).to eq(1)
  end

  it "counts upvotes correctly" do
    VoteService.upvote(event.id, "user-1")
    VoteService.upvote(event.id, "user-2")

    events = Rails.configuration.event_store
                .read
                .stream("Event$#{event.id}")
                .to_a

    upvotes = events.count { |e| e.event_type == "EventUpvoted" }

    expect(upvotes).to eq(2)
  end
end