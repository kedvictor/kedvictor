require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'mouse'" do
    it "returns http success" do
      get 'mouse'
      response.should be_success
    end
  end

end
