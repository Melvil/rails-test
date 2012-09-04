class CreateWorkerAbilities < ActiveRecord::Migration
  def change
    create_table :worker_abilities do |t|
      t.integer :worker_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
