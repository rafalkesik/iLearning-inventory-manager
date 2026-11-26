Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :users
  resources :users, only: [:index, :show]

  root "pages#home"
end
