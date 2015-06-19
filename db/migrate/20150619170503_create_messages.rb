class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body
      t.integer :trade_give_skill_id
      t.integer :trade_ask_skill_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
