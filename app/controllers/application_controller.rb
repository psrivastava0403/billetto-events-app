class ApplicationController < ActionController::Base
  include Clerk::Authenticatable

  private

  def require_clerk_session!
    redirect_to clerk.sign_in_url unless clerk.session
  end
end