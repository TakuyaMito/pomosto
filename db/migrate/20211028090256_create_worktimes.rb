class CreateWorktimes < ActiveRecord::Migration[6.1]
  def change
    create_table :worktimes do |t|
      t.time :start_at
      t.time :end_at
      t.time :stop_at

      t.timestamps
    end
  end
end
