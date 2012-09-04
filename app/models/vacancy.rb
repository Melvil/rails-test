class Vacancy < ActiveRecord::Base
  attr_accessible :contacts, :date_create, :date_end, :duration, :salary, :title

  has_many :vacancy_abilities
  has_many :abilities, :through => :vacancy_abilities, :uniq => true, :order => {:vacancy_abilities => :id}

  validates :title, :presence => true, :length => { :maximum => 250 }
  validates :date_create, :presence => true
  validates :duration, :presence => true, :numericality => true
  validates :salary, :presence => true, :numericality => true
  validates :contacts, :presence => true

  before_save :calculate_date_end


  def calculate_date_end
    self.date_end = date_create && duration ? date_create + duration.days : nil
  end
end
