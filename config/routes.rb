Rails.application.routes.draw do
  root to: 'static_pages#home' 
  get  'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
end
