Kedvictor::Application.routes.draw do
   
  get "auth/index"

  root :to => "pages#index"
  
  mount Resque::Server, :at => "/resque"
  
  get "privat_gateway/index"
  post "privat_gateway/send_search_request"
  post "privat_gateway/send_bill_request" 
  
  get "auth/ident" 
  
  
  get "tags/area"
  
  get "pages/resque"  
  get "pages/mouse"
  get "pages/widget"
  get "pages/http_request"  
  
  post "pages/enqueue"
  
end
