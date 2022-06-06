Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    get 'bookmarks', on: :collection
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
