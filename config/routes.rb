Kedvictor::Application.routes.draw do
   
  root :to => "pages#index"
  
  get "tags/area"
  
  get "pages/resque_job"  
  get "pages/mouse"

  
end
