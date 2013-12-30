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
      resources :activities, only: [:index]
      resources :age_ranges, only: [:index]
      resources :commitment_lengths, only: [:index]
      resources :company_sizes, only: [:index]
      resources :locations, only: [:index]
      resources :sectors, only: [:index]
    end
  end

  root to: 'pages#about'
end
