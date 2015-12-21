class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
