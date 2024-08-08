Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :customers, only: [:index, :show]
      resources :orders, only: [:show] do
        member do
          post :update_order_fields
        end
      end
      resources :transcripts, only: [:create]
    end
  end
end
