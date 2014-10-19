Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get 'courses/query', to: 'courses#query'
  root to: "application#index"
end
