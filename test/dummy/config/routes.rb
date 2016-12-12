Rails.application.routes.draw do
  resources :users
  resources :orders, except: [:index, :new, :edit]
end
