Blogger::Application.routes.draw do

  root to: "blogs#index"

  resources :tags, only: [ :index, :show ]

  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

  match 'login'  => 'author_sessions#new'
  match 'logout' => 'author_sessions#destroy'

  resources :blogs

  scope "/:blog_id", as: "blog"  do
    match "/" => "articles#index", as: "home"

    resources :articles do
      resources :comments, only: [ :create ]
    end
  end

end
