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
  resources :skills
  resources :user_skills
  resources :skills_to_learn
  resources :messages
  resources :sent_messages, only: [:index, :show]
  resources :received_messages, only: [:index, :show]

end
