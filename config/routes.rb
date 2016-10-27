Rails.application.routes.draw do
  root to: "pages#index"

  get '/api', to: 'pages#api', as: "api"
  get '/admin', to: 'admin/sessions#new'
  post '/dashboard/submit_change', to: 'admin/dashboard#submit_change'

  namespace :admin do
    resources :dashboard
    resource :session, only: [:new, :create, :destroy]
  end
end
