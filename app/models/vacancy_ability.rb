class VacancyAbility < ActiveRecord::Base
  attr_accessible :ability_id, :vacancy_id

  belongs_to :vacancy
  belongs_to :ability
end
