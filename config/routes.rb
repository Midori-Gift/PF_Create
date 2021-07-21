Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registration => 'users/registrations',
    :sessions => 'users/sessions'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # トップページとアバウトページのルーティング
  root "homes#top"
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  # ユーザー機能のルーティング
  resources :users, only: [:index, :show, :edit, :update,]

  # ユーザーの投稿一覧
  get 'users/:id/post' => 'users#posts', as: 'user_post'

  # ユーザーの倫理削除用ルーティング一覧
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  get 'user/:id/hide' => 'users#hide', as: 'user_hide'
  patch 'users/:id/hide' => 'users#hide'
  put 'users/:id/hide' => 'users#hide'

  # フォロー機能用ルーティング一覧
  resources :users do
    member do
      get :following, :followers
    end
    delete "relationships" => 'relationships#destroy'
    resources :relationships, only: [:create]
  end

  # 管理者用ルーティング一覧
  namespace :admin do
    resources :users, only: [:index]
    resources :greats, only: [:edit, :update, :index]
  end

  get 'admin/greats/:id/release' => 'admin/greats#release', as: 'greats_release'
  patch 'admin/greats/:id/release' => 'admin/greats#release'

  # 投稿類のルーティング一覧
  resources :greats do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  #お問い合わせ機能用ルーティング
  get 'inquiry' => 'inquiry#index', as: 'inquiry'
  get 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/confirm' => 'inquiry#confirm'
  get 'inquiry/thanks' => 'inquiry#thanks'
  post 'inquiry/thanks' => 'inquiry#thanks'



end
