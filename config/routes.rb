Rails.application.routes.draw do
  resources :responses, only: [:new, :create, :edit, :update, :destroy] 
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] 
  resources :courses
  resources :students

  get "/signup", to: "students#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/courses/:id/posts/new", to: "posts#new"
  post "/courses/:id/posts", to: "posts#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
