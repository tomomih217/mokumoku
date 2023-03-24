# README

## 環境構築
```
$ bundle install --without=production
$ bin/rails db:setup
$ yarn install
$ bin/webpack
$ bin/rails s
```

## 事業をエンジニアリングしよう提案編の回答は以下に記述してください
### 選択した事業側の課題
直近一年間で、2回以上もくもく会に参加してくれた人は利用者全体の1%のみ。もくもく会で気の合う仲間を見つけられなかったのではないか？

### 提案内容
* イベントのブックマークはできるが、他のユーザーのお気に入り登録ができない。仲良くなった人や気になっている人をチェックできるようにすれば、知り合いや友達ができるのではないか。
* 他のユーザーのプロフィール画面が見られない。他のユーザーの人となりが分からない。経験言語が分かれば話題も作りやすいのでは。

### 実装方針
* プロフィールの内容が他のユーザーも見られるようにする
  -> 公開できそうな情報が名前と経験言語ぐらいだったので、経験言語をユーザー名の下に表示するようにした。
* プロフィール内容に経験言語を入力できるようにする
* ユーザーのお気に入り登録ができるようにする
* お気に入り登録したユーザーが参加予定のイベントをチェックすることができるようにする