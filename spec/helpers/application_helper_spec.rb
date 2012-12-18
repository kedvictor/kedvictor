require 'spec_helper'

describe ApplicationHelper do

  describe "#title" do
    
    it "should contain predefined title if defined" do
      assign :title, 'some title'
      helper.title.should == 'Victor Kedyulich | some title'
    end
    
    it "should contain 'Wellcome' if @title not defined" do
      assign :title, nil
      helper.title.should == 'Victor Kedyulich | Wellcome'
    end    
  end


end
