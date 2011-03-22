SurvivalStarcraft::Application.routes.draw do
  devise_for :users
  resources :users

  match '/contact', :to => 'pages#contact'

  root :to => "pages#home"
end
