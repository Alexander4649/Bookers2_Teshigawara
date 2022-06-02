Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top' #get 'homes/top'
  get "/homes/about" => "homes#about", as: "about"
  
  resources :post_images, only: [:new, :index, :show] #get 'books/new' #get 'books/index' #get 'books/show'
end
