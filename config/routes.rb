Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :user
  resources :post
  resources :comment

  get '/post/user/:userId', to: 'post#posts_by_user'
  get '/comment/post/:postId', to: 'comment#comments_by_post'
end
