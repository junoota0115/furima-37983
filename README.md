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
| nickname           | string | null: false             |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| second_name        | string | null: false             |
| first_name_kana    | string | null: false             |
| second_name_kana   | string | null: false             |
| birthday           | date   | null: false             |
## Association
has_many :orders
has_many :items


## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| content         | text       | null: false |
| category_id     | integer    | null: false |
| item_status_id  | integer    | null: false |
| postage_id      | integer    | null: false |
| prefecture_id   | integer    | null: false |
| send_day_id     | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true|
## Association
belongs_to :user
has_one :order



##  orders テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | -----------                   |
| item       | references | null: false, foreign_key: true|
| user       | references | null: false, foreign_key: true|
## Association
belongs_to :user
belongs_to :item
has_one :shipping_add



## shipping_addsテーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| order           | references | null: false, foreign_key: true|
| postal_code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |             |
| phone_number    | string     | null:false  |
## Association
belongs_to :order
