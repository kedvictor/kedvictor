class Engine
    
  def send_ident
    EventMachine.run do
      http1 = EventMachine::HttpRequest.new('http://localhost:3000/identities/ident').get
      http2 = EventMachine::HttpRequest.new('http://localhost:3003/identities/ident').get
    end
    
  end
  
end
