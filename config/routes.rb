LoyaltyApp::Application.routes.draw do

  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :api, defaults: {format:'json'} do
    namespace :v1 do
      resources :rewards

      resources :giftcards, only: [:index, :show] do
        member do
          post :redeem
        end
      end

      resources :users, only: [:index, :show] do
        member do
          post :add_points
        end
      end

      resources :stats, only: [:index]

    end
  end

  root 'pages#home'

end
