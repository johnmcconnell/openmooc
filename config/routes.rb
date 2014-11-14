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
      resource :quiz_activity, only: [ :new, :create ]
      resource :fill_in_blank_question, only: [ :new, :create ]
    end
  end
  resources :fill_in_blank_questions, only: [ :edit ] do
    member do
      post 'submit_answer'
      patch 'update', as: 'update'
      put 'update'
    end
  end
  resources :pages, only: [ :show ], controller: 'activities'
  resources :lesson_activities, only: [ :edit ]
  patch 'lesson_activities/:id', to: 'lesson_activities#update', as: 'update_lesson_activity'
  resources :quiz_activities, only: [ :edit ]
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'
  root to: 'application#index'
end
