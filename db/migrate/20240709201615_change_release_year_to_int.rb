class ChangeReleaseYearToInt < ActiveRecord::Migration[7.1]
  def up
    change_table :movies do |t|
      t.change :release_year, :integer
    end
  end
end
