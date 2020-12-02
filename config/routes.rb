Rails.application.routes.draw do
  devise_for :users
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "posts#index"
   #get "posts/top" => "posts#top"
  
  resources :users, only: [:show]


  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
   #フォローとフォローを外すアクション

  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
   #フォロー・フォロワーの一覧ページ

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
   #get "posts/index" => "posts#index"
   #get "posts/new" => "posts#new"
   #get "posts/show" => "posts#show"
   #get "posts/edit" => "posts#edit"
   #get "posts/:id" => "posts#show" ,as: "post"
   #get "posts/:id/edit" => "posts#edit" , as:"edit_post"
end
