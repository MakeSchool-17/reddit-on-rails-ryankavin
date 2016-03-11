Rails.application.routes.draw do
  resources :posts
  resources :sub_reddits, only: [:index, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :comments



  root :to => 'sub_reddits#main'
  get 'r/:slug' => 'sub_reddits#show_by_slug'
end
