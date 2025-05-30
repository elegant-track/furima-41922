# README

## Users

| column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| nickname           | string     | null: false  |
| email              | string     | nill: false, unique: true |
| encrypted_password | string     | nill: false  |
| last_name          | string     | nill: false  |
| first_name         | string     | nill: false  |
| last_name_kana     | string     | nill: false  |
| first_name_kana    | string     | nill: false  |
| birthday           | date       | nill: false  |

### Association
- has_many :items
- has_many :purchases

## Items

| column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | nill: false |
| explanation      | text       | nill: false |
| category_id      | integer    | nill: false |
| status_id        | integer    | nill: false |
| shopping_fee_id  | integer    | nill: false |
| prefecture_id    | integer    | nill: false |
| delivery_time_id | string     | nill: false |
| price            | integer    | nill: false |
| user             | references | nill: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase

## Purchases

| column | Type       | Options    |
| ------ | ---------- | ---------- |
| user   | references | nill: false, foreign_key: true |
| item   | references | nill: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## Shopping_addresses

| column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | nill: false |
| prefecture_id | integer    | nill: false |
| municipality   | string     | nill: false |
| address        | string     | nill: false |
| building_name  | string     |             |
| phone_number   | string     | nill: false |
| purchase       | references | nill: false, foreign_key: true |

### Association
- belongs_to :purchase