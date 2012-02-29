require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :title => "Request 1",
      :description => "This is a description of request 1"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_selector(".show_request") do
      rendered.should have_selector(".title", content: @request.title)
      rendered.should have_selector(".description")
    end
  end
end
