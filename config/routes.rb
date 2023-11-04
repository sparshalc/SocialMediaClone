Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments
    resource :cover_image, only: [:destroy], module: :posts
  end

  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  get "pages/home"
  
  get 'profile/:id', to: 'pages#profile', as: 'profile'
  get '/people/suggestions', to: 'pages#suggestions', as: 'suggestions'
  get '/following/posts', to: 'pages#follower_posts', as: 'follwers_post'
  get '/:id/followers', to: 'pages#followers', as: 'followers'
  get '/:id/following', to: 'pages#following', as: 'following'
  get '/notifications', to: 'pages#notification', as: 'notification'
  get '/follow/notifications', to: 'pages#notification_reqs', as: 'request_notification'

  get 'edit_personal_details', to: 'pages#edit_personal_details', as: 'edit_member_personal_details'
  patch 'update_personal_details', to: 'pages#update_personal_details', as: 'update_member_personal_details'

  post 'followability/:id/follow', to: 'followability#follow', as: 'follow'
  post 'followability/:id/unfollow', to: 'followability#unfollow', as: 'unfollow'
  post 'followability/:id/accept', to: 'followability#accept', as: 'accept'
  post 'followability/:id/decline', to: 'followability#decline', as: 'decline'
  post 'followability/:id/cancel', to: 'followability#cancel', as: 'cancel'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
