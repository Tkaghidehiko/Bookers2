Rails.application.routes.draw do
  devise_for :users

  root :to => 'books#home'
  get '/about' => 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
end
