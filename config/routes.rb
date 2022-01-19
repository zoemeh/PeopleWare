Rails.application.routes.draw do
  get 'backoffice/index'
  resources :jobs
  get 'home/index'
  get '/apply/:id', to: 'home#apply_job', as: "apply_job"
  resources :trainings
  resources :languages
  resources :skills
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
