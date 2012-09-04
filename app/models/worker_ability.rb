class WorkerAbility < ActiveRecord::Base
  attr_accessible :ability_id, :worker_id

  belongs_to :worker
  belongs_to :ability
end
