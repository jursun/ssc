SurvivalStarcraft::Application.routes.draw do
  devise_for :users

  resources :users
  resources :tournaments

  match '/users', :to => 'users#index'
#  match '/groups', :to => 'groups#index'

  match '/tournaments', :to => 'tournaments#index'
  match '/tournaments/new', :to => 'tournaments#new'

  match '/rules', :to => 'pages#rules'
  match '/contact', :to => 'pages#contact'
  match '/terms', :to => 'pages#terms'
  match '/policy', :to => 'pages#policy'

  root :to => "pages#home"
end
