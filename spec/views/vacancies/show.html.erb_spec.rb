require 'spec_helper'

describe "vacancies/show" do
  before(:each) do
    @vacancy = assign(:vacancy, stub_model(Vacancy,
      :title => "Title",
      :duration => 1,
      :salary => 2,
      :contacts => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
