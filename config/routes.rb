Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top' #get 'homes/top'
  
  resources :books, only: [:new, :index, :show] #get 'books/new' #get 'books/index' #get 'books/show'
  resources :users, only: [:index, :show, :edit]#get 'users/index',get 'users/show',get 'users/edit'
  
  
  
end
