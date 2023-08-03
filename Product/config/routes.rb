Rails.application.routes.draw do
  root 'quizzes#index'
  
  # ログイン関連
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # ユーザー登録ページ
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # その他ユーザー関連
  resources :users, only: %i[edit update show destroy]

  # 一覧以外の問題関連
  resources :quizzes, only: %i[edit new create update show destroy] do
    # 回答
    resources :answers, only: :create
  end

  # 検索
  post '/quizzes', to: 'quizzes#search', as: 'search_quizzes'

end
