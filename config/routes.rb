Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'about', to: 'pages#about', as: :about
  get 'pages/record'
  resources :recordings, only: [:create, :destroy]

  get 'js/recorderWorker'
  get 'js/mp3Worker'
end
