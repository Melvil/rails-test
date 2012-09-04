class Worker < ActiveRecord::Base
  attr_accessible :contacts, :desired_salary, :name, :search_status

  has_many :worker_abilities
  has_many :abilities, :through => :worker_abilities, :uniq => true, :order => {:worker_abilities => :id}
end
