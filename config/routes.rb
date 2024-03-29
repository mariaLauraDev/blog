Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "blog_posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blog_posts
  devise_for :users
  # get "/blog_posts/new", to: "blog_posts#new", as: "new_blog_post"
  # get "/blog_posts/:id", to: "blog_posts#show", as: "blog_post"
  # delete "/blog_posts/:id", to: "blog_posts#destroy", as: "delete_blog_post"
  # patch "/blog_posts/:id", to: "blog_posts#update", as: "update_blog_post"
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: "edit_blog_post"
  # post "/blog_posts", to: "blog_posts#create", as: "blog_posts"
end
