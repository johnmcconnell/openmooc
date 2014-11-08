Rails.application.routes.draw do
  devise_for :users
  resources :courses, except: [ :delete ] do
    member do
      get 'edit_sections'
      patch 'add_section'
    end
  end
  resources :sections, only: [ :show, :destroy ] do
    member do
      get 'new_quiz_activity'
      get 'new_lesson_activity', to: 'lesson_activities#new'
      post 'new_lesson_activity', to: 'lesson_activities#create'
    end
  end
  get 'search/course', to: 'query#course'
  get 'help', to: 'application#help'
  get 'about', to: 'application#about'
  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'
  root to: 'application#index'
end
