class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :description
      t.string :deadline

      t.timestamps
    end
  end
end
