Rails.application.routes.draw do
  devise_for :users
  resources :courses, except: [ :delete ] do
    member do
      get 'edit_sections'
      patch 'add_section'
    end
  end
  get 'sections/:id', to: 'sections#show', as: 'section'
  delete 'sections/:id', to: 'sections#destroy'
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'
  root to: 'application#index'
end
