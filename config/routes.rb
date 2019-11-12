Rails.application.routes.draw do
  devise_for :users

  resources :boats do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
        get :my_boats
        get :my_rentals
    end
  end  

  root to: 'boats#search'

end
