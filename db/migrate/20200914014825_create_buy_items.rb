class CreateBuyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_items do |t|
      t.integer :sell_item_id,    foreign_key: true
      t.integer :user_id,         foreign_key: true
      t.timestamps
    end
  end
end
