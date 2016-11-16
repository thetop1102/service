Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Ckeditor::Engine => "/ckeditor"
  resources :reviews do
    resources :comments
  end
  resources :categories, only: :show
  ActiveAdmin.routes self
  get "/static_pages/*page", to: "static_pages#show"
  root "static_pages#home"
  devise_for :user,
    controllers: {omniauth_callbacks: :"omniauth_callbacks#create" }

  resources :tours, only: [:index, :show] do
    resources :comments
    resources :bookings
  end
  resources :places, only: [:index, :show]
  resources :likes, only: [:create, :destroy]
  resources :mybookings, only: :index
end
