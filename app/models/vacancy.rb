class Vacancy < ActiveRecord::Base
  attr_accessible :contacts, :date_create, :duration, :salary, :title
end
