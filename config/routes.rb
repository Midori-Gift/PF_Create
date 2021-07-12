Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registration => 'users/registrations',
    :sessions => 'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#top"
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update,]

  get 'users/:id/post' => 'users#posts', as: 'user_post'

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'

  get 'user/:id/hide' => 'users#hide', as: 'user_hide'
  patch 'users/:id/hide' => 'users#hide'
  put 'users/:id/hide' => 'users#hide'

  resources :users do
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :greats, only: [:edit, :update]
  end

  get 'admin/greats/:id/release' => 'admin/greats#release', as: 'greats_release'
  patch 'admin/greats/:id/release' => 'admin/greats#release'

  resources :greats do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  resources :inquery, only: [:index, :confirm, :thanks]

  get 'inquery/confirm' => 'inquery#confirm'
  get 'inquery/thanks' => 'inquery#thanks'

end
