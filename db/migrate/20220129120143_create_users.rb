class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :send_due_date_reminder
      t.integer :send_due_reminder_interval
      t.date :due_date_reminder_time
      t.string :time_zone
    end
  end
end
