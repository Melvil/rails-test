require 'spec_helper'

describe "abilities/index" do
  before(:each) do
    assign(:abilities, [
      stub_model(Ability,
        :name => "Name"
      ),
      stub_model(Ability,
        :name => "Name"
      )
    ])
  end

  it "renders a list of abilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
