Rails.application.routes.draw do
  resources :posts
  resources :sub_reddits
  get 'r/:slug' => 'sub_reddits#show_by_slug'
  root 'static_pages#home'
end
