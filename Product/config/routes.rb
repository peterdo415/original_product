Rails.application.routes.draw do
  #root 'quizzes#index'
  root 'users#new'
  # ログインページ
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # ユーザー登録ページ
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # その他ユーザー関連
  resources :users, only: %i[edit update show destroy]
end
