Rails.application.routes.draw do
  get 'update/edit'

  get 'update/destroy'

  get 'update/index'

  get 'update/show'

  devise_for :users
  resources :course
  root to: "application#index"
end
