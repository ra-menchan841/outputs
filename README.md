# README

## アプリ名
プログラミング学習ノート


## アプリケーション概要
プログラミング学習のアウトプットができるアプリケーション。  
アウトプット×モチベーションアップ×収集癖を掛け合わせました。  
- アウトプット：効率よく学習ができます。  
- モチベーションアップ：記事投稿することで、褒め言葉が表示されます。  
- 収集癖：自身の投稿した記事数が数字で可視化されます。  

## 本番環境
URL：https://programing-learning-note.herokuapp.com/  
テスト用メールアドレス：test@test.com  
テスト用パスワード：testaccount  

## 制作背景
- アウトプットへのモチベーションを高める  
プログラミング学習の一貫として記事投稿でアウトプットをしたかったのですが、記事を公開することには抵抗がありました。そのため、公開せずとも自分用のノートとして使用できるツールがあればと思い製作致しました。また、アウトプット学習に対してのモチベーションを維持できる機能も欲しいと感じました。そこで、投稿記事数が可視化される機能と、投稿時にフラッシュメッセージにて褒めてくれる機能を加えました。  
  
- 記事投稿のしやすさ  
自身が文章をまとめる際、別の場所に下書きをしてからまとめます。そのため、新規投稿画面の左側にメモ欄を設けました。


## 機能一覧・DEMO

### 記事投稿
マークダウンおよびシンタックスハイライトを用いて記事投稿ができます。  
使用したGemは以下の通りです。  
マークダウン：redcarpet  
シンタックスハイライト：rouge  

### 記事投稿後に褒め言葉が表示される機能
記事を投稿した際、あらかじめ設定している褒め言葉がランダムで表示されます。  

[![Image from Gyazo](https://i.gyazo.com/2bf6d2783a64512b378e5132e71306db.gif)](https://gyazo.com/2bf6d2783a64512b378e5132e71306db)

### 投稿記事数の表示
投稿した記事数が表示されます。  

### 記事一覧表示
投稿した記事のタイトルが一覧で表示されます。  

### 記事詳細表示
投稿した記事のタイトルを選択すると、詳細が確認できます。  

[![Image from Gyazo](https://i.gyazo.com/f8f77715a234b0884728fef7164ed458.gif)](https://gyazo.com/f8f77715a234b0884728fef7164ed458)

### 記事編集
投稿した記事の編集・更新ができます。  

[![Image from Gyazo](https://i.gyazo.com/21d3cf109075c931739523f6c91cb91a.gif)](https://gyazo.com/21d3cf109075c931739523f6c91cb91a)

### 記事削除
投稿した記事の削除ができます。  

[![Image from Gyazo](https://i.gyazo.com/9a6c43f5c3c52474ef7f0e598d53659c.gif)](https://gyazo.com/9a6c43f5c3c52474ef7f0e598d53659c)

### メモ機能
記事の新規投稿画面にて、左側に存在します。  
新規投稿時にちょっとしたメモや下書きを残しておくことができます。  
メモはローカルストレージに保存されるため、リロードしても内容を保持できます。  
使用したプラグイン：Garlic.js  

[![Image from Gyazo](https://i.gyazo.com/fc53ba0eea89fecb98cb970d9fbf25b1.gif)](https://gyazo.com/fc53ba0eea89fecb98cb970d9fbf25b1)

## 工夫した点
メモはリロードの際に消えてしまわないよう、プラグインを導入しローカルストレージに保存されるように致しました。  

## 使用技術
言語：Ruby
フレームワーク：Ruby on Rails  
Gem：redcarpet, rouge  
プラグイン：Garlic.js  
DB：MySQL  
サーバー：Heroku  



## 今後実装したい機能
- 記事詳細表示ページをリロードせずに実装(Javascript)  
- 記事の新規投稿時、マークダウンのプレビュー画面を確認できる機能(Javascript)  
- 投稿記事の検索機能  
- マークダウンの設定調整および説明ページの作成  
- 投稿記事の公開範囲を選択できる機能  
- メモモデルを作成し、ローカルストレージではなくDBにメモデータを保存する機能  
- モデル・コントローラーの統合テスト  


## DB設計

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|
|user_id|integer|null: false, forign_key: true|

### Association
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|mail|string|null: false, unique: true|
|password|integer|null: false|

### Association
- has_many :posts
- has_one :memo

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|



以下、現時点では未使用のテーブル

## memosテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|
|user_id|integer|null: false|

### Association
- belongs_to :user