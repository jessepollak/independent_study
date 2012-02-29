require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :fb_id => "MyString",
      :email => "MyString",
      :number => "MyString",
      :college => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_fb_id", :name => "user[fb_id]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_number", :name => "user[number]"
      assert_select "select#user_college", :name => "user[college]"
    end
  end
end
