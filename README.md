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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| address            | string | null: false |
| password           | string | null: false |
| first_name         | string | nill: false |
| second_name        | string | nill: false |
| first_name_kana    | string | nill: false |
| second_name_kana   | string | nill: false |
| birthday           | string | nill: false |
| id                 | integer| nill: false |

## items テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| item_name  | string | null: false |
| item_image | text   | null: false |
| content    | text   |             |
| price      | integer| null: false |
| user_id    | integer| null: false |

## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| content    | string     |             |
| user_id    | references | null: false |