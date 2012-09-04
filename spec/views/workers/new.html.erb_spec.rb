require 'spec_helper'

describe "workers/new" do
  before(:each) do
    assign(:worker, stub_model(Worker,
      :name => "MyString",
      :contacts => "MyText",
      :search_status => false,
      :desired_salary => 1
    ).as_new_record)
  end

  it "renders new worker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workers_path, :method => "post" do
      assert_select "input#worker_name", :name => "worker[name]"
      assert_select "textarea#worker_contacts", :name => "worker[contacts]"
      assert_select "input#worker_search_status", :name => "worker[search_status]"
      assert_select "input#worker_desired_salary", :name => "worker[desired_salary]"
    end
  end
end
