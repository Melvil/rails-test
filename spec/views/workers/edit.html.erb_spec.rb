require 'spec_helper'

describe "workers/edit" do
  before(:each) do
    @worker = assign(:worker, stub_model(Worker,
      :name => "MyString",
      :contacts => "MyText",
      :search_status => false,
      :desired_salary => 1
    ))
  end

  it "renders the edit worker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workers_path(@worker), :method => "post" do
      assert_select "input#worker_name", :name => "worker[name]"
      assert_select "textarea#worker_contacts", :name => "worker[contacts]"
      assert_select "input#worker_search_status", :name => "worker[search_status]"
      assert_select "input#worker_desired_salary", :name => "worker[desired_salary]"
    end
  end
end
