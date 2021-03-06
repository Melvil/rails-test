# coding: utf-8

class Worker < ActiveRecord::Base
  attr_accessible :contacts, :desired_salary, :name, :search_status

  has_many :worker_abilities, :dependent => :destroy
  has_many :abilities, :through => :worker_abilities, :uniq => true #, :order => {:worker_abilities => :id}
  has_many :vacancy_abilities, :through => :abilities

  validates :name, :presence => true, :format => {:with => /^[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+$/}
  validates :contacts, :presence => true, :if => :validate_cotacts_email_or_phone?
#  validates :search_status
  validates :desired_salary, :presence => true

  before_create :default_values


  def validate_cotacts_email_or_phone?
    if !(
      /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+/.match(contacts) ||
      /((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}/.match(contacts)
    )
      errors.add(:contacts, 'Need phone or email')
    end
  end

  def default_values
    self.abilities_count = 0
  end

  def vacancies
    Vacancy.for_worker(id)
  end

# Поиск работников для вакансии:
#    Работник должен искать работу
#    (+)Вывести работников в двух группах которые полностью подходят по набору умений и частично.
#    Дополнительно все вакансии должны быть отсортированы по возрастанию заработной платы предлагаемой и желаемой работником
  def self.for_vacancy(vacancy_id)
    select('workers.*, vv.worker_abilities_count').
    joins("INNER JOIN (
SELECT worker_abilities.worker_id, COUNT(worker_abilities.ability_id) as worker_abilities_count 
FROM vacancy_abilities
  INNER JOIN worker_abilities ON vacancy_abilities.ability_id = worker_abilities.ability_id
    AND vacancy_abilities.vacancy_id = #{vacancy_id}
GROUP BY worker_abilities.worker_id
) as vv ON workers.id = vv.worker_id").
    where(:search_status => true).
    order(:desired_salary)

    # select('workers.*, COUNT(vacancy_abilities.ability_id) as worker_abilities_count').
    # joins(:vacancy_abilities).
    # where({:vacancy_abilities => {:vacancy_id => vacancy_id}}).
    # group(:id).
    # where(:search_status => true).
    # order(:desired_salary)
  end
end
