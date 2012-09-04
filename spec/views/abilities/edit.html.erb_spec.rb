require 'spec_helper'

describe "abilities/edit" do
  before(:each) do
    @ability = assign(:ability, stub_model(Ability,
      :name => "MyString"
    ))
  end

  it "renders the edit ability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => abilities_path(@ability), :method => "post" do
      assert_select "input#ability_name", :name => "ability[name]"
    end
  end
end
