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
    add_index :workers, :name
    add_index :workers, :search_status
    add_index :workers, :desired_salary
    add_index :workers, :abilities_count
  end
end
