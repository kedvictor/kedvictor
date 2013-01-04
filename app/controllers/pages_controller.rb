class PagesController < ApplicationController
  
  def index
    @title = 'Wellcome'
  end
  
  def mouse  
    @title = 'Mouse training'       
  end
  
end
