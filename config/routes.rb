Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/create-jobs', to: 'jobs#save_scraped_jobs'
  get '/jobs', to: 'jobs#index', as: 'get_jobs'
  get '/about', to: 'homes#about', as: 'about'
  resources :jobs, only: [:show]
end
