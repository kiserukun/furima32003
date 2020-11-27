class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer    :genre_status_id     , null: false
      t.timestamps
    end
  end
end
