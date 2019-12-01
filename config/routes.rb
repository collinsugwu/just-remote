Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/create-jobs', to: 'jobs#save_scraped_jobs'
  get '/jobs', to: 'jobs#index'
end
