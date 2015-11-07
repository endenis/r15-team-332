Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'about', to: 'pages#about', as: :about

  # Just show for the time being...
  resources :questions, only: [:show, :new, :create]

end
