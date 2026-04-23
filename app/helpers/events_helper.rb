module EventsHelper
  def vote_count(event)
    events = Rails.configuration.event_store
              .read
              .stream("Event$#{event.id}")
              .to_a   

    upvotes = events.select { |e| e.event_type == "EventUpvoted" }.count
    downvotes = events.select { |e| e.event_type == "EventDownvoted" }.count

    upvotes - downvotes
  end
end