Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'api' do
    resources :events
    resources :comments, only: [:create, :index]
    resources :users, only: [:create, :index]
    resources :sessions, only: [:create]
    resources :csrf_token, only: [:index]
    resources :temporary_password, only: [:create]
  end
end
