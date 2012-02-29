require 'spec_helper'
require 'webrat'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :title => "Request1",
        :description => "Bloh bloh bloh bloh bloh bloh",
        :date => Time.now + 3.days
      ),
      stub_model(Request,
        :title => "Request2",
        :description => "Blah blah blah blah blah",
        :date => Time.now + 3.days
      )
    ])

    @title = "Pending Requests"
  end

  it "renders a list of requests" do
    render
    rendered.should have_selector('title', content: @title)
    rendered.should have_selector('.request', count: 2)
  end
end
