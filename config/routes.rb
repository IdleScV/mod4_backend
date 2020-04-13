Rails.application.routes.draw do
  resources :prompt_data
  resources :reviews
  resources :drawings
  resources :rounds
  resources :user_rooms
  resources :rooms
  resources :users


  get 'random_prompt', :to => 'prompt_data#random'
  get 'refresh_images/:id', :to => "drawings#refresh"
  delete 'leavecurrentroom/:id', :to => "user_rooms#leavecurrentroom"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'round_reviews', :to => 'reviews#refresh'
  post 'hoststartnewround/:id', :to => "user_rooms#hoststartnewround"
  post 'gueststartnewround/:id', :to => "user_rooms#gueststartnewround"
end
