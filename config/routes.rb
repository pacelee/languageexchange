Rails.application.routes.draw do
  resource :profiles
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'profiles/index', to: "profiles#index"
  get 'pages/home' => 'pages#home'
  get 'pages/info' => 'pages#info'
  get 'profiles/:id', to: "profiles#profile"
  root 'pages#home'
  resources :conversations do
    resources :messages
  end
end
