# README

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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|birthday|integer|null: false|

### Association
- has_many :items
- has_many :records

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|setsumei|text|null: false|
|category|string|null: false|
|status|string|null: false|
|haisouhutan|string|null: false|
|haisouchiiki|string|null: false|
|haisounissuu|string|null: false|
|price|integer|null: false|
|seller|string|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :record

## recordsテーブル

|Column|Type|Options|
|------|----|-------|
|buyer|string|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :address

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|credit|integer|null: false|
|postal code|integer|null: false|
|prefectures|integer|null: false|
|municipalities|integer|null: false|
|address|integer|null: false|
|tel|integer|null: false|

### Association
- belongs_to :record