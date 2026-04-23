Rails.application.routes.draw do
  get 'sessions/new'
  root "events#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "/sign-in", to: "sessions#new"
  get "/sign-up", to: "sessions#new"

  resources :events, only: [:index] do
    member do
      post :upvote
      post :downvote
    end
  end
  
end