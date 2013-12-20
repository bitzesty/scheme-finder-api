SchemeFinderApi::Application.routes.draw do
  get '/pages/about', to: 'pages#about', as: :about

  root to: 'pages#about'
end
