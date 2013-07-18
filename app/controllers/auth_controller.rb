class AuthController < ApplicationController
  
  def index    
    @agents = Agent.all    
  end
  
  def ident
    guid = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    cookies[:guid] = {
      :value => guid,
      :expire => 3.years.from_now
    }
    Agent.create :guid => guid
    render :text => "document.cookie='guid=112233445566778899'";
  end
  
end
