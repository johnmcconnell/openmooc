Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get "search/course", to: 'query#course'
  root to: "application#index"
end
