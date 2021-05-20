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


## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :purchases




## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| item_category    | string     | null: false                    |
| item_status      | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
#### imageはActiveStorageを使用するため未記載

### Association

- has_one    :purchase
- belongs_to :user




## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one    :shipping
- belongs_to :user
- belongs_to :item




## shipping テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| address   | string     | null: false                    |
| purchases | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases