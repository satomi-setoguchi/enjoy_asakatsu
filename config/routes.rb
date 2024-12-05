Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy] do
      member do
        get :followings, :followers
      end
    end
  end
  resources :records
  resources :posts do
    member do
      get :my_post_index
    end
    resources :comments, shallow: true
  end
  resources :profiles, only: %i[show]
  get 'sample', to: 'static_pages#sample'
  root "static_pages#top"
end
