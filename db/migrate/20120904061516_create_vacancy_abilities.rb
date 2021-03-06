class CreateVacancyAbilities < ActiveRecord::Migration
  def change
    create_table :vacancy_abilities do |t|
      t.integer :vacancy_id
      t.integer :ability_id

      t.timestamps
    end
     add_index :vacancy_abilities, [:vacancy_id, :ability_id], :unique => true
  end
end
