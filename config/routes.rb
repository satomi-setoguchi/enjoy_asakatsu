Rails.application.routes.draw do
  devise_for :users
  resources :records
  resources :posts do
    resources :comments, shallow: true
  end
  get 'sample', to: 'static_pages#sample'
  root "static_pages#top"
end
