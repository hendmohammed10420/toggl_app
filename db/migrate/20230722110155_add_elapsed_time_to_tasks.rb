class AddElapsedTimeToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :elapsed, :datetime
  end
end
