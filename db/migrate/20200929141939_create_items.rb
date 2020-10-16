class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :price,null: false
      # t.references :brand,foreign_key: true
      t.integer :item_condition,null: false
      t.integer :shipping_charge_players,null: false
      t.integer :prefecture_code,null: false
      t.integer :size,null: false
      t.integer :preparation_day,null: false
      t.integer :delivery_type,null: false
      # t.references :category,null: false,foreign_key: true
      t.integer :trading_status, null: false, default: 0
      # t.references :seller,null: false,foreign_key: true
      # t.references :buyer,foreign_key: true
      t.datetime :deal_closed_date
    end
  end
end
