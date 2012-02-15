require 'spec_helper'

describe "workdays/edit.html.haml" do
  before(:each) do
    @workday = assign(:workday, stub_model(Workday,
      :date => "MyString",
      :is_workday => false,
      :memo => "MyString"
    ))
  end

  it "renders the edit workday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workdays_path(@workday), :method => "post" do
      assert_select "input#workday_date", :name => "workday[date]"
      assert_select "input#workday_is_workday", :name => "workday[is_workday]"
      assert_select "input#workday_memo", :name => "workday[memo]"
    end
  end
end
