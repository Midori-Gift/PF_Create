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

# ユーザーの倫理削除用ルーティング一覧

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  get 'user/:id/hide' => 'users#hide', as: 'user_hide'
  patch 'users/:id/hide' => 'users#hide'
  put 'users/:id/hide' => 'users#hide'


  resources :users do
    member do
      get :following, :followers
    end
    delete "relationships" => 'relationships#destroy'
    resources :relationships, only: [:create]
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :greats, only: [:edit, :update, :index]
  end

  get 'admin/greats/:id/release' => 'admin/greats#release', as: 'greats_release'
  patch 'admin/greats/:id/release' => 'admin/greats#release'

  resources :greats do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :inquery, only: [:index, :confirm, :thanks]

  #お問い合わせ機能用ルーティング

  get 'inquery/confirm' => 'inquery#confirm'
  get 'inquery/thanks' => 'inquery#thanks'

end
