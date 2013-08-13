Madrichim::Application.routes.draw do

  resources :incidents
  resources :teen_mid_year
  resources :teacher_mid_year
  resources :teen_end_year
  resources :teen_end_year
  resources :teen_term
  resources :admin_interview
  resources :teacher_end_year
  resources :teen_new

  # Registration
  get  'register/:code' => "registration#new", as: :register
  post 'register/:code' => "registration#create"
  
  # Password reset
  get   'reset/:code' => "password#edit", as: :reset
  put   'reset/:code' => "password#update"
  patch 'reset/:code' => "password#update"
  
  # Login
  get    'login' => "session#new", as: :login
  post   'login' => "session#create"
  
  # Logout
  get    'logout' => "session#destroy", as: :logout
  delete 'logout' => "session#destroy"
  
  root 'site#index'
end
