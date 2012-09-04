class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.datetime :date_create
      t.datetime :date_end
      t.integer :duration
      t.integer :salary
      t.text :contacts
      t.integer :abilities_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
