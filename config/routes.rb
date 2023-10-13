Rails.application.routes.draw do
  resources :quizzes, except: [:new, :edit, :destroy, :show]
  get    '/quizzes/new',     to: 'quizzes#new',     as: 'new_quiz'
  post   '/quizzes/create',  to: 'quizzes#create',  as: 'create_quiz'
  get    '/quizzes/show',    to: 'quizzes#show',    as: 'show_quiz'
  get    '/quizzes/edit',    to: 'quizzes#edit',    as: 'edit_quiz'
  patch  '/quizzes/update',  to: 'quizzes#update',  as: 'update_quiz'
  delete '/quizzes/destroy', to: 'quizzes#destroy', as: 'destroy_quiz'
  
  get '/about', to: 'about#new'

  root to: 'home#new'

  devise_for :users, controllers:{
    session: 'users/sessions',
    registrations: 'users/registrations'
  }

end
