# coding: utf-8

require 'spec_helper'

describe Worker do
  before(:each) do
    @worker = Worker.new(
      :name => 'Иванов Иван Иванович',
      :contacts => 'Email: test@test.test; phone: 8 (123) 456-78-90',
      :search_status => true,
      :desired_salary => 100000
    )
  end

  it "Validate" do
    @worker.should be_valid
  end

  describe "Имя" do
    it "не должно быть пустым" do
      @worker.name = nil
      @worker.should_not be_valid
      @worker.errors[:name].should_not be_empty
    end

    it "должно содержать 3 слова" do
      @worker.name = "Иванов Иван"
      @worker.should_not be_valid
      @worker.errors[:name].should_not be_empty

      @worker.name = "Иванов Иван Иванович Тест"
      @worker.should_not be_valid
      @worker.errors[:name].should_not be_empty
    end

    it "только кириллические буквы и пробелы" do
      @worker.name = "Иванов Ivan Иванович"
      @worker.should_not be_valid
      @worker.errors[:name].should_not be_empty
    end
  end

  it "Контактная информация должна содержать номер телефона или адрес эл-почты" do
    @worker.contacts = 'Email: test@test.test; other info'
    @worker.should be_valid

    @worker.contacts = 'Phone: 8 (123) 456-78-90; other info'
    @worker.should be_valid

    @worker.contacts = ''
    @worker.should_not be_valid
    @worker.contacts = 'melvil@gmail'
    @worker.should_not be_valid

    @worker.contacts = 'Other info'
    @worker.should_not be_valid
    @worker.errors[:contacts].should_not be_empty
  end

  it "Статус поиска работы" do
    @worker.search_status = nil
    @worker.should_not be_valid
    @worker.errors[:search_status].should_not be_empty
  end

  it "Желаемая зарплата" do
    @worker.desired_salary = nil
    @worker.should_not be_valid
    @worker.errors[:desired_salary].should_not be_empty
  end

  it "Может иметь несколько умений" do
    @ability1 = Ability.new(:name => "ruby")
    @ability2 = Ability.new(:name => "js")
    @ability3 = Ability.new(:name => "php")

    @worker.abilities << [@ability1, @ability2, @ability3]

    @worker.abilities.delete(@ability2)

    @worker.abilities.should == [@ability1, @ability3]
  end
end