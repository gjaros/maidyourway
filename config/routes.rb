Rails.application.routes.draw do

  resources :jobs
  resources :comments, only: [:edit, :create, :update, :destroy]
  resources :blog_posts
  devise_for :users
  resources :users, except: [:create, :edit, :update]

  get 'user/set_blog_post'
  get 'user/blog_post_params'
  get 'blog_posts' => 'blog_posts#index'
  get 'show_job' => 'jobs#show'
  get 'schedule' => 'jobs#schedule'

  post 'create_user' => 'users#create', as: :create_user
  get 'edit_user' => 'users#edit', as: :edit_user
  get 'show_user' => 'users#show', as: :show_user
  patch 'users/:id' => 'users#update'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
