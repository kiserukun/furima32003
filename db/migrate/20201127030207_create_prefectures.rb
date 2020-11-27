class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.integer    :genre_prefecture_id     , null: false

      t.timestamps
    end
  end
end
