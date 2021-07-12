Rails.application.routes.draw do
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'homes/top'
  # get 'homes/about'
  # get 'greatmen/new'
  # get 'greatmen/index'
  # get 'greatmen/show'
  # get 'greatmen/edit'

  # get 'users/new'
  # get 'users/show'
  # get 'users/edit'
  devise_for :users, :controllers => {
    :registration => 'users/registrations',
    :sessions => 'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#top"

  resources :homes, only: [:top, :about]

  get 'homes/top' => 'homes#top'

  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update,]

  get 'users/:id/post' => 'users#posts', as: 'user_post'

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  get 'user/:id/hide' => 'users#hide', as: 'user_hide'
  patch 'users/:id/hide' => 'users#hide'
  put 'users/:id/hide' => 'users#hide'

  # post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  # post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  resources :users do
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]

    resources :greats, only: [:index, :edit, :update, :destroy]

  end

  resources :greats do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  resources :inquery, only: [:index, :confirm, :thanks]

  get 'inquery/confirm' => 'inquery#confirm'
  get 'inquery/thanks' => 'inquery#thanks'

end
