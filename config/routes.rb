Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#home"
  resources :session, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'session#logout'
  get :logged_in, to: 'session#logged_in'

  resources :projects
  resources :tasks
  resources :memberships
  resources :users, only: [:index, :show, :update, :destroy]
  # NOTE: probably don't need all resources for users

  get '/projects/:project_id/tasks/' => 'projects#tasks_index', :as => 'project_tasks'
  post '/projects/:project_id/tasks/' => 'projects#task_create'
  get '/projects/:project_id/tasks/:task_id' => 'projects#task_show', :as => 'project_task'
  post '/projects/:project_id/tasks/:task_id' => 'projects#task_update'
  delete '/projects/:project_id/tasks/:task_id' => 'projects#task_destroy'

end
