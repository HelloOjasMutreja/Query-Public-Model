Rails.application.routes.draw do

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :queries do
    member do
      post 'add_to_daily_decision'
      post 'remove_from_daily_decision'
    end
    resources :options do
      get :random, on: :collection
      # member do
      #   post :mark_as_preferred
      #   post :cancel_preference
      # end
    end
  end

  resources :daily_decisions, only: [:create]
  resources :daily_decision_lists, only: [:index, :show]

  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'queries#index'
end
