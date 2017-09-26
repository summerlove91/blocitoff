Rails.application.routes.draw do

  resources :items, only: [:create, :destroy, :show] 

  get 'users/show'

  devise_for :users

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
