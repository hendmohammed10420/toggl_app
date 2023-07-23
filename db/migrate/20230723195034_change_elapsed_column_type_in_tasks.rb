class ChangeElapsedColumnTypeInTasks < ActiveRecord::Migration[7.0]
  def up
    change_column :tasks, :elapsed, :integer, default: 0, null: false
  end

  def down
    change_column :tasks, :elapsed, :datetime, default: nil, null: false
  end
end