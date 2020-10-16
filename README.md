## 機能一覧（仮）
### 必須機能
- ユーザー新規登録 → Users#create
- ログイン・ログアウト機能 → device?
- マイページ表示機能 → Profiles#index
- マイページ編集機能 → Profiles#edit

- 商品一覧表示 → Items#index
- 商品出品 → Items#create
- 商品購入 → Items#update
- 商品詳細表示 → Items#show
- 商品削除 → Items#destroy
- カテゴリー機能 → Items#category_index(新しく作る)？

### 追加機能(候補)
- ブランド機能
- クレジットカード登録・支払い機能
- 商品検索機能
- お気に入り
- 商品についての質問・コメント機能
- ユーザー新規登録・ログイン（SNS連携）
- パンくず

## テーブル一覧（仮）
＊は必須機能に紐付きそうなテーブル
### Users table＊
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|password|string|null:false|
|email|string|null:false, unique: true, index:true|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :todo_lists
- has_many :user_evaluations
- has_many :seller_items, foreign_key: "seller_id", class_name: "Items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "Items"
- has_one :point_sales
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

### Profiles table＊
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year_month_day|date|null:false|
|introduction|text||
|avatar|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

### Items table＊
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|item_condition|integer|null: false|
|shipping_charge_players|integer|null: false|
|prefecture_code|integer|null: false|
|size|integer|null: false|
|preparation_day|integer|null: false|
|delivery_type|integer|null: false|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_images, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_charge_players
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :delivery_type
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- Gem：jp_prefectureを使用して都道府県コードを取得

### Categories table＊
多階層なのでancestryを使うと便利らしい
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry

### Sending_destinations table＊
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|string(7)|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string||
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

### Todo_lists table＊
|Column|Type|Options|
|------|----|-------|
|list|text|null:false|
|user|references|null: false, foreign_key: true|

### Association
-belongs_to:user

### Point_sales table＊
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to:User

### Item_images table＊
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item

### User_evaluations table
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :evaluation
- belongs_to :user
- belongs_to :item

### Brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :Items

### Credit_cards table
Payjpで実装
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false, foreign_key: true|


### Association
- belongs_to:user

### Favorites table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

### Comments table
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|

### Association
- belongs_to :user
- belongs_to :item