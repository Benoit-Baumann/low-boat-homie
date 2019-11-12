Rails.application.routes.draw do
  devise_for :users

  resources :boats, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :rentals, only: [:new, :create]
  end

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  get '/profile', to: 'profile#show', as: 'profile'
  #Rental routes
  get '/profile/rentals', to: 'profile#rentals', as: 'my_rentals'
  get '/profile/rentals/:id', to: 'profile#rental_show', as: 'my_rental'
  get '/profile/rentals/:id/edit', to: 'profile#rental_edit', as: 'edit_my_rental'
  patch '/profile/rentals/:id', to: 'profile#rental_update', as: 'update_my_rental'
  delete '/profile/rentals/:id', to: 'profile#rental_delete', as: 'delete_my_rental'
  #Boats routes
  get '/profile/boats', to: 'profile#boats', as: 'my_boats'
  get '/profile/boats/:id', to: 'profile#boat_show', as: 'my_boat'
  get '/profile/boats/new', to: 'profile#boat_new', as: 'new_my_boat'
  post '/profile/boats', to: 'profile#boat_create', as: 'create_my_boat'
  get '/profile/boats/:id/edit', to: 'profile#boat_edit', as: 'edit_my_boat'
  patch '/profile/boats/:id', to: 'profile#boat_update', as: 'update_my_boat'
  delete '/profile/boats/:id', to: 'profile#boat_delete', as: 'delete_my_boat'

  root to: 'boats#search'

end
