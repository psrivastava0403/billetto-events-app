class EventsController < ApplicationController

  def index
    @events = Event.all.order(:start_date)
  end

  def upvote
     Rails.logger.info "UPVOTE HIT: #{params[:id]}"
    VoteService.upvote(params[:id], current_user_id)
    redirect_to root_path
  end

  def downvote
     Rails.logger.info "DOWNVOTE HIT: #{params[:id]}"
    VoteService.downvote(params[:id], current_user_id)
    redirect_to root_path
  end

  private

  def current_user_id
    clerk.user&.id
  end
end