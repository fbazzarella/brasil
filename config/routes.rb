Brasil::Application.routes.draw do
  root to: 'pages#index'

  resources :pages, only: :index
end
