Rails.application.routes.draw do
  get 'gratemans/new'
  get 'gratemans/index'
  get 'gratemans/show'
  get 'gratemans/edit'
  
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
