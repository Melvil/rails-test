require 'spec_helper'

describe "workers/show" do
  before(:each) do
    @worker = assign(:worker, stub_model(Worker,
      :name => "Name",
      :contacts => "MyText",
      :search_status => false,
      :desired_salary => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
