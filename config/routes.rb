Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  root to: 'application#index'
end
