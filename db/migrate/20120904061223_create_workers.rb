class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.text :contacts
      t.boolean :search_status
      t.integer :desired_salary

      t.timestamps
    end
  end
end
