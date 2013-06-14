Kedvictor::Application.routes.draw do
   
  root :to => "pages#index"
  
  mount Resque::Server, :at => "/resque"
  
  get "privat_gateway/index"
  post "privat_gateway/send_search_request"
  post "privat_gateway/send_bill_request"
  
  #get "/scripts/show2callback.html"
  
  
  get "tags/area"
  
  get "pages/resque"  
  get "pages/mouse"
  get "pages/widget"  
  
  post "pages/enqueue"
  
end
