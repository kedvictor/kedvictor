Kedvictor::Application.routes.draw do
   
  root :to => "pages#index"
  mount Resque::Server, :at => "/resque"
  
  get "tags/area"
  
  get "pages/resque"  
  get "pages/mouse"
  post "pages/enqueue"
  
end
