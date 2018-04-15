Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users, only: [] do
    member do
      resources :profiles, only: [:new, :create, :update]
    end
  end

  root to: "pages#home"
  get '/veteran_benefits' => 'pages#veteran_benefits'
  get '/employer_benefits' => 'pages#employer_benefits'

  resources :contacts, only: [:new, :create]
  resources :jobs
  resources :job_applications, only: [:create, :index]
end
