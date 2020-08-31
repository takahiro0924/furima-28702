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
| birthday              | string | null: false |

### Association

- has_many :sell_items
- has_many :buy_items

## sell_items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| explanation  | text   | null: false |
| image        | string | null: false |
| category     | string | null: false |
| status       | string | null: false |
| delivery_fee | string | null: false |
| area         | string | null: false |
| day          | string | null: false |
| price        | string | null: false |

### Association

- has_one :buy_item
- belongs_to :user

## buy_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |

### Association

- belongs_to :sell_item
- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postal_code  | string | null: false |
| city         | text   | null: false |
| address      | string | null: false |
| building     | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :buy_item