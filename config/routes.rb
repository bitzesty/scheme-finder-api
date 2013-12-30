SchemeFinderApi::Application.routes.draw do
  devise_for :users

  get '/pages/about', to: 'pages#about', as: :about

  namespace :backend do
    resource  :dashboard
    resources :users
    resources :schemes

    root to: 'dashboards#show'
  end

  namespace :api do
    namespace :v1 do
      resources :schemes, only: [:index]
    end
  end

  root to: 'pages#about'
end
