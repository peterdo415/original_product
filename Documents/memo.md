# メモ
Rails 7 ではrails sコマンドを実行しても JavaScript や CSS がビルドされず、./bin/devコマンドで起動すると JavaScript や CSS がビルドされる。
また、./bin/devで起動すると JavaScript と CSS を変更したときに自動的に再ビルドもしてくれるので、今後はこちらで起動することを忘れないようにしたい。

## rails new
`rails new -c tailwind -d mysql`