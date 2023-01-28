Rails.application.routes.draw do
  get 'daily_decision/create'
  get 'daily_decision/update'
  get 'daily_decision/index'
  get 'daily_decision/show'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :queries do
    resources :options do
      get :random, on: :collection
      # member do
      #   post :mark_as_preferred
      #   post :cancel_preference
      # end
    end
  end
  
  resources :daily_decision, only: [:create, :index, :show, :update, :destroy]

  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'queries#index'
end
