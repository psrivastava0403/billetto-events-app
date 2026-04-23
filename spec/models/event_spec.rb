require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with valid attributes" do
    event = Event.new(
      title: "Test Event",
      description: "Test desc",
      start_date: Time.now
    )
    expect(event).to be_valid
  end

  it "is invalid without title" do
    event = Event.new(title: nil)
    expect(event).not_to be_valid
  end

  it "is invalid without start_date" do
    event = Event.new(start_date: nil)
    expect(event).not_to be_valid
  end
end