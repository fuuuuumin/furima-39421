# README

# テーブル設計

## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :sales



## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| categories         | string     | null: false                    |
| condition          | string     | null: false                    |
| postage            | string     | null: false                    |
| sender             | string     | null: false                    |
| shipment           | string     | null: false                    |
| price              | integer    | null: false                    |
| commission         | integer    | null: false                    |
| profit             | integer    | null: false                    |
| seller_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sale



## Salesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| purchaser_id        | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## Shipping_addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building           | string     | null: false                    |
| telephone_number   | integer    | null: false                    |


### Association

- belongs_to :sale





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
