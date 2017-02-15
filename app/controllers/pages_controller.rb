class PagesController < ApplicationController  

  around_filter :around_call, :only => :except
  
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
  
  def widget
  end 
  
  def http_request 
    @result = request.inspect
  end
  
  def xml_request    
  end

  def except   
    begin     
      @page = 'in method'
      raise 'invalid params'
    rescue => e
      @page = 'in around_call'
      puts e.message
      puts e.backtrace
    end
  end

  private

  def around_call
    yield
  end
  
end
