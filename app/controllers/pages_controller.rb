class PagesController < ApplicationController
  
  def index
    @title = 'Wellcome'
  end
  
  def mouse  
    @title = 'Mouse training'
    if params[:fs] 
      render "fs_mouse", :layout => 'full_screen'
    end  
  end
end
