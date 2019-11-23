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

  get '/projects/:project_id/groups' => 'projects#groups_index', :as => 'project_groups'
  post '/projects/:project_id/groups' => 'projects#group_create'
  delete '/projects/:project_id/groups/group_id' => 'projects#group_destroy'
  get '/groups/:group_id/tasks/' => 'projects#group_tasks_index', :as => 'project_group_tasks'
  post '/groups/:group_id/tasks/' => 'projects#group_task_create'
  get '/groups/:group_id/tasks/:task_id' => 'projects#group_task_show', :as => 'project_group_task'
  post '/groups/:group_id/tasks/:task_id' => 'projects#group_task_update'
  delete '/groups/:group_id/tasks/:task_id' => 'projects#group_task_destroy'

end
