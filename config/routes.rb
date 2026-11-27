Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :users
  resources :users, only: [:index, :show] do
    collection do
      delete :bulk_destroy
    end
  end

  root "pages#home"
end
