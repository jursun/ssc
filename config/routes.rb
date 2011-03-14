SurvivalStarcraft::Application.routes.draw do
  match '/contact', :to => 'pages#contact'
  root              :to => "pages#home"
end
