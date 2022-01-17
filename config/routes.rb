Rails.application.routes.draw do
  resources :jobs
  get 'home/index'
  resources :trainings
  resources :languages
  resources :skills
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
