class RenamePomoTimeColumnToWorktimes < ActiveRecord::Migration[6.1]
  def change
    rename_column :worktimes, :Pomo_time, :pomo_time
  end
end
