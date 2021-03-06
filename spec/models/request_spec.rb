require 'spec_helper'

describe Request do
  
  before(:each) do
  	@attributes = {
  		:title => "Bicycle",
  		:description => "Give me your bike!",
  		:date => Time.now + 1.day
  	}
  end

  describe 'create new request' do

    it "should allow a new request given valid attributes" do
    	Request.create(@attributes).should be_valid
    end

    it "should not allow a request without a title" do
  	  @attributes[:title] = ""
  	  Request.create(@attributes).should_not be_valid
    end

    it "should not allow a request without a date" do
  	  @attributes[:date] = nil
  	  Request.create(@attributes).should_not be_valid
    end

   it "should allow a request without a description" do
    	@attributes[:description] = ""
    	Request.create(@attributes).should be_valid
   end

   it "should not allow a request with a name and title pair that is not unique" do
    	Request.create(@attributes)
    	Request.create(@attributes).should_not be_valid
   end
  end

  describe "search requests" do

    it "should return all results if user searches empty string" do
      Request.create(@attributes)
      @attributes[:title] = "Tricycle"
      Request.create(@attributes)
      result = Request.search("")
      result.count.should == 2
    end

    it "should return no results if user searches 'abekDikEOwks'" do
      Request.create(@attributes)
      result = Request.search("abekDikEOwks")
      result.count.should == 0
    end

    it "should return one result if user searches 'bicycle'" do
      Request.create(@attributes)
      result = Request.search("bicycle")
      result.count.should == 1
    end

    it "should return one result if user searches 'give me'" do
      Request.create(@attributes)
      result = Request.search("give me")
      result.count.should == 1
    end
  end
  
end
