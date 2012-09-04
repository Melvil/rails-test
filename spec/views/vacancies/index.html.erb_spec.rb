require 'spec_helper'

describe "vacancies/index" do
  before(:each) do
    assign(:vacancies, [
      stub_model(Vacancy,
        :title => "Title",
        :duration => 1,
        :salary => 2,
        :contacts => "MyText"
      ),
      stub_model(Vacancy,
        :title => "Title",
        :duration => 1,
        :salary => 2,
        :contacts => "MyText"
      )
    ])
  end

  it "renders a list of vacancies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
