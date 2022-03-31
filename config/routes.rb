Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  resources :users, only: %i[show edit update] do
    resources :locations, only: %i[index new create]
  end
end
