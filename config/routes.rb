Rails.application.routes.draw do


  get 'user/set_blog_post'

  get 'user/blog_post_params'

  resources :comments, only: [:edit, :create, :update, :destroy]
  resources :blog_posts
  devise_for :users
  resources :users

  root 'welcome#index'

  get 'blog_posts' => 'blog_posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
