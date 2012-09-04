# coding: utf-8

class Worker < ActiveRecord::Base
  attr_accessible :contacts, :desired_salary, :name, :search_status

  has_many :worker_abilities
  has_many :abilities, :through => :worker_abilities, :uniq => true, :order => {:worker_abilities => :id}

  validates :name, :presence => true, :format => {:with => /^[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+\s+[а-яА-ЯёЁ]+$/}
  validates :contacts, :presence => true, :if => :validate_cotacts_email_or_phone?
  validates :search_status, :presence => true
  validates :desired_salary, :presence => true


  def validate_cotacts_email_or_phone?
    if !(
      /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+/.match(contacts) ||
      /((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}/.match(contacts)
    )
      errors.add(:contacts, 'Need phone or email')
    end
  end
end
