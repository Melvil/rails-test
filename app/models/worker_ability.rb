class WorkerAbility < ActiveRecord::Base
  attr_accessible :ability_id, :worker_id

  belongs_to :worker
  belongs_to :ability

  validates :worker_id, :presence => true, :uniqueness => {:scope => :ability_id}
  validates :ability_id, :presence => true
end
