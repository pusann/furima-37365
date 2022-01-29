# テーブル設計

## users テーブル 

| column              | Type     | Options                   |
| --------------------|----------|---------------------------|
| first_name          | string   | null: false               |  
| last_name           | string   | null: false               | 
| first_name_kana     | string   | null: false               |
| last_name_kana      | string   | null: false               |
| encrypted_password  | string   | null: false               |
| email               | string   | null: false, unique: true |
| nickname            | string   | null: false               |
| date_of_birth       | date     | null: false               |

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| column                         | Type        | Options                        |
| -------------------------------|-------------|--------------------------------|
| product_name                   | string      | null: false                    |
| product_description            | text        | null: false                    |
| category_id                    | integer     | null: false                    |
| product_condition_id           | integer     | null: false                    |
| burden_of_shipping_charges_id  | integer     | null: false                    |
| shipping_area_id               | integer     | null: false                    |
| days_to_ship_id                | integer     | null: false                    |
| selling_price                  | integer     | null: false                    |
| user                           | references  | null: false, foreign_key: true | 


- belongs_to :user
- has_many :comments
- has_one :purchase


##  addresses テーブル    (配送先)

| column             | Type       | Options                        |
| -------------------|------------|--------------------------------|
| post_code          | string     | null: false                    | 
| prefectures_id     | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

- belongs_to :purchase


##  purchases テーブル      (購入)

| column | Type       | Options                        |
| -------|------------|--------------------------------|
| user   |references  | null: false, foreign_key: true | 
| item   |references  | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :address

## comments テーブル 

| column      | Type        | Options                        |
|-------------|-------------|--------------------------------|
| content     | string      | null: false                    |
| user        | references  | null: false, foreign_key: true |
| product     | integer     | null: false                    |

- belongs_to :user
- belongs_to :item