require 'spec_helper'

describe "workdays/new.html.haml" do
  before(:each) do
    assign(:workday, stub_model(Workday,
      :date => "MyString",
      :is_workday => false,
      :memo => "MyString"
    ).as_new_record)
  end

  it "renders new workday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workdays_path, :method => "post" do
      assert_select "input#workday_date", :name => "workday[date]"
      assert_select "input#workday_is_workday", :name => "workday[is_workday]"
      assert_select "input#workday_memo", :name => "workday[memo]"
    end
  end
end
