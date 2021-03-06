# my_favorite_things_watashinookiniiri

"my_favorite_things_watashinookiniiri" is an application that introduces users' favorite things with Ruby and Rails.


# Requirement

* Ruby   2.6.5
* Rails  6.0.0
* mysql2 0.5.3


# Table design
## users table

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| gender_id          | integer | null: false |

### Association

- has_many :things
- has_many :comments
- has_many :sns_credentials


## things table

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| explanation | text       | null: false |
| price       | integer    | null: false |
| score       | integer    | null: false |
| date        | date       | null: false |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :comments
- has_many :thing_tag_relations
- has_many :tags, through: :thing_tag_relations

## tags table

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| tagname | string | null:false, uniqueness: true |


### Association

- has_many :thing_tag_relations
- has_many :things, through: :thing_tag_relations


## comments table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| thing    | references | null: false, foreign_key: true |

### Association

- belongs_to :thing
- belongs_to :user