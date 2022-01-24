Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'searchs#search'

  resources :users, only: [:show,:index,:edit,:update]
  resources :teams

  namespace :my do
  resources :teams do  #get 'myteams/:id' => 'myteams#index'
    resources :chats, only: [:index, :create, :destroy]
    resources :events
    resources :members, only: [:index, :create, :update, :destroy]
    get '/join' => 'members#join'
  end
  end
  #resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
