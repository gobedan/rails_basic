Rails.application.routes.draw do
  #тут я пытаюсь отобразить вложенность и при этом не писать контроллер для тестов
  get '/tests', to: redirect('/')
  get '/tests/:test_id', to: 'questions#index'

  resources :tests, only: :index do
    resources :questions, shallow: true
  end
end
