class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :price,null: false
      # t.integer :brand_id
      t.integer :item_condition_id,null: false
      t.integer :shipping_charge_players_id
      t.integer :prefecture_code,null: false
      t.integer :size_id,null: false
      t.integer :preparation_day_id,null: false
      t.integer :delivery_type_id,null: false
      # t.references :category,null: false,foreign_key: true
      # t.integer :trading_status, null: false, default: 0
      t.references :seller, foreign_key: {to_table: :users}
      t.references :buyer, foreign_key: {to_table: :users}
      # t.datetime :deal_closed_date, foreign_key:
      t.datetime :deal_closed_date
    end
  end
end
