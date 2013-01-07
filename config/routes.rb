Kedvictor::Application.routes.draw do
   
  get "tags/area"

  root :to => "pages#index"
  get "pages/mouse"

  
end
