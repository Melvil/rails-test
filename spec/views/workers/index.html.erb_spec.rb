require 'spec_helper'

describe "workers/index" do
  before(:each) do
    assign(:workers, [
      stub_model(Worker,
        :name => "Name",
        :contacts => "MyText",
        :search_status => false,
        :desired_salary => 1
      ),
      stub_model(Worker,
        :name => "Name",
        :contacts => "MyText",
        :search_status => false,
        :desired_salary => 1
      )
    ])
  end

  it "renders a list of workers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
