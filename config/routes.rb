Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end
  
  get "/sign_in_candidate", to: "sessions#sign_in_candidate", as: "sign_in_candidate"
  post "/sign_in_candidate", to: "sessions#do_sign_in_candidate"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'profile/index'
  get 'profile/job'
  get 'profile/trainings'
  get 'profile/experience'
  resources :departments
  get 'reports/index'
  get 'reports/new_employees'
  post 'reports/new_employees', to: "reports#generate_new_employees"
  get 'reports/candidates'
  post 'reports/candidates', to: "reports#candidates_search"
  resources :employees
  get '/candidates/advance_search', to: "candidates#advance_search", as: "advance_search"
  resources :candidates
  get 'backoffice/index'
  get "/jobs/fulfilled", to: "jobs#fulfilled"
  get "/jobs/unfulfilled", to: "jobs#unfulfilled"
  get "/jobs/:id/selection", to: "jobs#selection_process", as: "job_selection"
  get '/jobs/:id/candidates', to: "jobs#candidates", as: "job_candidates"
  post '/jobs/:id/select/:candidate_id', to: "jobs#select_candidate", as: "job_select_candidate"
  get "/trainings/remove/:id", to: "trainings#destroy"
  resources :jobs
  get 'home/index'
  get '/apply/:id', to: 'home#apply_job', as: "apply_job"
  resources :trainings
  resources :languages
  resources :skills
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
