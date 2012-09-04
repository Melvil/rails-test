# coding: utf-8

require 'spec_helper'

describe Ability do
  it "Не пустое название" do
    @ability = Ability.new(:name => nil)
    @ability.should_not be_valid
    @ability.errors[:name].should_not be_empty

    @ability = Ability.new(:name => '')
    @ability.should_not be_valid
    @ability.errors[:name].should_not be_empty
  end

  it "Уникальное название" do
    @ability1 = Ability.new(:name => "ruby")
    @ability1.save

    @ability2 = Ability.new(:name => "ruby")
    @ability2.should_not be_valid
    @ability2.errors[:name].should_not be_empty
  end
end