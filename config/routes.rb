Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

# ルートパスの指定問題
  root to: 'books#top'
  resources :books
  resources :users

  get 'top' => 'books#top'
  get 'about' => 'books#about'


end

