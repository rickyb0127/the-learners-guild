Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users

end
