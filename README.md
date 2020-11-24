# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | string     | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_day       | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| selling_price      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_address テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| credit_card     | string     | null: false |
| postal_code     | string     | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| address         | string     | null: false |
| building_name   | string     | null: false |
| phone_number    | string     | null: false |

### Association

- belongs_to : purchase