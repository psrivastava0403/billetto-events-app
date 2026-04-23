Rails.application.routes.draw do
  root "events#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :events, only: [:index] do
    member do
      post :upvote
      post :downvote
    end
  end
end