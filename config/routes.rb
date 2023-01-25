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
    resources :options do
      member do
        post :preferred
        post :cancel_preference
      end
    end
  end
  
  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'queries#index'
end
