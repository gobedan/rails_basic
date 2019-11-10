Rails.application.routes.draw do
  get '/tests/:test_id', to: 'questions#index'

  resources :tests, only: :index do
    resources :questions, shallow: true
  end
end
