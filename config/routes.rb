Rails.application.routes.draw do
  get 'signin', to: 'sessions#new'
end
