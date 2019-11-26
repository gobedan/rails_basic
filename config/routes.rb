Rails.application.routes.draw do
  get 'users/new'
  
  root to: 'tests#index'
  
  get :signup, to: 'users#new'
  resources :users, only: :create

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member 
  end
end
