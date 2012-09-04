require 'spec_helper'

describe "vacancies/new" do
  before(:each) do
    assign(:vacancy, stub_model(Vacancy,
      :title => "MyString",
      :duration => 1,
      :salary => 1,
      :contacts => "MyText"
    ).as_new_record)
  end

  it "renders new vacancy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vacancies_path, :method => "post" do
      assert_select "input#vacancy_title", :name => "vacancy[title]"
      assert_select "input#vacancy_duration", :name => "vacancy[duration]"
      assert_select "input#vacancy_salary", :name => "vacancy[salary]"
      assert_select "textarea#vacancy_contacts", :name => "vacancy[contacts]"
    end
  end
end
