SchemeFinderApi::Application.routes.draw do
  devise_for :users

  get '/pages/about', to: 'pages#about', as: :about

  namespace :backend do
    resource  :dashboard
    resources :users
    resources :schemes

    root to: 'dashboards#show'
  end

  root to: 'pages#about'
end
