Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :sub_reddits
  resources :users

  root :to => 'sub_reddits#main'
  get 'r/:slug' => 'sub_reddits#show_by_slug'
end
