class VoteService
  def self.upvote(event_id, user_id)
    stream = "Event$#{event_id}"

    events = Rails.configuration.event_store.read.stream(stream).to_a

    # 🔥 check if already voted
    already_voted = events.any? do |e|
      e.data[:user_id] == user_id
    end

    return if already_voted

    Rails.configuration.event_store.publish(
      EventUpvoted.new(
        data: { event_id: event_id, user_id: user_id }
      ),
      stream_name: stream
    )
  end

  def self.downvote(event_id, user_id)
    stream = "Event$#{event_id}"

    events = Rails.configuration.event_store.read.stream(stream).to_a

    already_voted = events.any? do |e|
      e.data[:user_id] == user_id
    end

    return if already_voted

    Rails.configuration.event_store.publish(
      EventDownvoted.new(
        data: { event_id: event_id, user_id: user_id }
      ),
      stream_name: stream
    )
  end
end