Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#index'
      end

      namespace :items do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
        get 'random', to: 'search#random'
      end

      resources :items, only: [:index, :show]
      resources :merchants, only: [:index, :show]


    end
  end
end
