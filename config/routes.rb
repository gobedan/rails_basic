Rails.application.routes.draw do
  #тут я пытаюсь отобразить вложенность и при этом не писать контроллер для тестов
  get '/tests', to: redirect('/')

  resources :tests, only: :index do
    resources :questions, only: %i[index show create new destroy]
  end
end
