class HomeController < ApplicationController
  def index
    @vacancies = Vacancy.order('id DESC').limit(5)
    @workers = Worker.order('id DESC').limit(5)
  end
end
