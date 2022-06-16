Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    get 'bookmarks', on: :collection
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :admin do
    root to: 'dashboards#index'
    resources :boards, :users
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    post 'logout', to: 'user_sessions#destroy'
  end
end
