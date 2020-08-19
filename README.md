# README

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


## memosテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|
|user_id|integer|null: false|

### Association
- belongs_to :user