Rails.application.routes.draw do
  devise_for :users
  resources :records
  resources :posts
  root "static_pages#top"
end
