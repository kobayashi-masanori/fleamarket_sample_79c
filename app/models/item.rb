class Item < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # has_many :favorites
  has_many :item_images, dependent: :destroy
  # has_one :user_evaluation
  # belongs_to :category
  # belongs_to_active_hash :size
  # belongs_to_active_hash :item_condition
  # belongs_to_active_hash :shipping_charge_players
  # belongs_to_active_hash :preparation_day
  # belongs_to_active_hash :delivery_type
  # belongs_to :brand
  # belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # Gem：jp_prefectureを使用して都道府県コードを取得
  enum trading_status: { waiting: 0, working: 1, completed: 2 }
end
