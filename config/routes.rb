Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  #get 'myteams/:id' => 'myteams#index'
  resources :users,only: [:show,:index,:edit,:update]
  resources :teams

  namespace :my do
  resources :teams do  #get 'myteams/:id' => 'myteams#index'
    resources :chats
    resources :events
    resources :members
  end
  end
  #resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
