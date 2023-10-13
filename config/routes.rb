Rails.application.routes.draw do
  get '/about', to: 'about#new'
  root to: 'home#new'

  devise_for :users, controllers:{
    session: 'users/sessions',
    registrations: 'users/registrations'
  }

end
