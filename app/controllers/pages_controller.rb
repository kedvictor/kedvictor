class PagesController < ApplicationController
  
  def index
    @title = 'Wellcome'
  end
  
  def mouse  
    @title = 'Mouse training'       
  end
  
  def resque    
  end
  
  def enqueue 
    name = params['name'].blank? ? 'untitled job' : params['name'] 
    duration = params['duration'].blank? ? 5 : params['duration'] 
    Resque.enqueue(SimpleJob, name, duration.to_i)         
  end
  
end
