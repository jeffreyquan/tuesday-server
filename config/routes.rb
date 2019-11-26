Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#home"
  resources :session, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'session#logout'
  get :logged_in, to: 'session#logged_in'


  resources :projects
  resources :groups
  resources :tasks
  resources :memberships
  resources :users, only: [:index, :show, :update, :destroy]
  # NOTE: probably don't need all resources for users

  # https://guides.rubyonrails.org/routing.html#nested-resources
  resources :projects do
    resources :groups, only: [:index, :show, :create, :update, :destroy]
  end

  resources :groups do
    resources :tasks, only: [:index, :create, :show, :update, :destroy]
  end

  resources :users do
    resources :memberships, only: [:index, :create, :show, :update, :destroy]
  end
end
