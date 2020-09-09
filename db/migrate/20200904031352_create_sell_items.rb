class CreateSellItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_items do |t|
       t.string  :name,            null: false
       t.text    :explanation,     null: false
       t.integer :category_id,     null: false
       t.integer :status_id,       null: false
       t.integer :delivery_fee_id, null: false
       t.integer :area_id,         null: false
       t.integer :day_id,          null: false
       t.integer :price,           null: false
       t.integer :user_id,         foreign_key: true 
      
      t.timestamps
    end
  end
end
