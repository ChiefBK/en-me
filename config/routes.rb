Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'api' do
    resources :events
    resources :users, only: [:create]
    resources :sessions, only: [:create]
    resources :csrf_token, only: [:index]
    resources :temporary_password, only: [:create]
  end
end
