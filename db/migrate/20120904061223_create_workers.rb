class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.text :contacts
      t.boolean :search_status, :null => false, :default => false
      t.integer :desired_salary
      t.integer :abilities_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
