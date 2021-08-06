Rails.application.routes.draw do
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/mytask/open',  to: 'mytask#my_open_tasks'
  get '/mytask/completed',  to: 'mytask#my_completed_tasks'
  resources :projects do
    resources :lists,          only: [:index, :show, :create, :destroy] do
      resources :items,          only: [:index, :show, :create, :destroy, :update] do
        resources :subtask,          only: [:show, :create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
end
