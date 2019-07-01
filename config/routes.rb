Rails.application.routes.draw do
  resources :responses, only: [:new, :create, :edit, :update, :destroy] 
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] 
  resources :courses
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
