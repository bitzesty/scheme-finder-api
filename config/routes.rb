SchemeFinderApi::Application.routes.draw do
  devise_for :users

  get '/pages/about', to: 'pages#about', as: :about

  root to: 'pages#about'
end
