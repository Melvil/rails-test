class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.datetime :date_create
      t.integer :duration
      t.integer :salary
      t.text :contacts

      t.timestamps
    end
  end
end
