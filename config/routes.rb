Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments
  end

  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  # root "pages#home"
  
  get 'profile/:id', to: 'pages#profile', as: 'profile'

  get 'edit_personal_details', to: 'pages#edit_personal_details', as: 'edit_member_personal_details'
  patch 'update_personal_details', to: 'pages#update_personal_details', as: 'update_member_personal_details'

  get "up" => "rails/health#show", as: :rails_health_check
end
