# app/services/event_ingestion_service.rb

class EventIngestionService
  def self.call
    response = BillettoApiService.new.fetch_events

    #  handle API response safely
    events =
      if response.is_a?(Hash)
        response["data"]
      elsif response.is_a?(Array)
        response
      else
        []
      end

    events.each do |event|
      #  skip invalid events (no start date)
      next if event["startdate"].blank?

      Event.find_or_create_by!(external_id: event["id"]) do |e|
        e.title = event["title"]
        e.description = event["description"]
        e.start_date = event["startdate"]
        e.image_url = event["image_link"]
      end
    end
  end
end