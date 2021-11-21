class RemoveStartAtFromWorktimes < ActiveRecord::Migration[6.1]
  def change
    remove_column :worktimes, :start_at, :time
    remove_column :worktimes, :end_at, :time
    remove_column :worktimes, :stop_at, :time
  end
end
