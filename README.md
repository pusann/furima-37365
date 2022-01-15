# テーブル設計

## users テーブル

| column             | Type     | Options     |
| -------------------|----------|-------------|
| name               | string   | null: false | 
| name(kana)         | string   | null: false | 
| password           | string   | null: false |
| email              | string   | null: false |
| nickname           | string   | null: false |
| date of birth      | datetime | null: false |

- has_many :items
- has_many :comments
- has_many :purchase
- belongs_to :shipping address

## items テーブル  

| column                      | Type     | Options     |
| ----------------------------|----------|-------------|
| product image               | text     | null: false | 
| product name                | string   | null: false |
| product description         | text     | null: false |
| category                    | integer  | null: false |
| product condition           | integer  | null: false |
| burden of shipping  charges | integer  | null: false |
| shipping area               | string   | null: false |
| days to ship                | datetime | null: false |
| selling price               | integer  | null: false |
| seller                      | string   | null: false |

- belongs_to :user
- has_many :comments
- belongs_to :shipping address


## shipping address テーブル    (配送先)

| column             | Type     | Options      |
| -------------------|----------|--------------|
| post code          | integer  | null: false  | 
| prefectures        | string   | null: false  |
| municipalities     | string   | null: false  |
| address            | integer  | null: false  |
| building name      | string   |              |
| telephone number   | integer  | null: false  |

- belongs_to :user
- has_one :purchase


##  purchase テーブル      (購入)

| column | Type       | Options      |
| -------|------------|--------------|
| user   |references  | null: false  | 
| item   |integer     | null: false  |

- belons_to :user


## comments テーブル

| column      | Type        | Options                        |
|-------------|-------------|--------------------------------|
| content     | string      | null: false                    |
| user        | references  | null: false, foreign_key: true |
| product     | integer     | null: false                    |

- belongs_to :user