class CreateShippingCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_costs do |t|
      t.integer    :genre_shipping_cost_id     , null: false
      t.timestamps
    end
  end
end
