class VacancyAbility < ActiveRecord::Base
  attr_accessible :ability_id, :vacancy_id

  belongs_to :vacancy
  belongs_to :ability

  validates :vacancy_id, :presence => true, :uniqueness => {:scope => :ability_id}
  validates :ability_id, :presence => true
end
