Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows' #フォローをする
    get 'followers' => 'relationships#followed', as: 'followers' #フォローを外す
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  root 'home#top'
  get 'home/about'

end