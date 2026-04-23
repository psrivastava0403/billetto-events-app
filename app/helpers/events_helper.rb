module EventsHelper
  def vote_count(event)
    events = Rails.configuration.event_store
              .read
              .stream("Event$#{event.id}")
              .to_a   

    upvotes = events.count { |e| e.event_type == "EventUpvoted" }
    downvotes = events.count { |e| e.event_type == "EventDownvoted" }

    upvotes - downvotes
  end
end