Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :teams
  resources :myteams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
