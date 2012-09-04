class Worker < ActiveRecord::Base
  attr_accessible :contacts, :desired_salary, :name, :search_status
end
