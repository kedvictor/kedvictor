class PagesController < ApplicationController
  
  def index
    @title = 'Wellcome'
  end
  
  def mouse  
    @title = 'Mouse training'       
  end
  
  def resque_job
    Resque.enqueue(SimpleJob, "Yahoo!")
    render :nothing => true
  end
  
end
