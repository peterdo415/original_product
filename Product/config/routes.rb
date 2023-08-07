Rails.application.routes.draw do
  get 'google_login_api/callback'
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
  get '/quizzes', to: 'quizzes#search', as: 'search_quizzes'

  # 表示件数
  resources :quizzes, only: [:index] do
    collection do
      get 'show_10'
      get 'show_30'
    end
  end

  # Google認証
  post '/google_login_api/callback', to: 'google_login_api#callback'
end
