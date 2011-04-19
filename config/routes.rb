SurvivalStarcraft::Application.routes.draw do
  devise_for :users

  resources :users
  resources :tournaments
  resources :groups

  match '/rules', :to => 'pages#rules'
  match '/contact', :to => 'pages#contact'
  match '/terms', :to => 'pages#terms'
  match '/policy', :to => 'pages#policy'

  root :to => "pages#home"
end
