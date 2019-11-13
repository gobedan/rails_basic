Rails.application.routes.draw do
  root to: 'tests#index'
  resources :tests do
    resources :questions, except: :index, shallow: true
  end
end
