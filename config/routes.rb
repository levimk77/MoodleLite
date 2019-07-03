Rails.application.routes.draw do
  resources :responses, only: [:new, :create, :edit, :update, :destroy] 
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] 
  resources :courses
  resources :students
  
  get "/enrollments/new", to: "enrollments#new"
  post "/enrollments", to: "enrollments#create"
  delete "/enrollments", to: "enrollments#destroy"
  get "/signup", to: "students#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/courses/:id/posts/new", to: "posts#new"
  post "/courses/:id/posts", to: "posts#create"
  patch "/students/:id/admin", to: "students#admin"
  patch "/students/:id/unadmin", to: "students#unadmin"
  patch "/students/:id/ban", to: "students#banned"
  patch "/students/:id/unban", to: "students#unbanned"
  delete "/courses", to: "courses#destroy"
  get "/posts/:id1/edit2/:id2", to: "posts#edit2"
  patch "/posts/:id1/edit2/:id2", to: "posts#update_response"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
