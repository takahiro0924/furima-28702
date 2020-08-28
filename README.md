# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nick_name       | string | null: false |
| mail_address    | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_furigana | string | null: false |
| first_furigana  | string | null: false |

### Association

- has_many :sell_items
- has_many :buy_items

## sell_items テーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| item_name        | string | null: false |
| item_explanation | text   | null: false |

### Association

- has_one :buy_items
- belongs_to :users

## buy_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |

### Association

- belongs_to :sell_items
- belongs_to :user

