# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nick_name             | string | null: false |
| mail_address          | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_furigana       | string | null: false |
| first_furigana        | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :sell_items
- has_many :buy_items

## sell_items テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| name            | string  | null: false       |
| explanation     | text    | null: false       |
| image           | string  | null: false       |
| category_id     | integer | null: false       |
| status_id       | integer | null: false       |
| delivery_fee_id | integer | null: false       |
| area_id         | integer | null: false       |
| day_id          | integer | null: false       |
| price           | integer | null: false       |
| user_id         | integer | foreign_key: true |

### Association

- has_one :buy_item
- belongs_to :user

## buy_items テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| user_id      | integer | foreign_key: true |
| sell_item_id | integer | foreign_key: true |

### Association

- belongs_to :sell_item
- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column          | Type    | Options           |
| ------------    | ------- | ----------------- |
| postal_code     | string  | null: false       |
| prefectures_id  | integer | null: false       |
| city            | string  | null: false       |
| address         | string  | null: false       |
| building        | string  |                   |
| phone_number    | string  | null: false       |
| buy_item_id     | integer | foreign_key: true |

### Association

- belongs_to :buy_item