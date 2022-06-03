Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top' #get 'homes/top'
  get "/homes/about" => "homes#about", as: "about"
  get "/homes/top" => "homes#top", as: "top"
  get "/users/show" => "users#show", as: "show"
  get "/users/index" => "users#index", as: "index"
  get "/books/index" => "books#index", as: "books_index"
  
  resources :books, only: [:new, :index, :show] #get 'books/new' #get 'books/index' #get 'books/show'
  resources :users, only: [:index, :show, :edit]#get 'users/index',get 'users/show',get 'users/edit'
  
  
  
end
