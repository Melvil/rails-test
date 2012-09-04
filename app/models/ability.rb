class Ability < ActiveRecord::Base
  attr_accessible :name

  has_many :worker_abilities
  has_many :workers, :through => :worker_abilities

  has_many :vacancy_abilities
  has_many :vacancies, :through => :vacancy_abilities

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
end
