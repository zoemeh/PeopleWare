Rails.application.routes.draw do
  resources :candidates
  get 'backoffice/index'
  get "/jobs/fulfilled", to: "jobs#fulfilled"
  get "/jobs/unfulfilled", to: "jobs#unfulfilled"
  get "/jobs/:id/selection", to: "jobs#selection_process", as: "job_selection"
  get '/jobs/:id/candidates', to: "jobs#candidates", as: "job_candidates"
  get '/jobs/:id/select/:candidate_id', to: "jobs#select_candidate", as: "job_select_candidate"
  resources :jobs
  get 'home/index'
  get '/apply/:id', to: 'home#apply_job', as: "apply_job"
  resources :trainings
  resources :languages
  resources :skills
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
