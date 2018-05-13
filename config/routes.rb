Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :posts
  resources :comments
  resources :apps do
    collection do
      post 'apps_category'
      get 'category'
    end
  end
end
