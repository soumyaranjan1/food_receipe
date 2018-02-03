Rails.application.routes.draw do

  #devise_for :users
  get 'home/index'

  resources :receipes	

  #root 'users/sessions#new'
  root :to => redirect("/users/sign_in")


 devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
