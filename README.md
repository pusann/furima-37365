# テーブル設計

## users テーブル　

| column              | Type     | Options      |
| --------------------|----------|--------------|
| first_name          | string   | null: false  | 
| last_name           | string   | null: false  | 
| first_name_kana     | string   | null: false  |
| last_name_kana      | string   | null: false  |
| encrypted_password  | string   | null: false  |
| email               | string   | unique: true |
| nickname            | string   | null: false  |
| date_of_birth       | date     | null: false  |

- has_many :items
- has_many :comments
- has_many :purchases
- belongs_to :shipping_address

## items テーブル

| column                      | Type     | Options     |
| ----------------------------|----------|-------------|
| product_image               | text     | null: false | 
| product_name                | string   | null: false |
| product_description         | text     | null: false |
| category                    | integer  | null: false |
| product_condition           | integer  | null: false |
| burden_of_shipping_charges  | integer  | null: false |
| shipping_area               | string   | null: false |
| days_to_ship                | datetime | null: false |
| selling_price               | integer  | null: false |
| seller                      | string   | null: false |

- belongs_to :user
- has_many :comments
- belongs_to :shipping_address


## shipping_addresss テーブル    (配送先)

| column             | Type       | Options                        |
| -------------------|------------|--------------------------------|
| post_code          | integer    | null: false                    | 
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | integer    | null: false                    |
| building_name      | string     |                                |
| telephone_number   | integer    | null: false                    |
| purchase           | references | null: false, foreign_key: true |


- belongs_to :user
- belongs_to :purchases


##  purchases テーブル      (購入)

| column | Type       | Options                        |
| -------|------------|--------------------------------|
| user   |references  | null: false, foreign_key: true | 
| item   |references  | null: false, foreign_key: true |

- belong_to :itme
- belong_to :shipping_address

## comments テーブル　

| column      | Type        | Options                        |
|-------------|-------------|--------------------------------|
| content     | string      | null: false                    |
| user        | references  | null: false, foreign_key: true |
| product     | integer     | null: false                    |

- belongs_to :user