Rails.application.routes.draw do
  #get 'test/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
  namespace :v1 do
  resources :test, only:[:index, :create, :destroy]
  end
  end
end
