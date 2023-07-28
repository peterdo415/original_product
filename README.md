# コンセプト
- エンジニア問題集アプリ
## 対象ユーザー
- プログラミング初学者から現役エンジニアまで
## どんな課題を解決するのか
- 初学者：エラー詰まり、学習障壁
- アウトプット（技術ブログ）の難易度
- 現役エンジニア：自分の得意分野においての信用度、それの視覚化
## どうやって解決するか
- 得意なジャンルでポイントを稼ぐことにより、そのジャンルに対しての信用度を得られる
- 多くの問題のプールが参考になる
- 問題を作ることにより簡易的なアウトプットができる
## テーブル
[ER図](https://github.com/peterdo415/original_product/blob/main/Documents/table.md)
## 機能要件
- ユーザーアカウント管理機能: ユーザーがアカウントを作成し、ログイン/ログアウトできるようにする（Google連携）
- 問題作成機能: ユーザーが問題を作成し、それをデータベースに保存できるようにする
- 問題閲覧機能: ユーザーが作成された問題を閲覧できるようにする
- 問題回答機能: ユーザーが問題に対して回答を提出できるようにする
- 問題解答履歴機能: ユーザーが回答した問題の履歴を追跡できるようにする
- 問題難易度設定機能: 正答率によって都度難易度が変更される
- ポイント機能: 回答時の難易度によって正解時にポイントが得られる
- 問題検索機能: ユーザーが特定のキーワードに基づいて問題を検索できるようにする
## 非機能要件
- レスポンシブ対応
- GithubActions（できれば）
- RuboCop
## 画面遷移図（業務フロー）

## システム構成図（aws, Docker等）
[システム構成図](https://github.com/peterdo415/original_product/blob/main/Documents/%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E6%A7%8B%E6%88%90%E5%9B%B3.png)