class AuthController < ApplicationController
  
  def index    
    @agents = Agent.all    
  end
  
  def ident   
    
  end
  
end
