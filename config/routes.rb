Rails.application.routes.draw do
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
    post "bookings/:id" => "bookings#show"
  end
  resources :places, only: [:index, :show]
  resources :likes, only: [:create, :destroy]
end
