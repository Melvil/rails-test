class Vacancy < ActiveRecord::Base
  attr_accessible :contacts, :date_create, :date_end, :duration, :salary, :title

  has_many :vacancy_abilities
  has_many :abilities, :through => :vacancy_abilities, :uniq => true #, :order => {:vacancy_abilities => :id}
  has_many :worker_abilities, :through => :abilities

  validates :title, :presence => true, :length => { :maximum => 250 }
  validates :date_create, :presence => true
  validates :duration, :presence => true, :numericality => true
  validates :salary, :presence => true, :numericality => true
  validates :contacts, :presence => true

  before_create :default_values
  before_save :calculate_date_end


  def default_values
    self.abilities_count = 0
  end

  def calculate_date_end
    self.date_end = date_create && duration ? date_create + duration.days : nil
  end


  def workers
    Worker.for_vacancy(id)
  end

# Поиск вакансий для работника:
#   Срок действия вакансий не должен истечь
#   (+) Вывести вакансии в двух группах, которые полностью подходят по набору умений и частично.
#   Все вакансии должны быть отсортированы по убыванию заработной платы
  def self.for_worker(worker_id)
    select('vacancies.*, vv.worker_abilities_count').
    joins("INNER JOIN (
SELECT vacancy_abilities.vacancy_id, COUNT(worker_abilities.ability_id) as worker_abilities_count 
FROM vacancy_abilities
  INNER JOIN worker_abilities ON vacancy_abilities.ability_id = worker_abilities.ability_id
    AND worker_abilities.worker_id = #{worker_id}
GROUP BY vacancy_abilities.vacancy_id
) as vv ON vacancies.id = vv.vacancy_id").
    where('date_end > NOW()').
    order('salary DESC')

   # select('vacancies.*, COUNT(vacancy_abilities.ability_id) as worker_abilities_count').
   # joins(:worker_abilities).
   # where({:worker_abilities => {:worker_id => worker_id}}).
   # group("vacancies.id")
   # where("date_end > NOW()").
   # order('salary DESC')
  end
end
