Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  
  resources :users do
    member do
      get :profile
    end
  end
  get 'users/update'
  patch 'users/update'

  resources :rooms do
    collection do
      get :search
    end
  end


  root to: "start_pages#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show]
  resources :rooms, only: %i[index new create show] do
    resources :reservations, only: %i[index create show], shallow: true
    match '/reservations/new', to: 'reservations#new', via: 'post'
    match '/reservations/new', to: 'reservations#new', via: 'patch'
  end
end

