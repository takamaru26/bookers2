Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :book_body, only: [:create, :destroy, :update]
  resources :users, only: [:show, :edit, :new, :create, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end