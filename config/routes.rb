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
      resources :lesson_activities, only: [ :new, :create ]
      resources :quiz_activities, only: [ :new, :create ]
    end
  end

  resources :lesson_activities, only: [ :edit, :update ]
  resources :quiz_activities, only: [ :edit, :update ] do
    member do
      resources :fill_in_the_blank_questions, only: [ :new, :create ]
    end
  end

  resources :fill_in_the_blank_questions, only: [ :edit, :update ] do
    member do
      post 'submit_answer'
    end
  end

  resources :pages, only: [ :show ]
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'
  root to: 'application#index'
end
