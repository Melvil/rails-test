# coding: utf-8

require 'spec_helper'

describe Vacancy do
  before(:each) do
    @vacancy = Vacancy.new(
      :title => "Требуются программисты (много)",
      :date_create => "2012-09-01",
      :duration => 30,
      :salary => 100000,
      :contacts => "Большая зарплата. Свяжитесь с нами как-нибуть :)"
    )
  end

  it "Validate" do
    @vacancy.should be_valid
  end

  it "Название" do
    @vacancy.title = nil
    @vacancy.should_not be_valid
    @vacancy.errors[:title].should_not be_empty
  end

  it "Дата добавления" do
    @vacancy.date_create = nil
    @vacancy.should_not be_valid
    @vacancy.errors[:date_create].should_not be_empty
  end

  it "Срок действия" do
    @vacancy.duration = nil
    @vacancy.should_not be_valid
    @vacancy.errors[:duration].should_not be_empty
  end


  it "Зарплата" do
    @vacancy.salary = nil
    @vacancy.should_not be_valid
    @vacancy.errors[:salary].should_not be_empty
  end

  it "Контактная информация" do
    @vacancy.contacts = nil
    @vacancy.should_not be_valid
    @vacancy.errors[:contacts].should_not be_empty
  end

  it "Может иметь несколько требуемых умений" do
    @ability1 = Ability.new(:name => "ruby")
    @ability2 = Ability.new(:name => "js")
    @ability3 = Ability.new(:name => "php")

    @vacancy.abilities << [@ability1, @ability2, @ability3]

    @vacancy.abilities.delete(@ability2)

    @vacancy.abilities.should == [@ability1, @ability3]
  end
end
