class EventsController < ApplicationController
  before_action :require_clerk_session!, only: [:upvote, :downvote]

  def index
    @events = Event.all
  end

  def upvote
    VoteService.upvote(params[:id], clerk.user.id)
    redirect_to root_path
  end

  def downvote
    VoteService.downvote(params[:id], clerk.user.id)
    redirect_to root_path
  end
end