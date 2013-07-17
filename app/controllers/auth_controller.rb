class AuthController < ApplicationController
  
  def index    
    @agents = Agent.all
    redirect_to(:action => 'ident') unless params[:idented]
  end
  
  def ident
    guid = Time.now.to_i.to_s
    cookies[:guid] = {
      :value => guid,
      :expire => 3.years.from_now
    }
    Agent.create :guid => guid
    redirect_to :action => 'index', :idented => true
  end
  
end
