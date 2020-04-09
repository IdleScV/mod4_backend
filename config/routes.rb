Rails.application.routes.draw do
  resources :prompt_data
  resources :reviews
  resources :drawings
  resources :rounds
  resources :user_rooms
  resources :rooms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
