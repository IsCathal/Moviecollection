class SetDefaultViewCountToZero < ActiveRecord::Migration[7.1]
  def change
    change_column_default :movies, :view_count, from: nil, to: 0
  end
end
