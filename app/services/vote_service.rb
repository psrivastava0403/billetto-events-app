class VoteService
  def self.upvote(event_id, user_id)
    Rails.configuration.event_store.publish(
      EventUpvoted.new(
        data: {
          event_id: event_id,
          user_id: user_id
        }
      ),
      stream_name: "Event$#{event_id}"
    )
  end

  def self.downvote(event_id, user_id)
    Rails.configuration.event_store.publish(
      EventDownvoted.new(
        data: {
          event_id: event_id,
          user_id: user_id
        }
      ),
      stream_name: "Event$#{event_id}"
    )
  end
end