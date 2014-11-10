Rails.application.routes.draw do
  devise_for :users
  resources :courses, except: [ :delete ] do
    member do
      get 'edit_sections'
      patch 'add_section'
    end
  end
  resources :sections, only: [ :show, :destroy, :edit ] do
    member do
      resource :lesson_activity, only: [ :new, :create ]
      get 'new_quiz_activity'
    end
  end
  resources :pages, only: [ :show ], controller: 'activities'
  resources :lesson_activities, only: [ :edit ]
  patch 'lesson_activities/:id', to: 'lesson_activities#update', as: 'update_lesson_activity'
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'
  root to: 'application#index'
end
