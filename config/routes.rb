Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :users
  resources :users, only: %i[index show] do
    collection do
      delete :bulk_destroy
      patch  :bulk_promote
      patch  :bulk_downgrade
    end
  end

  resources :inventories, only: %i[index new create show]
  resources :categories,  only: %i[new create]
  resources :tags,        only: %i[new create]

  root "inventories#index"
end
