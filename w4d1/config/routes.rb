Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get 'all_users' => 'users#index'
  # get 'users' => 'users#show'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/:id' => 'users#show'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

  resources :users, only: [:create,:destroy,:index,:show,:update]
  resources :art_works, only: [:create,:destroy,:index,:show,:update]
end
