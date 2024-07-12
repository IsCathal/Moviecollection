class Movies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.date :release_year
      t.integer :view_count

      t.timestamps
    end
  end
end
