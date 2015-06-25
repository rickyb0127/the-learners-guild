class ChangeTypeForDuration < ActiveRecord::Migration
  def change
    remove_column :messages, :duration
    add_column :messages, :duration, :integer
  end
end
