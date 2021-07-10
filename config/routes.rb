Rails.application.routes.draw do
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

  resources :users, only: [:index, :show, :edit, :update, :unsubscribe, :hide]

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  get 'user/:id/hide' => 'users#hide', as: 'user_hide'
  patch 'users/:id/hide' => 'users#hide'
  put 'users/:id/hide' => 'users#hide'

    post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]

    resources :greats, only: [:index, :edit, :update, :destroy]

  end

  resources :greats

  resources :favorites, only: [:index, :create, :destroy]
  resources :inquery, only: [:index, :confirm, :thanks]

  get 'inquery/confirm' => 'inquery#confirm'
  get 'inquery/thanks' => 'inquery#thanks'

end
