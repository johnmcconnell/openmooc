Rails.application.routes.draw do
  get 'course/new'

  get 'course/create'

  get 'course/update'

  get 'course/edit'

  get 'course/destroy'

  get 'course/index'

  get 'course/show'

  devise_for :users
  resources :course
  get 'course/query', to: 'course#query'
  root to: "application#index"
end
