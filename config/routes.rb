Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :books, only:  [:new, :index, :show, :edit, :create, :destroy, :update]
  resources :users, only:  [:show, :index, :edit, :update]
  get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
