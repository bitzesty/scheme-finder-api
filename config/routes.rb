SchemeFinderApi::Application.routes.draw do
  devise_for :users

  get '/pages/about', to: 'pages#about', as: :about

  scope module: 'backend' do
    resource  :dashboard
    resources :accounts
    resources :schemes do
      collection {
        get :unconfirmed
      }
    end

    resources :feedbacks do
      collection {
        get :unapproved
      }
      member {
        put :approve
      }
    end
  end

  namespace :api do
    namespace :v1 do
      scope defaults: { format: 'json' } do
        resources :schemes, only: [:index, :create] do
          scope module: :schemes do
            resources :feedbacks, only: [:index, :create]
          end
        end
        resources :activities, only: [:index]
        resources :age_ranges, only: [:index]
        resources :commitment_lengths, only: [:index]
        resources :company_sizes, only: [:index]
        resources :locations, only: [:index]
        resources :sectors, only: [:index]
      end
    end
  end

  root to: 'backend/dashboards#show'
end
