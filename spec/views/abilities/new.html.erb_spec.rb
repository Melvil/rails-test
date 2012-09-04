require 'spec_helper'

describe "abilities/new" do
  before(:each) do
    assign(:ability, stub_model(Ability,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new ability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => abilities_path, :method => "post" do
      assert_select "input#ability_name", :name => "ability[name]"
    end
  end
end
