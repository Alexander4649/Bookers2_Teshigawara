Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top' #get 'homes/top'
  get "/homes/about" => "homes#about", as: "about"
  #get "/homes/top" => "homes#top", as: "top"
  #get "/users/show" => "users#show", as: "show"
  #get "/users/index" => "users#index", as: "index"
  #get "/books/index" => "books#index", as: "books_index"
  #post "/books" => "books#create"
  #post "/books" => "users#create"
  #get "/users/edit" => "users#edit", as: "users_edit"
  
  resources :books, only: [:new, :create, :index, :show] #get 'books/new' #get 'books/index' #get 'books/show'
  resources :users, only: [:index, :show, :edit, :update]#get 'users/index',get 'users/show',get 'users/edit'
  
  
  
end
