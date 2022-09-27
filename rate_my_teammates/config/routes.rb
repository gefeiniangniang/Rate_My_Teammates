RateMyTeammate::Application.routes.draw do


    root :to => redirect('/users')

    get 'auth', to: 'sessions#auth', as: :auth # auth_path

    get '/users/search', to: 'users#search', as: :search

    get 'login', to: 'sessions#new', as: :login
    post 'verify', to: 'sessions#verify', as: :verify
    get 'logout', to: 'sessions#destroy', as: :logout


    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:index, :show, :update] do
        resources :reviews, only: [:index, :new, :create]
        resources :skills, only: [:index, :new, :create]
    end

    resources :endorsements, only: [:new, :create]


end
