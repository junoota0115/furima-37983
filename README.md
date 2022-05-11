# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
+

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false, unique:true|
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false, unique:true|
| first_name         | string | nill: false             |
| second_name        | string | nill: false             |
| first_name_kana    | string | nill: false             |
| second_name_kana   | string | nill: false             |
| birthday           | string | nill: false             |


## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| item_name    | string | null: false |
| content      | text   | null: false |
| category     | string | null: false |
| item_status  | string | null: false |
| postage      | string | null: false |
| prefectures  | string | null: false |
| days         | string | null: false |
| price        | integer| null: false |
| user_id      | integer| null: false |


## 購入履歴 テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | -----------                   |
| item       | string     | null: false, foreign_key: true|
| user       | references | null: false, foreign_key: true|

## 配送先住所テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user_id     | references | null: false |
| postal_code | integer    | null: false |
| city        | string     | null: false |
| municipality| string     | null: false |
| address     | string     | null: false |
| phone_number| integer    | null:false  |
