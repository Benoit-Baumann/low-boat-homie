Rails.application.routes.draw do
  devise_for :users

  resources :boats do
    ressouces :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
        get :my_boats
        get :my_rentals
    end
  end  

  root to: 'boats#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
