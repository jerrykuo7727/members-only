Rails.application.routes.draw do
  root to: 'posts#index' 
  get    'signin',  to: 'sessions#new'
  post   'signin',  to: 'sessions#create'
  delete 'signout', to: 'sessions#delete'
  resources :posts, only: [:index, :new, :create]
end
