class AddPomoTimeToWorktimes < ActiveRecord::Migration[6.1]
  def change
    add_column :worktimes, :Pomo_time, :integer
  end
end
