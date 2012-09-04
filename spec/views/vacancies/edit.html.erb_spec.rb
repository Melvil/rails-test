require 'spec_helper'

describe "vacancies/edit" do
  before(:each) do
    @vacancy = assign(:vacancy, stub_model(Vacancy,
      :title => "MyString",
      :duration => 1,
      :salary => 1,
      :contacts => "MyText"
    ))
  end

  it "renders the edit vacancy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vacancies_path(@vacancy), :method => "post" do
      assert_select "input#vacancy_title", :name => "vacancy[title]"
      assert_select "input#vacancy_duration", :name => "vacancy[duration]"
      assert_select "input#vacancy_salary", :name => "vacancy[salary]"
      assert_select "textarea#vacancy_contacts", :name => "vacancy[contacts]"
    end
  end
end
