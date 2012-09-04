require 'spec_helper'

describe "abilities/show" do
  before(:each) do
    @ability = assign(:ability, stub_model(Ability,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
