Rails.application.routes.draw do
  #get 'test/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :test, only:[:index, :create]
end
