Rails.application.routes.draw do
  root to: 'tests#index'
  resources :tests do
    resources :questions, only: %i[show edit update create new destroy], 
                          shallow: true
  end
end
