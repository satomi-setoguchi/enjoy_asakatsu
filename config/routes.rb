Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :records
  resources :posts do
    get 'my_post_index', on: :collection
    resources :comments, shallow: true
  end
  resource :profile, only: %i[show]

  get 'sample', to: 'static_pages#sample'
  root "static_pages#top"
end
