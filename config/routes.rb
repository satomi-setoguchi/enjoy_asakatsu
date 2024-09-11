Rails.application.routes.draw do
  devise_for :users
  resources :records
  root "static_pages#top"
end
