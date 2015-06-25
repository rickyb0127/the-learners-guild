class AddToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :duration, :interval
    add_column :messages, :meetup_location, :string
    add_column :messages, :thread_id, :integer

  end
end
