Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  #route for all articles CRUD operation
  resources :articles#, only: [:show,:index,:new,:create]
end
