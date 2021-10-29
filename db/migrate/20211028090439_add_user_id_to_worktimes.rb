class AddUserIdToWorktimes < ActiveRecord::Migration[6.1]
  def change
    add_reference :worktimes, :user, null: false, foreign_key: true
  end
end
