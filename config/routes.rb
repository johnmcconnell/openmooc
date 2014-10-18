Rails.application.routes.draw do
  devise_for :users
  resources :course
  get 'course/query', to: 'course#query'
  root to: "application#index"
end
